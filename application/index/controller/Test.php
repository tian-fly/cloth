<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/9/2
 * Time: 21:54
 */

namespace app\index\controller;

use think\Controller;
use think\Loader;

use Redis as Rediss;   ;
//use think\cache\driver\Redis as Rediss ;
use  think\Cache;
class Test extends Controller
{
    public function test(){
        return $this->fetch();
    }

    public function index(){
//        require_once APP_PATH.'common/WxpayAPI/lib/WxPay.Api.php';
//        require_once  EXTEND_PATH.'WxpayAPI/example/WxPay.Config.php';
//        Loader::import('WxPay.WxPay', EXTEND_PATH, '.Api.php');
        Loader::import('WxpayAPI.lib.WxPay',EXTEND_PATH,'.Api.php');
        Loader::import('WxpayAPI.example.WxPay',EXTEND_PATH,'.Config.php');
        $config=new \WxPayConfig();
        $input=new \WxPayUnifiedOrder();
        $input->SetBody('测试');
        $input->SetOut_trade_no('a001');
        $input->SetTotal_fee('1');
        $input->SetNotify_url('http://www.shop.com/index/test/echos');
        $input->SetTrade_type('NATIVE');
        $input->SetProduct_id("1");
        $result=\WxPayApi::unifiedOrder($config,$input);
        $code_url=$result['code_url'];
        $this->assign('code_url',urlencode($code_url));
        return $this->fetch();
    }
    public function echos(){
        echo "支付成功";
    }

    public function t1(){
       $redis=new Rediss();
       $redis->connect('127.0.0.1',6379);
       $redis->auth('abc123');
        for($i=1;$i<100;$i++){
            $redis->lPush('g_list',$i);
        }
//        $redis->set('a','333',10000);

    }

    public function t2(){
        $redis=new Rediss();
        $redis->connect('127.0.0.1',6379);
        $redis->auth('abc123');
        $aa=$redis->lRange('g_list',0,-1);
        dump($aa);
    }

    public function t3(){
        phpinfo();
    }
}