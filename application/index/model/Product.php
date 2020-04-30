<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/7/28
 * Time: 10:07
 */

namespace app\index\model;

use app\index\model\Base as BaseModel;
class Product extends BaseModel

{

    protected $hidden=['centerImg_id','is_hot','category_id','create_time','update_time','delete_time'];

    public static function search($product){
        $arr=array('like','%'.$product.'%');
        return self::where(['name'=>$arr,'status'=>1])->select();
    }

    public static function getProductDetail($id){
//        return self::get($id,['centerImg','images.image']);
        return self::with(['images.image','param'])
            ->with(['standards'=>function($query){
                $query->with(['centerImg'])
                    ->where(['status'=>1]);
            }])
            ->where(['id'=>$id,'status'=>1])->find();
    }

    public static function productsByCategory($cid){
        return self::with(['centerImg'])->where(['category_id'=>$cid])->order('create_time desc')->paginate(16);
    }

    public static function getHot(){
        return self::with(['centerImg'])->where(array('status'=>1))->order('sell desc')->paginate(12);
    }

    public static function getRencently(){
        return self::with(['centerImg'])->where(array('status'=>1))->order('create_time desc')->paginate(12);
    }

    public static function  productsByCategoryAndSell($cid){
        if($cid==0){
            return self::with(['centerImg'])->where(array('status'=>1))->order('sell desc')->paginate(12);
        }else{
            return self::with(['centerImg'])->where(array('status'=>1,'category_id'=>$cid))->order('sell desc')->paginate(12);
        }
    }
    public static function  productsByCategoryAndPriceUp($cid){
        if($cid==0){
            return self::with(['centerImg'])->where(array('status'=>1))->order('price asc')->paginate(12);
        }else{
            return self::with(['centerImg'])->where(array('status'=>1,'category_id'=>$cid))->order('price asc')->paginate(12);
        }
    }
    public static function  productsByCategoryAndPriceDown($cid){
        if($cid==0){
            return self::with(['centerImg'])->where(array('status'=>1))->order('price desc')->paginate(12);
        }else{
            return self::with(['centerImg'])->where(array('status'=>1,'category_id'=>$cid))->order('price desc')->paginate(12);
        }
    }

    public function centerImg(){
        return $this->belongsTo('Image','centerImg_id','id');
    }
    public function images(){
        return $this->hasMany('Product_Image','product_id','id');
    }

    public function category()
    {
        return $this->belongsTo('Category','category_id','id');
    }

    public function standards(){
        return $this->hasMany('Standard','product_id','id');
    }

   public function param(){
       return $this->hasOne('Param','product_id','id');

   }
}