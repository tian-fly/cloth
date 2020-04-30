<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/7/29
 * Time: 10:10
 */

namespace app\index\controller;
use app\index\model\Category as CategoryModel;
use app\index\controller\Base as BaseController;
use app\index\validate\IDNumber as IDNumberValidate;
use app\lib\exception\Miss as MissException;
use app\index\model\Product as ProductModel;
class Category extends BaseController
{


    public function getAllCategory(){
        $index =isset( $_GET['index'])?$_GET['index']:1;
        $cid =isset( $_GET['category_id'])?$_GET['category_id']:0;

        $categories=CategoryModel::getAll();
        $products =  ProductModel::getRencently();

        $this->assign('categories',$categories);
        $this->assign('products',$products);

        $visit=cookie('visit');
        $ids=array('in',$visit);
        $visitProduct=ProductModel::with('centerImg')->where(['id'=>$ids])->select();
        $this->assign('visitProduct',$visitProduct);

        $this->assign('category_id',$cid);
        $this->assign('index',$index);

        return $this->fetch('index');
    }

    public function productsByCategoryAndSell(){
        $cid = input('get.category_id');
        $index =input('get.index');

        $categories=CategoryModel::getAll();
        $products =  ProductModel::productsByCategoryAndSell($cid);

        $this->assign('categories',$categories);
        $this->assign('products',$products);

        $visit=cookie('visit');
        $ids=array('in',$visit);
        $visitProduct=ProductModel::with('centerImg')->where(['id'=>$ids])->select();
        $this->assign('visitProduct',$visitProduct);

        $this->assign('category_id',$cid);
        $this->assign('index',$index);

        return $this->fetch('index');
    }

    public function productsByCategoryAndPriceUp(){
        $cid = input('get.category_id');
        $index =input('get.index');

        $categories=CategoryModel::getAll();
        $products =  ProductModel::productsByCategoryAndPriceUp($cid);

        $this->assign('categories',$categories);
        $this->assign('products',$products);

        $visit=cookie('visit');
        $ids=array('in',$visit);
        $visitProduct=ProductModel::with('centerImg')->where(['id'=>$ids])->select();
        $this->assign('visitProduct',$visitProduct);

        $this->assign('category_id',$cid);
        $this->assign('index',$index);

        return $this->fetch('index');
    }

    public function productsByCategoryAndPriceDown(){
        $cid = input('get.category_id');
        $index =input('get.index');

        $categories=CategoryModel::getAll();
        $products =  ProductModel::productsByCategoryAndPriceDown($cid);

        $this->assign('categories',$categories);
        $this->assign('products',$products);

        $visit=cookie('visit');
        $ids=array('in',$visit);
        $visitProduct=ProductModel::with('centerImg')->where(['id'=>$ids])->select();
        $this->assign('visitProduct',$visitProduct);

        $this->assign('category_id',$cid);
        $this->assign('index',$index);

        return $this->fetch('index');
    }

    public function getOneCategoryProducts($id,$index){
        (new IDNumberValidate())->checked();
        $category = CategoryModel::getOne($id);
        if(!$category){
            throw new MissException([
               'msg'=>'您找的分类不存在...',
                'errorCode'=>'3001'
            ]);
        }

        $products = ProductModel::productsByCategory($id);

        $visit=cookie('visit');
        $ids=array('in',$visit);
        $visitProduct=ProductModel::with('centerImg')->where(['id'=>$ids])->select();
        $categories=CategoryModel::getAll();

        $this->assign('categories',$categories);
        $this->assign('visitProduct',$visitProduct);
        $this->assign('products',$products);
        $this->assign('category_id',$id);
        $this->assign('index',$index);
        return $this->fetch('index');
    }


}