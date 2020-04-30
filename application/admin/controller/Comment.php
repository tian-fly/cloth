<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/11/11
 * Time: 10:37
 */

namespace app\admin\controller;
use app\admin\controller\Base as BaseController;
use app\admin\model\Comment as CommentModel;
use app\admin\model\Product as ProductModel;
use app\admin\model\Category as CategoryModel;
class Comment extends BaseController
{
    public function comment_list(){
        $this->no_login();
        $this->assign('count',0);
        $comments = CommentModel::comments(0);
        $this->assign('comment_list',$comments);
        $this->assign('menu','商品评论管理');
        $this->assign('menuSon','商品评论列表');
        $this->select();
        return $this->fetch();
    }

    protected function aa($pid){
        $category=CategoryModel::where(['pid'=>$pid])->find();
        $categorys=CategoryModel::where(['id'=>$category['id']])->find();
        return ProductModel::where(['category_id'=>$categorys['id']])->value('id');
    }

    protected function bb(){

    }

    protected function select(){


        $category=CategoryModel::where(['pid'=>0])->order(['id asc'])->select();
        $this->assign('category',$category);

        $product_id=isset($_GET['product_id'])?$_GET['product_id']:$this->aa($category[0]['id']);

       $product=ProductModel::with(['category'])->where(['id'=>$product_id])->find();
        $category_id=$product['category_id'];

        $this->assign('product',$product);

        $pid=CategoryModel::where(['id'=>$category_id])->value('pid');
        $categorySecond=CategoryModel::where(['pid'=>$pid])->order(['id asc'])->select();



        $products=ProductModel::where(['category_id'=>$category_id])->select();

        $this->assign('categorySecond',$categorySecond);

        $brands=array();
        foreach($products as $value){
            array_push($brands,$value['brand']);
        }
        $brands=array_unique($brands);
        $this->assign('brands',$brands);

        $productss=ProductModel::where(['brand'=>$product['brand']])->select();

        $this->assign('products',$productss);
    }

    public function search(){
        $this->no_login();
        $this->select();
        $id = input('get.product_id');
        $comments = CommentModel::comments($id);
        $count = count($comments);
        $this->assign('count',$count);
        $this->assign('comment_list',$comments);
        $this->assign('menu','商品评论管理');
        $this->assign('menuSon','商品评论列表');
        return $this->fetch('comment_list');
    }

    public function comment_del(){
        $id=input('get.id');
        $comment=CommentModel::get($id);
        $comment->delete();
    }

   public function deleteAll(){
       $idsArr=input('param.ids/a');
       foreach($idsArr as $value){
           $comment=CommentModel::get($value);
           if(!$comment->delete()){
               return [
                   'status'=>0,
                   'message'=>'删除失败'
               ];
           }
       }
       return [
           'status'=>1,
           'message'=>'删除成功'
       ];
   }
}