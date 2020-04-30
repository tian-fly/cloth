<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/6/10
 * Time: 11:16
 */
namespace app\admin\controller;
use app\admin\model\Role as RoleModel;
use app\admin\model\Admin as AdminModel;
use think\Controller;
use think\Request;
use app\admin\controller\Base as BaseController;
class Admin extends BaseController{
    public function admin_list(){
        $count=AdminModel::count();
        $admin_list=AdminModel::paginate(7);
        $this->assign('count',$count);
        $this->assign('admin_list',$admin_list);
        return $this->fetch();
    }
    public function admin_del(Request $request){
        $id=$request->param('id');
        AdminModel::update(['is_delete'=>0],['id'=>$id]);
        AdminModel::destroy($id);
    }
    public function no_del(){
        AdminModel::update(['is_delete'=>1,'delete_time'=>NULL],['is_delete'=>0]);
//        AdminModel::update(['delete_time'=>NULL],['is_delete'=>0]);
    }
    public function admin_edit(Request $request){
        $id=$request->param('id');
        $admin=AdminModel::get(['id'=>$id]);
        $this->assign('admin',$admin);
        $roles=RoleModel::all();
        $this->assign('roles',$roles);
        return $this->fetch();
    }
    public function save_admin(Request $request){
        $id=$request->param('id');
        $data=$request->except('id');
        if($id>0){
            $update=AdminModel::update($data,['id'=>$id]);
            if($update){
                exit(json_encode(array('status'=>1,'message'=>'修改成功')));
            }else{
                exit(json_encode(array('status'=>0,'message'=>'修改失败')));

            }
        }else{
            $data['login_ip']=$_SERVER['REMOTE_ADDR'];
            $insert=AdminModel::create($data);
            if($insert){
                exit(json_encode(array('status'=>1,'message'=>'添加成功')));

            }else{
                exit(json_encode(array('status'=>0,'message'=>'添加失败')));
            }
        }
    }
    public function admin_status(Request $request){
        $id=$request->param('id');
        $admin=AdminModel::get($id);

        if($admin->getData('status') == 1){
            AdminModel::update(['status'=>0],['id'=>$id]);
        }else{
            AdminModel::update(['status'=>1],['id'=>$id]);
        }
    }

}