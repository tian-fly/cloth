<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/9/11
 * Time: 22:01
 */

namespace app\admin\model;
use app\admin\model\Base as BaseModel;
use traits\model\SoftDelete;


class Role extends BaseModel
{
    use SoftDelete;
    protected $auto=[
        'delete_time'=>NULL,

    ];
    protected $insert=[
        'is_delete'=>1
    ];




    public function getStatusAttr($value){
        $status=[
            0=>'已停用',
            1=>'已启用'
        ];
        return $status[$value];
    }

    public function admin(){
        return $this->hasMany('Admin','role_id','id');
    }
}