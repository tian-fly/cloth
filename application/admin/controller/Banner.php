<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/10/9
 * Time: 23:08
 */

namespace app\admin\controller;
use app\admin\controller\Base as BaseController;
use app\admin\model\Category as CategoryModel;
use app\admin\model\Product as ProductModel;
use app\admin\model\Banner as BannerModel;
use think\Db;
use think\Request;
use app\admin\model\BannerItem;
use app\admin\model\Image as ImageModel;
class Banner extends BaseController
{
    public function banner_list()
    {
        $this->no_login();
        $banners=BannerModel::order(['id asc'])->paginate(7);
        $count=count($banners);
        $this->assign('count', $count);
        $this->assign('banner_list', $banners);
        $this->assign('menu', '轮播管理');
        $this->assign('menuSon', '轮播列表');
        return $this->fetch();
    }

    public function banner_edit()
    {
        $id=input('get.id');
        $banner=BannerModel::get(['id'=>$id]);
        $this->assign('banner',$banner);
        return $this->fetch();
    }

    public function save_banner(Request $request)
    {
        $id=$request->param('id');
        $data=$request->except('id');
        if($id>0){
            $update=BannerModel::update($data,['id'=>$id]);
            if($update){
                exit(json_encode(array('status'=>1,'message'=>'修改成功')));
            }else{
                exit(json_encode(array('status'=>0,'message'=>'修改失败')));

            }
        }else{
            $has = BannerModel::getBySite($data['site']);
            if ($has) {
                return [
                    'status' => 0,
                    'message' => 'banner已存在'
                ];
            }
            $insert=BannerModel::create($data);
            if($insert){
                exit(json_encode(array('status'=>1,'message'=>'添加成功')));

            }else{
                exit(json_encode(array('status'=>0,'message'=>'添加失败')));
            }
        }
    }


    public function banner_del()
    {
        $bid = input('get.id');
        $banner=BannerModel::get($bid);
        if(count($banner->bannerItem)>0){
            Db::startTrans();
            $a=$banner->delete();
            $b=$banner->bannerItem()->delete();
            if($a && $b){
                Db::commit();
                return ['status'=>1];
            }else{
                Db::rollback();
                return ['status'=>0];
            }
//            return ['status'=>1];
        }else{
            $c=$banner->delete();
            if($c){
                return ['status'=>1];
            }else{
                return ['status'=>0];
            }
        }

    }

    public function getChildrenCategory(){
        $category_id = input('get.category');
        $categories=CategoryModel::where(['pid'=>$category_id])->select();
        if($categories){
            return [
                'status'=>1,
                'data'=>$categories,
            ];
        }else{
            return [
                'status'=>0
            ];
        }

    }

    public function item(){
        $id=input('get.id');
        $name=BannerModel::where(['id'=>$id])->value('site');
        $items=BannerItem::with('images,product')->where(['banner_id'=>$id])->select();
        $count=count($items);
        $this->assign('count', $count);
        $this->assign('banner_id', $id);
        $this->assign('item_list', $items);
        $this->assign('menu', '轮播管理');
        $this->assign('menuSon', '轮播列表');
        $this->assign('menuSun', $name);
        $this->assign('menuSunf', 'item');
        return $this->fetch();
    }

    public function item_picture(){
        $id=input('get.id');
        $banneritem=BannerItem::get($id,['images']);
        $this->assign('banneritem',$banneritem);
        return $this->fetch();
    }

    public function uploadPicture(){
        $banner_id=input('post.banner_id');
        $site=BannerModel::where(['id'=>$banner_id])->value('site');
        $address=ROOT_PATH . 'public' . DS . 'images/banner/'.$site.'/item';
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');

        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['size'=>2000000,'ext'=>'jpg,png,gif,jpeg'])->move($address);

