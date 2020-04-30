<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/8/1
 * Time: 18:17
 */

namespace app\admin\controller;
use app\admin\model\User;
use app\admin\model\Admin;
use app\admin\model\Image;
use app\admin\model\Product;
use app\admin\model\OrderProduct;
use app\admin\model\Order;
class Index extends Base
{
    public function index(){
        $menu_name=$this->menu_lists();
        $this->assign('menu_list',$menu_name);
        $this->statisticAll();
        $this->statisticToday();
        $this->statisticWeek();
        $this->statisticMonth();
        return $this->fetch();
    }

    protected function statisticAll(){
        $a11=Image::count();
        $a12=Product::count();
        $a13=Product::sum('sell');
        $a14=0;
        $products=Product::all();
        foreach($products as $value){
            $a14+=$value['price']*$value['sell'];
        }
        $a15=User::count();
        $a16=Admin::count();
        $this->assign('a11',$a11);
        $this->assign('a12',$a12);
        $this->assign('a13',$a13);
        $this->assign('a14',$a14);
        $this->assign('a15',$a15);
        $this->assign('a16',$a16);


    }
    public function a (){
        echo strtotime("10 September 2000"), "\n";
        echo strtotime("0 day 0 hour 0 second"), "\n";
        echo date('y-m-d H:i:s','1573909321'), "\n";
        echo strtotime("+1 week"), "\n";
        echo strtotime("+1 week 2 days 4 hours 2 seconds"), "\n";

         echo time(), "<br/>";

         $week=date('t')-1;
        $week=date('t')-date('d');
        $week=date('d')-(date('d')-1);
    //    $week=date('d',strtotime("-{$week} day"));
        echo  $week;



    }

    protected function getDayUnix(){
        $year=date('Y');
        $month=date('m');
        $day=date('d');
        $start=mktime(0,0,0,$month,$day,$year);
        $end=mktime(23,59,59,$month,$day,$year);
        $arr=array();
        array_push($arr,$start);
        array_push($arr,$end);
        return $arr;
    }

    protected function statisticToday(){
        $today=$this->getDayUnix();
        $timeArr=array('between',[$today[0],$today[1]]);
        $a21=Image::where(['create_time'=>$timeArr])->count();
        $a22=Product::where(['create_time'=>$timeArr])->count();
        $a23 = Order::where(['update_time'=>$timeArr, 'status'=>3])->sum('count');
        $a24= Order::where(['update_time'=>$timeArr, 'status'=>3])->sum('total_price');
        $a25=User::where(['create_time'=>$timeArr])->count();
        $a26=Admin::where(['create_time'=>$timeArr])->count();
        $this->assign('a21',$a21);
        $this->assign('a22',$a22);
        $this->assign('a23',$a23);
        $this->assign('a24',$a24);
        $this->assign('a25',$a25);
        $this->assign('a26',$a26);


    }

    protected function getWeekUnix(){
        $lweek=date('N')-1;
        $lday=date('d',strtotime("-{$lweek} day"));
        $rweek=7-date('N');
        $rday=date('d',strtotime("+{$rweek} day"));
        $year=date('Y');
        $month=date('m');
        $start=mktime(0,0,0,$month,$lday,$year);
        $end=mktime(23,59,59,$month,$rday,$year);
        $arr=array();
        array_push($arr,$start);
        array_push($arr,$end);
        return $arr;
    }

    protected function statisticWeek(){
        $week=$this->getWeekUnix();
        $timeArr=array('between',[$week[0],$week[1]]);
        $a31=Image::where(['create_time'=>$timeArr])->count();
        $a32=Product::where(['create_time'=>$timeArr])->count();
        $a33 = Order::where(['update_time'=>$timeArr, 'status'=>3])->sum('count');
        $a34= Order::where(['update_time'=>$timeArr, 'status'=>3])->sum('total_price');
        $a35=User::where(['create_time'=>$timeArr])->count();
        $a36=Admin::where(['create_time'=>$timeArr])->count();
        $this->assign('a31',$a31);
        $this->assign('a32',$a32);
        $this->assign('a33',$a33);
        $this->assign('a34',$a34);
        $this->assign('a35',$a35);
        $this->assign('a36',$a36);


    }

    protected function getMonthUnix(){
        $lday=1;
        $rday=date('t');
        $year=date('Y');
        $month=date('m');
        $start=mktime(0,0,0,$month,$lday,$year);
        $end=mktime(23,59,59,$month,$rday,$year);
        $arr=array();
        array_push($arr,$start);
        array_push($arr,$end);
        return $arr;
    }

    protected function statisticMonth(){
        $month=$this->getMonthUnix();
        $timeArr=array('between',[$month[0],$month[1]]);
        $a41=Image::where(['create_time'=>$timeArr])->count();
        $a42=Product::where(['create_time'=>$timeArr])->count();
        $a43=Order::where(['update_time'=>$timeArr, 'status'=>3])->sum('count');
        $a44=Order::where(['update_time'=>$timeArr, 'status'=>3])->sum('total_price');
        $a45=User::where(['create_time'=>$timeArr])->count();
        $a46=Admin::where(['create_time'=>$timeArr])->count();
        $this->assign('a41',$a41);
        $this->assign('a42',$a42);
        $this->assign('a43',$a43);
        $this->assign('a44',$a44);
        $this->assign('a45',$a45);
        $this->assign('a46',$a46);

    }
}