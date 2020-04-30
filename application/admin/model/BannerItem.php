<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/7/27
 * Time: 12:12
 */

namespace app\admin\model;


use app\admin\model\Base as BaseModel;

class BannerItem extends BaseModel
{


    public function images(){
        return $this->belongsTo('Image','img_id','id');
    }

    public function product(){
        return $this->belongsTo('Product','product_id','id');
    }

    public function banner(){
        return $this->belongsTo('Banner','banner_id','id');
    }


}