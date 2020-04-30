<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/10/4
 * Time: 10:29
 */

namespace app\admin\model;
use app\admin\model\Base as BaseModel;

class Comment extends BaseModel
{

    public static function comments($pid){
        return self::with('standard,user')->where(['product_id'=>$pid])->paginate(10);
    }

    public function standard(){
        return $this->belongsTo('Standard','standard_id','id');
    }

    public function user(){
        return $this->belongsTo('User','user_id','id');
    }
}