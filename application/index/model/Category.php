<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/7/28
 * Time: 11:43
 */

namespace app\index\model;

use app\index\model\Base as BaseModel;
class Category extends BaseModel
{
//    public static function getAll(){
//        return self::with(['products'=>function($query){
//            $query->with(['centerImg'])
//                ->where(['status'=>1]);
//        }])
//            ->select();
//    }

    public static function getAll(){

        $categories=self::where(array('pid'=>0))->order('create_time asc')->select();
        foreach($categories as $vo){
            $array=self::with(['centerImg'])
                ->where(array('pid'=>$vo['id']))
                ->order('create_time asc')->select();
            $category_name[$vo['name']]=$array;
        }
        return $category_name;
    }

//
//    public static function getOne($id){
//        return self::with(['products'=>function($query){
//            $query->with(['centerImg'])
//                ->where(['status'=>1]);
//            }])
//            ->where(array('id'=>$id))->find();
//    }

    public static function getOne($id){
        return self::where(array('id'=>$id))->find();
    }


    public function products(){
        return $this->hasMany('Product','category_id','id');
    }

    public function centerImg(){
        return $this->belongsTo('Image','centerImg_id','id');
    }
}