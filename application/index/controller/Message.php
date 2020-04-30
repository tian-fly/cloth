<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/11/18
 * Time: 10:35
 */

namespace app\index\controller;
use app\index\controller\Base as BaseController;
use app\index\model\Order as OrderModel;
class Message extends BaseController
{
    public function auth(){
        $result=$this->no_login();
        if($result!=="true"){
            return $result;
        }else{
            return [
                'status'=>1
            ];
        }
    }

    public function listen(){
        $uid=$this->getUid();
        $ids=array('in','1,2,3');
        $count=OrderModel::where(['user_id'=>$uid,'status'=>$ids,'read'=>0])->count();
        if($count>0){
            return [
                'status'=>1,
                'message'=>$count
            ];
        }else{
            return [
                'status'=>0,

            ];
        }
    }

    public function messages(){
        $this->no_loginbefore();
        $uid=$this->getUid();
        $ids=array('in','0,1,2,3');
        $orders=OrderModel::with('products')->where(['user_id'=>$uid,'status'=>$ids,'read'=>0])->order('update_time desc')->paginate(7);
//        return $orders;
        $this->assign('orders',$orders);
        return $this->fetch();
    }

    public function read(){
        $this->no_loginbefore();
        $uid=$this->getUid();
        $oid=input('get.id');
        $update=OrderModel::where(['user_id'=>$uid,'id'=>$oid])->update(['read'=>1]);
        if($update){
            return [
                'status'=>1,
                'message'=>'标记为已读'
            ];
        }else{
            return [
                'status'=>0,
                'message'=>'操作失败'
            ];
        }
    }

}