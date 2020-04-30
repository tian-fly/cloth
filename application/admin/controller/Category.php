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
use app\admin\model\Image as ImageModel;
use think\Db;
use think\Request;


class Category extends BaseController
{
    public function category_list()
    {
        $this->no_login();
        $pid=isset($_GET['pid'])?$_GET['pid']:0;
        $count=CategoryModel::where(['pid'=>$pid])->count();
        $categories=CategoryModel::with('centerImg')->where(['pid'=>$pid])->order(['id asc'])->paginate(7);
        if(count($categories)==0){
            echo "<meta http-equiv='Content-Type' content='text/html;charset=utf-8'>";
            echo "<script charset='utf-8'>alert('当前分类么有子分类');history.back();</script>";
            exit();
        }
        $this->assign('pid',$pid);

        $this->assign('count', $count);
        $this->assign('category_list', $categories);
        $this->assign('menu', '分类管理');
        $this->assign('menuSon', '分类列表');
        return $this->fetch();
    }

    public function add()
    {
        $id=input('get.id');
        $category=CategoryModel::get(['id'=>$id]);
        $category_list_zero=CategoryModel::where(['pid'=>0])->order(['id asc'])->select();
        $this->assign('category_list_zero',$category_list_zero);
        $this->assign('category',$category);
        return $this->fetch();
    }

    public function save(Request $request)
    {
//        $data = input('post.');
//


        $id=$request->param('id');
        $data=$request->except('id');
        if($id>0){
            $update=CategoryModel::update($data,['id'=>$id]);
            if($update){
                exit(json_encode(array('status'=>1,'message'=>'修改成功')));
            }else{
                exit(json_encode(array('status'=>0,'message'=>'修改失败')));

            }
        }else{
            $has = CategoryModel::getByName($data['name']);
            if ($has) {
                return [
                    'status' => 0,
                    'message' => '分类已存在'
                ];
            }
            $insert=CategoryModel::create($data);
            if($insert){
                exit(json_encode(array('status'=>1,'message'=>'添加成功')));

            }else{
                exit(json_encode(array('status'=>0,'message'=>'添加失败')));
            }
        }
    }

    public function products()
    {
        $this->no_login();
        $cid = input('get.cid');
        $products = ProductModel::getAllByCategory($cid);
        $count = count($products);
        if ($count == 0) {
            echo "<meta http-equiv='content-type' charset='utf-8' content='text/html'>";
            echo "<script>alert('该分类暂未添加商品');history.back()</script>";
            exit();
        }
        $this->assign('count', $count);
        $this->assign('product_list', $products);
        $this->assign('menu', '分类管理');
        $this->assign('menuSon', '分类列表');
        $this->assign('menuSun', '商品列表');
        $this->assign('cid',$cid);
        $menu_name = $this->menu_lists();
        $this->assign('menu_list', $menu_name);
        return $this->fetch();
    }

    public function category_del()
    {
        $cid = input('get.id');
        $father = CategoryModel::get($cid);
        if($father->getData('pid')==0){
            $categorys=CategoryModel::all();
            foreach($categorys as $values){
                if($values['pid']==$cid){
                    $menuSon=CategoryModel::get($values['id']);
                    Db::startTrans();
                    try {
                        $menuSon->delete();
                        Db::commit();

                    }catch(\Exception $e){
                        Db::rollback();
                        return [
                            'status'=>0,
                            'message'=>'删除失败'
                        ];
                    }
                }
            }
            $father->delete();
            return [
                'status'=>1,
                'message'=>'删除成功'
            ];
        }else{
                if($father->delete()){
                    return [
                        'status'=>1,
                        'message'=>'删除成功'
                    ];
                }else{
                    return [
                        'status'=>0,
                        'message'=>'删除失败'
                    ];
                }
        }

    }

