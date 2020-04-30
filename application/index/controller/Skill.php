<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/11/21
 * Time: 16:23
 */

namespace app\index\controller;
use app\index\controller\Base as BaseController;
use app\index\model\Skill as SkillModel;
use Redis as Rediss;   ;
class Skill extends BaseController
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
    public function index(){
        $this->no_loginbefore();
        $products=SkillModel::where(['status'=>1])->paginate(12);
        $this->assign('products',$products);
        return $this->fetch();
    }


    public function joins(){

        $redis=new Rediss();
        $redis->connect('127.0.0.1',6379);
        $redis->auth('abc123');

        $skills=SkillModel::where(['status'=>1])->select();
        $ids=array();
        $values=array();
        foreach($skills as $it){
            array_push($ids,$it['id']);
            array_push($values,$it['value']);
        }
        for($j=1;$j<=count($ids);$j++){
            for($i=1;$i<=$values[$j-1];$i++){
                $redis->lPush('l'.$j,$i);
            }
        }
//        $redis->lTrim('l1',-1,0);
//        $redis->lTrim('l2',-1,0);
//        $redis->sRem('bought_list',1);
//        $redis->hDel('order_list','1');
//      dump($redis->lLen('l1'));
        $redis->close();

    }

    public function skill(){
        $id=input('get.id');
        $redis=new Rediss();
        $redis->connect('127.0.0.1',6379);
        $redis->auth('abc123');

        if($redis->lLen('l'.$id)==0){
            return ['status'=>0,'message'=>'商品已抢购完。。。'];
//            return json_encode(['status'>0,'message'=>'1']);

        }
        $uid=$this->getUid();
        if($redis->sIsMember('bought_list'.$id,$uid)){
            return ['status'=>0,'message'=>'每人限购一次。。。'];
//            return json_encode(['status'>0,'message'=>'2']);
        }
        $number_id=$redis->rPop('l'.$id);
        $redis->sAdd('bought_list'.$id,$uid);
        $value=array([
            'uid'=>$uid,
            'gid'=>$id,
            'num_id'=>$number_id
        ]);
        $redis->hSet('order_list'.$id,$uid,json_encode($value));
        return ['status'=>1,'message'=>'恭喜你，抢购成功。。。'];
//        return json_encode(['status'>0,'message'=>'3']);

    }

    public function joins2(){
        $redis=new Rediss();
        $redis->connect('127.0.0.1',6379);
        $redis->auth('abc123');
        $aa=$redis->lRange('l1',0,-1);
        $bb=$redis->lRange('l2',0,-1);
        $cc=$redis->sMembers('bought_list');
        $dd=$redis->hVals('order_list');
        $ee=$redis->hKeys('order_list');
        dump($bb);
    }

}