        if($info){

//            写入数据库
            $img=ImageModel::create(['img_url'=> '/images/banner/'.$site.'/item/'.$info->getSaveName()]);

            if($img){
                return ['status'=>1,'message'=>'添加图片成功','img_url'=>$img->getData('img_url'),'img_id'=>$img->getData('id')];
            }else{
                return ['status'=>0,'message'=>'上传失败，未知错误'];
            }

        }else{
            // 上传失败获取错误信息
            return ['status'=>0,'message'=>$file->getError()];
        }
    }

    public function changePictureBefore(){
        $banner_id=input('post.banner_id');
        $site=BannerModel::where(['id'=>$banner_id])->value('site');
        $img_id=input('post.img_id');
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');
        $address=ROOT_PATH . 'public' . DS . 'images/banner/'.$site.'/item';
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['size'=>20000000,'ext'=>'jpg,png,gif,jpeg'])->move($address);

        if($info){
            //写入数据库
            $img=ImageModel::get($img_id);
            if($img->getData('img_url')){
                if(file_exists(ROOT_PATH . 'public' .$img->getData('img_url'))){
                    unlink(ROOT_PATH . 'public' .$img->getData('img_url'));
                }
            }
            $img->img_url='/images/banner/'.$site.'/item/'.$info->getSaveName();
            $result=$img->save();

            if($result){
                return ['status'=>1,'message'=>'修改图片成功','img_url'=>$img->getData('img_url')];
            }else{
                return ['status'=>0,'message'=>'上传失败，未知错误'];
            }

        }else{
            // 上传失败获取错误信息
            return ['status'=>0,'message'=>$file->getError()];
        }
    }

    public function changePicture(){

        $img_id=input('post.img_id');
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');
        $banneritem_id=input('post.banneritem_id');
        $bannerItem = BannerItem::with('banner')->where(['id'=>$banneritem_id])->find();
        $banner_name = $bannerItem['banner']['site'];
        $address=ROOT_PATH . 'public' . DS . 'images/banner/'.$banner_name.'/item';
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['size'=>20000000,'ext'=>'jpg,png,gif,jpeg'])->move($address);

        if($info){
            //写入数据库
            $img=ImageModel::get($img_id);
            if($img->getData('img_url')){
                if(file_exists(ROOT_PATH . 'public' .$img->getData('img_url'))){
                    unlink(ROOT_PATH . 'public' .$img->getData('img_url'));
                }
            }
            $img->img_url='/images/banner/'.$banner_name.'/item/'.$info->getSaveName();
            $result=$img->save();

            if($result){
                return ['status'=>1,'message'=>'修改图片成功','img_url'=>$img->getData('img_url')];
            }else{
                return ['status'=>0,'message'=>'上传失败，未知错误'];
            }

        }else{
            // 上传失败获取错误信息
            return ['status'=>0,'message'=>$file->getError()];
        }
    }

    public function save_item()
    {
        $data=input('post.');
        $insert=BannerItem::create($data);
        if($insert){
            exit(json_encode(array('status'=>1,'message'=>'添加成功')));

        }else{
            exit(json_encode(array('status'=>0,'message'=>'添加失败')));
        }

    }
    public function item_add()
    {
        $id=input('get.id');
        $this->assign('banner_id',$id);
        $bannerItem=BannerItem::get($id,['product.category','product']);
        $category=CategoryModel::where(['pid'=>0])->order(['id asc'])->select();
        $this->assign('category',$category);

        $pid=CategoryModel::where(['id'=>$bannerItem['product']['category_id']])->value('pid');
        $categorySecond=CategoryModel::where(['pid'=>$pid])->order(['id asc'])->select();



        $products=ProductModel::where(['category_id'=>$bannerItem['product']['category_id']])->select();

        $this->assign('bannerItem',$bannerItem);
        $this->assign('categorySecond',$categorySecond);

        $brands=array();
        foreach($products as $value){
            array_push($brands,$value['brand']);
        }
        $brands=array_unique($brands);
        $this->assign('brands',$brands);

        $productss=ProductModel::where(['brand'=>$bannerItem['product']['brand']])->select();

        $this->assign('products',$productss);

        return $this->fetch();
    }

    public function item_cancels()
    {
        $img_id=input('post.img_id');
        if($img_id){
            $img=ImageModel::get($img_id);
            if($img->getData('img_url')){
                if(file_exists(ROOT_PATH . 'public' .$img->getData('img_url'))){
                    unlink(ROOT_PATH . 'public' .$img->getData('img_url'));
                }
            }
            if($img->delete()){
                exit(json_encode(array('status'=>1,'message'=>'删除成功')));

            }else{
                exit(json_encode(array('status'=>0,'message'=>'删除失败')));
            }
        }

        exit(json_encode(array('status'=>1,'message'=>'删除成功，可以退出本页面')));


    }

    public function item_del(){
        $id=input('get.id');
        $bannerItem=BannerItem::get($id);
        $bannerItem->delete();

    }
    public function item_product(){
        $id=input('get.id');
        $bannerItem=BannerItem::get($id,['product.category','product']);
        $category=CategoryModel::where(['pid'=>0])->order(['id asc'])->select();
        $this->assign('category',$category);

        $pid=CategoryModel::where(['id'=>$bannerItem['product']['category_id']])->value('pid');
        $categorySecond=CategoryModel::where(['pid'=>$pid])->order(['id asc'])->select();



        $products=ProductModel::where(['category_id'=>$bannerItem['product']['category_id']])->select();

        $this->assign('bannerItem',$bannerItem);
        $this->assign('categorySecond',$categorySecond);

        $brands=array();
        foreach($products as $value){
            array_push($brands,$value['brand']);
        }
        $brands=array_unique($brands);
        $this->assign('brands',$brands);

        $productss=ProductModel::where(['brand'=>$bannerItem['product']['brand']])->select();

        $this->assign('products',$productss);

        return $this->fetch();
    }

    public function save_item_product(){
        $bid=input('post.bid');
        $product_id=input('post.product_id');
        $bannerItem=BannerItem::get($bid);
        $bannerItem->product_id=$product_id;
       if( $bannerItem->save()){
           return ['status'=>1,'message'=>'重新绑定商品成功'];
       }else{
           return ['status'=>0];
       }
    }
}