    public function category_product_del()
    {
        $cid = input('get.id');
        $father = CategoryModel::get($cid);
        if($father->getData('pid')==0){
            $categorys=CategoryModel::all();
            foreach($categorys as $values){
                if($values['pid']==$cid){
                    $menuSon=CategoryModel::get($values['id']);
                    Db::startTrans();
                    try {
                        $menuSon->products()->delete();
                        $products = ProductModel::where(['category_id' => $cid])->select();
                        foreach ($products as $item) {
                            $item->standards()->delete();
                            $item->param()->delete();
                        }
                        $menuSon->delete();
                        Db::commit();

                    }catch(\Exception $e){
                        Db::rollback();
                        return [
                            'status'=>0,
                            'message'=>'删除失败'
                        ];
                    }
                }
            }
            $father->delete();
            return [
                'status'=>1,
                'message'=>'删除成功'
            ];
        }else{
            Db::startTrans();
            try {
                $father->products()->delete();
                $products = ProductModel::where(['category_id' => $cid])->select();
                foreach ($products as $item) {
                    $item->standards()->delete();
                    $item->param()->delete();
                }
                $father->delete();
                Db::commit();
                return [
                    'status'=>1,
                    'message'=>'删除成功'
                ];
            }catch(\Exception $e){
                Db::rollback();
                return [
                    'status'=>0,
                    'message'=>'删除失败'
                ];
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

    public function getChildrenCategorys(){

        $arr=array();

        $category_id = input('get.category');
        $categories=CategoryModel::where(['pid'=>$category_id])->select();

        $products=ProductModel::where(['category_id'=>$categories[0]['id']])->select();
        if(count($products)>0){
            $brands=array();
            foreach($products as $value){
                array_push($brands,$value['brand']);
            }
            $brands=array_values(array_unique($brands));
            $products=ProductModel::where(['brand'=>$brands[0]])->select();

        }else{
            $brands=[];
            $products=[];
        }

        $arr['categories']=$categories;
        $arr['brands']=$brands;
        $arr['products']=$products;

        if($categories){
            return [
                'status'=>1,
                'data'=>$arr,
            ];
        }else{
            return [
                'status'=>0
            ];
        }

    }

    public function getBrand(){

        $arr=array();

        $category_id = input('get.categorySecond');
        $products=ProductModel::where(['category_id'=>$category_id])->select();

        if(count($products)>0){
            $brands=array();
            foreach($products as $value){
                array_push($brands,$value['brand']);
            }
            $brands=array_values(array_unique($brands));
            $products=ProductModel::where(['brand'=>$brands[0]])->select();

        }else{
            $brands=[];
            $products=[];
        }


        $arr['brands']=$brands;
        $arr['products']=$products;


        if($brands){
            return [
                'status'=>1,
                'data'=>$arr,
            ];
        }else{
            return [
                'status'=>0
            ];
        }

    }
    public function getProduct(){
        $brand = input('get.brand');
        $products=ProductModel::where(['brand'=>$brand])->select();
        if($products){
            return [
                'status'=>1,
                'data'=>$products,
            ];
        }else{
            return [
                'status'=>0
            ];
        }

    }


    public function select(){
        $id=input('get.id');
        $category=CategoryModel::get($id,['centerImg']);
        $this->assign('category',$category);
        return $this->fetch();
    }

    public function uploadPicture(){

        $category_id=input('post.category_id');

        $category = CategoryModel::where(['id'=>$category_id])->field('name,pid')->find();
        $category_name = $category['name'];
        $parent_category_name = CategoryModel::where(['id'=>$category['pid']])->value('name');

        $address=ROOT_PATH . 'public' . DS . '/images/'.$parent_category_name.'/'.$category_name.'/a';
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');

        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['size'=>2000000,'ext'=>'jpg,png,gif,jpeg'])->move($address);

        if($info){

//            写入数据库
            $img=ImageModel::create(['img_url'=> '/images/'.$parent_category_name.'/'.$category_name.'/a/'.$info->getSaveName()]);

            $result=CategoryModel::where(['id'=>$category_id])->update(['centerImg_id'=>$img->getData('id')]);

            if($result){
                return ['status'=>1,'message'=>'添加图片成功','img_url'=>$img->getData('img_url')];
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
        $category_id=input('post.category_id');
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');
        $category = CategoryModel::where(['id'=>$category_id])->field('name,pid')->find();
        $category_name = $category['name'];
        $parent_category_name = CategoryModel::where(['id'=>$category['pid']])->value('name');
        $address=ROOT_PATH . 'public' . DS . '/images/'.$parent_category_name.'/'.$category_name.'/a';
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
            $img->img_url='/images/'.$parent_category_name.'/'.$category_name.'/a/'.$info->getSaveName();
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



}