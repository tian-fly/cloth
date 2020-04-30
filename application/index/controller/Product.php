<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/7/28
 * Time: 10:06
 */

namespace app\index\controller;
use app\index\controller\Base as BaseController;
use app\index\model\Product as ProductModel;
use app\index\validate\IDNumber as IDNumberValidate;
use app\lib\exception\Miss;
use app\index\model\Standard;
use app\index\model\Comment as CommentModel;
class Product extends BaseController
{
    public function getOne($id){
       (new IDNumberValidate())->checked();
        $productDetail=ProductModel::getProductDetail($id);
//     return $productDetail;
//         $sell=Standard::where(['product_id'=>$productDetail['id']])->sum('sell');
//        $productDetail['sell']=$sell;

         if(!$productDetail){
            throw new Miss([
               'msg'=>'您所找的商品不存在、、、',
                'errorCode'=>'40001'
            ]);
        }

        $this->visitCookie($id);


//        return $productDetail['standards'];
        $color=array();
        foreach($productDetail['standards'] as $item){
            array_push($color,$item['color']);
        }
        $color=array_unique($color);

        $size=array();
        foreach($productDetail['standards'] as $item){
            array_push($size,$item['size']);
        }
        $size=array_unique($size);

        $productDetail['color']=$color;
        $productDetail['size']=$size;
        $this->assign('productDetail',$productDetail);


        $visit=cookie('visit');
        $ids=array('in',$visit);
        $visitProduct=ProductModel::with('centerImg')->where(['id'=>$ids])->select();
        $this->assign('visitProduct',$visitProduct);

        $comments = CommentModel::comments($id);
        $this->assign('comments',$comments);

        return $this->fetch('index');
    }
    public function getHotProducts(){
      $hotProducts=ProductModel::getHot();
       return $hotProducts;
    }

    public function getRencentlyProducts(){
        $rencentlyProducts=ProductModel::getRencently();
        return $rencentlyProducts;
    }

    public function test(){
        return cookie('visit');
    }



    public function getProductPicture(){
        $pid=input('get.pid');
        $color=input('get.color');
        $size=input('get.size');

//        $mem = new \Memcache();
//        if(!$mem->connect('127.0.0.1',11211)) {
            $product = ProductModel::get($pid);
            $standard = $product->standards()->with('centerImg')->where(['color' => $color, 'size' => $size])->find();
            if ($standard) {
                return [
                    'status' => 1,
                    'message' => $standard['centerImg']['img_url'],
                    'sid' => $standard->getData('id'),
                    'stock' => $standard->getData('stock'),
                ];
            } else {
                return [
                    'status' => 0,
                    'message' => '暂无此规格，请君另选'
                ];
            }
        
//        }else{
//            $hasStandard=$mem->get('picture'.$pid);
//            if($hasStandard){
////            foreach(array_keys($hasStandard) as $key){
//                for($i=0;$i<count($hasStandard);$i++){
//                    if(($hasStandard[$i]['color'] == $color) && ($hasStandard[$i]['size'] == $size)){
//                        return [
//                            'status'=>1,
//                            'message'=>$hasStandard[$i]['message'],
//                            'sid'=>$hasStandard[$i]['sid'],
//                            'stock'=>$hasStandard[$i]['stocks'],
//                        ];
//                    }
//                }
//                return [
//                    'status'=>0,
//                    'message'=>'暂无此规格，请君另选'
//                ];
//            }else{
//                $product=ProductModel::get($pid);
//
//                $newArr=array();
//                foreach($product->standards as $item){
//                    $items['message']=$item['centerImg']['img_url'];
//                    $items['sid']=$item['id'];
//                    $items['stocks']=$item['stock'];
//                    $items['color']=$item['color'];
//                    $items['size']=$item['size'];
//                    $newArr[]=$items;
//                }
//                $mem->set('picture'.$pid,$newArr,false,120);
//                $standard=$product->standards()->with('centerImg')->where(['color'=>$color,'size'=>$size])->find();
//                if($standard){
//                    return [
//                        'status'=>1,
//                        'message'=>$standard['centerImg']['img_url'],
//                        'sid'=>$standard->getData('id'),
//                        'stock'=>$standard->getData('stock'),
//                    ];
//                }else{
//                    return [
//                        'status'=>0,
//                        'message'=>'暂无此规格，请君另选'
//                    ];
//                }
//            }
//        }


    }


    public function visitCookie($id){
        $visit=cookie('visit');
        $visit_arr=explode(',',$visit);
        if(count($visit_arr)>1){
            if(!in_array($id,$visit_arr)){
                $visit.=$id.',';
                cookie('visit',$visit,60*60*24);
            }else{
                cookie('visit',$visit,60*60*24);
            }

        }else{
            $visit.=$id.',';
            cookie('visit',$visit,60*60*24);
        }
    }

    public function search(){
        $product=input('get.product');
        $products=ProductModel::search($product);
        $this->assign('products',$products);

        $visit=cookie('visit');
        $ids=array('in',$visit);
        $visitProduct=ProductModel::with('centerImg')->where(['id'=>$ids,'status'=>1])->select();
        $this->assign('visitProduct',$visitProduct);


        return $this->fetch();
    }




}