
<?php

/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/8/11
 * Time: 12:49
 */
use app\index\model\Standard as StandardModel;
use app\index\model\Category as CategoryModel;
function getStandardImg($sid){
$standard=StandardModel::get($sid,'centerImg');
return $standard->centerImg->img_url;
}

function getStandard($sid){
$standard=StandardModel::get($sid);
return $standard->color.'+'.$standard->size;
}

function parentName($pid){
    $cname = CategoryModel::where(['id'=>$pid])->value('name');
    return $cname;
}

function getPicture($value){
    $pictureList = config('picture.pictures');
    return $pictureList[$value];
}