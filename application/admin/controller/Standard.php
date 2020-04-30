<?php
/**
 * Created by PhpStorm.
 * User: xiaotian
 * Date: 2019/10/10
 * Time: 21:52
 */

namespace app\admin\controller;

use app\admin\controller\Base as BaseController;
use app\admin\model\Standard as StandardModel;
use think\Image;
use app\admin\model\Image as ImageModel;
use think\Request;
use app\admin\model\Category as CategoryModel;
class Standard extends BaseController
{
    public function picture(){
        $id=input('get.id');
        $standard=StandardModel::get($id,['centerImg','product']);
        $this->assign('standard',$standard);
        return $this->fetch('showImg');
    }

    public function standard_edit(){
        $id=input('get.id');
        $pid=input('get.pid');
        $standard=StandardModel::get($id);
        $this->assign('standard',$standard);
        $this->assign('product_id',$pid);
        return $this->fetch('edit');
    }

    public function save(Request $request)
    {
        $id=$request->param('id');
        $data=$request->except('id');
        if($id>0){
            $update=StandardModel::update($data,['id'=>$id]);
            if($update){
                exit(json_encode(array('status'=>1,'message'=>'修改成功')));
            }else{
                exit(json_encode(array('status'=>0,'message'=>'修改失败')));

            }
        }else{
            $has = StandardModel::where(['color'=>$data['color'],'size'=>$data['size'],'product_id'=>$data['product_id']])->find();
            if ($has) {
                return [
                    'status' => 0,
                    'message' => '规格已存在'
                ];
            }
            $insert=StandardModel::create($data);
            if($insert){
                exit(json_encode(array('status'=>1,'message'=>'添加成功')));

            }else{
                exit(json_encode(array('status'=>0,'message'=>'添加失败')));
            }
        }
    }

    public function test(){


       $str='';
        for($i=0;$i<4;$i++){
          $str.=rand(0,9);
        }
       $hua=imagecreatetruecolor(100,50);
        $whites=imagecolorallocate($hua,255,0,0);
        imagefill($hua,0,0,$whites);
       $white=imagecolorallocate($hua,20,0,0);
        imagestring($hua,5,0,0,$str,$white);
        ob_end_clean();
        header("content-type:image/png");
       imagepng($hua);
        imagedestroy($hua);

    }

    public function uploadPicture(){
        $brand=input('post.brand');
        $name=input('post.name');
//        $img_id=input('post.img_id');
        $id=input('post.id');
        $category_id=input('post.category_id');
        $category = CategoryModel::where(['id'=>$category_id])->field('name,pid')->find();
        $category_name = $category['name'];
        $parent_category_name = CategoryModel::where(['id'=>$category['pid']])->value('name');
        $address=ROOT_PATH . 'public' . DS . '/images/'.$parent_category_name.'/'.$category_name.'/'.$brand.'/'.$name.'/color';
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');

        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['size'=>2000000,'ext'=>'jpg,png,gif,jpeg'])->move($address);

        if($info){

//            写入数据库
            $img=ImageModel::create(['img_url'=>'/images/'.$parent_category_name.'/'.$category_name.'/'.$brand.'/'.$name.'/color/'.$info->getSaveName()]);

            $result=StandardModel::where(['id'=>$id])->update(['centerImg_id'=>$img->getData('id')]);
            $standard=StandardModel::get($id);
            $standards=StandardModel::where(['product_id'=>$standard->getData('product_id')])->select();
            foreach($standards as $it){
                if($it['color']==$standard->getData('color')){
                    StandardModel::where(['id'=>$it['id']])->update(['centerImg_id'=>$img->getData('id')]);
                }
            }
            if($result){
                return ['status'=>1,'message'=>'添加图片成功','img_url'=>$img->getData('img_url')];
            }else{
                return ['status'=>0,'message'=>'上传失败，未知错误'];
            }

        }else{
            // 上传失败获取错误信息
            return ['status'=>0,'message'=>$file->getError()];
        }
    }

    public function changePicture(){

        $brand=input('post.brand');
        $name=input('post.name');
        $img_id=input('post.img_id');
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');
        $category_id=input('post.category_id');
        $category = CategoryModel::where(['id'=>$category_id])->field('name,pid')->find();
        $category_name = $category['name'];
        $parent_category_name = CategoryModel::where(['id'=>$category['pid']])->value('name');
        $address=ROOT_PATH . 'public' . DS . '/images/'.$parent_category_name.'/'.$category_name.'/'.$brand.'/'.$name.'/color';
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['size'=>20000000,'ext'=>'jpg,png,gif,jpeg'])->move($address);

        if($info){
            //写入数据库
            $img=ImageModel::get($img_id);
            if($img->getData('img_url')){
                if(file_exists(ROOT_PATH . 'public' .$img->getData('img_url'))){
                    unlink(ROOT_PATH . 'public' .$img->getData('img_url'));
                }
            }
            $img->img_url='/images/'.$parent_category_name.'/'.$category_name.'/'.$brand.'/'.$name.'/color/'.$info->getSaveName();
            $result=$img->save();

            if($result){
                return ['status'=>1,'message'=>'修改图片成功','img_url'=>$img->getData('img_url')];
            }else{
                return ['status'=>0,'message'=>'上传失败，未知错误'];
            }

        }else{
            // 上传失败获取错误信息
            return ['status'=>0,'message'=>$file->getError()];
        }
    }


    public function standard_del(){
        $id = input('get.id');
        StandardModel::destroy($id);
    }

    public function deleteAll(){

        $idsArr=input('param.ids/a');
        foreach($idsArr as $value){
            $standard=StandardModel::get($value);
            if(!$standard->delete()){
                return [
                    'status'=>0,
                    'message'=>'删除失败'
                ];

            }
        }
        return [
            'status'=>1,
            'message'=>'删除成功'
        ];

    }
}