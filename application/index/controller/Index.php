<?php
namespace app\index\controller;
use app\index\model\Product;
use think\Controller;
use app\index\model\Product as ProductModel;
use app\index\model\Category as CategoryModel;
use think\captcha\Captcha;
use app\index\model\Banner as BannerModel;
class Index extends  Controller
{
    public function index()
    {
        $banner=BannerModel::getBanner(1);
        $this->assign('banner',$banner);

        $productsH=ProductModel::getHot();
        $this->assign('products',$productsH);
        $this->assign('active',0);
        return $this->fetch();

    }

    public function rencent(){
        $banner=BannerModel::getBanner(1);
        $this->assign('banner',$banner);

        $productsR=Product::getRencently();
        $this->assign('products',$productsR);
        $this->assign('active',1);
        return $this->fetch('index');
    }
}
