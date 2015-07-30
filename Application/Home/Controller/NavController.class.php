<?php
/**
 * Created by PhpStorm.
 * User: kangbiao
 * Date: 15-7-18
 * Time: 下午5:14
 */
namespace Home\Controller;

class NavController extends HomeController {

    public function index()
    {

        $this->display();
    }

    public function research()
    {
//        $research=R("Article/category",array('id'=>'research_forward'));
//        $Document = D('Document');
//        $temp=$Document->lists($research['id']);
//        foreach($temp as $v)
//        {
//            $list["research"][]=$Document->detail($v['id']);
//        }
//
//        $patent=R("Article/category",array('id'=>'onlyOneDoc'));
//        $temp=$Document->lists($patent['id']);
//        foreach($temp as $v)
//        {
//            if($v['title']=="patent")
//                $list['patent']=$Document->detail($v['id']);
//        }
//        dump($list);
//        $this->assign("list",$list);
        $this->display();
    }

    public function publish()
    {
        $this->display();
    }

    public function news()
    {
        $category = D('Category')->getTree("news");
        $category=$category["_"];
        $this->assign($category);
        dump($category);
        $this->display();
    }

    public function members()
    {
        //远程调用成员信息目录
        $categoryStudent =R("Article/category",array('id'=>'student'));
        $categoryGraduated_stu=R("Article/category",array('id'=>'graduated_stu'));
        $categoryTeacher=R("Article/category",array('id'=>'teacher'));

        $Document = D('Document');
        $list['Teacher']=$Document->lists($categoryTeacher['id']);
        $list['Student'] = $Document->lists($categoryStudent['id']);
        $list['Graduated_stu']=$Document->lists($categoryGraduated_stu['id']);

        //开始获取每个成员的详细信息
        foreach($list['Teacher'] as $k=>$v)
        {
            $detail['teacher'][]=$Document->detail($v['id']);
        }
        foreach($list['Student'] as $k=>$v)
        {
            $detail['student'][]=$Document->detail($v['id']);
        }
        foreach($list['Graduated_stu'] as $k=>$v)
        {
            $detail['graduated_stu'][]=$Document->detail($v['id']);
        }

        $this->assign('detail',$detail);
        $this->assign('empty',"<h4>暂没有相关成员信息</h4>");
//        dump($detail);
        $this->display();
    }

    public function about()
    {
        $researchPatent=R("Article/category",array('id'=>'onlyOneDoc'));

        $Document = D('Document');
        $temp=$Document->lists($researchPatent['id']);
        foreach($temp as $v)
        {
            if($v['title']=="about")
                $list=$Document->detail($v['id']);
        }
        $this->assign("list",$list);
        $this->display();
    }
    public function contact()
    {
        $researchPatent=R("Article/category",array('id'=>'onlyOneDoc'));

        $Document = D('Document');
        $temp=$Document->lists($researchPatent['id']);
        foreach($temp as $v)
        {
            if($v['title']=="contact")
                $list=$Document->detail($v['id']);
        }
        $this->assign("list",$list);
        $this->display();
    }

}