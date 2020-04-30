<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/11/15
 * Time: 11:31
 */

namespace app\admin\controller;
use think\Request;
use think\Session;
use app\admin\controller\Base as BaseController;
use app\admin\model\Menu as MenuModel;
use app\admin\model\Role as RoleModel;
use app\admin\model\Admin as AdminModel;

class Login extends  BaseController
{
    public function login(){
        return $this->fetch();
    }

    public function checkLogin(Request $request){
        $data=$request->param();

        if(!captcha_check($data['code'])){
            exit(json_encode(array('status'=>0,'message'=>'验证码错误')));

        };
        $datas=[
            'username'=>$data['username'],
            'password'=>$data['password'],

        ];
        $rule=[
            'username'=>'require',
            'password'=>'require',
        ];
        $msg=[
            'username.require'=>'名称必须',
            'password.require'=>'密码必须'
        ];
        $result=$this->validate($datas,$rule,$msg);
        if($result){
            $map=[
                'username'=>$data['username'],
                'password'=>$data['password'],
            ];
            $check=AdminModel::get($map);

            if($check){
                if($check->getData('status')==0){
                    exit(json_encode(array('status'=>0,'message'=>'登入失败，该账号已停用')));
                }
                AdminModel::where($map)->update(['login_time'=>time(),'login_ip'=>$_SERVER['REMOTE_ADDR']]);
                $check1=AdminModel::get($map);
                Session::set('admin_id',$check1['id']);
                Session::set('admin_info',$check1);
                exit(json_encode(array('status'=>1,'message'=>'登入成功')));
            }else{
                exit(json_encode(array('status'=>0,'message'=>'登入失败，用户名或密码错误')));
            }
        }else{
            exit(json_encode(array('status'=>0,'message'=>$result)));
        }
    }
    public function logout(){
        AdminModel::update(['login_time'=>time()],['id'=>Session::get('admin_id')]);
        Session::delete('admin_id');
        Session::delete('admin_info');
        AdminModel::destroy(['is_delete'=>0],true);
        MenuModel::destroy(['is_delete'=>0],true);
        RoleModel::destroy(['is_delete'=>0],true);

        $this->success('退出成功',url('login'));
    }
}