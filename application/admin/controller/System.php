<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/9/28
 * Time: 17:04
 */

namespace app\admin\controller;


class System extends Base
{
    public function index(){
        $menu_name=$this->menu_lists();
        $this->assign('menu_list',$menu_name);
        return $this->fetch();
    }
}