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
        $order="update_time DESC";
        $Document = D('Document');
        $categoryIDs=D('Category')->getTree("news");
        $count=0;
        foreach($categoryIDs["_"] as $k=>$v)
        {
            if($count==0)
                $ids=$v['id'];
            else
                $ids=$ids.",".$v['id'];
            $count=1;
        }

        $map['pid']=0;
        $map['status']=1;
        if(is_numeric($ids))
            $map['category_id']=$ids;
        else
            $map['category_id']=array('in',str2arr($ids));
        if(cookie("think_language")=="en")
            $map['group_id']=1;
        else
            $map['group_id']=0;
        //获取最新的四条新闻在首页显示
        $topFourNewsList=$Document->where($map)->order($order)->limit(4)->select();
        foreach($topFourNewsList as $k=>$v)
        {
            if($v['cover_id']>0)
                $topFourNewsList[$k]['coverPath']=__ROOT__.M("Picture")->where("id=".$v['cover_id'])->getField("path");
            else
                $topFourNewsList[$k]['coverPath']=0;
            unset($topFourNewsList[$k]['cover_id']);
        }

        //获取指定的在首页显示的最新三条新闻
        $map['atindex']=1;
        $sliderThreeNewsList=$Document->where($map)->order($order)->limit(3)->select();
        foreach($sliderThreeNewsList as $k=>$v)
        {
            if($v['cover_id']>0)
                $sliderThreeNewsList[$k]['coverPath']=__ROOT__.M("Picture")->where("id=".$v['cover_id'])->getField("path");
            else
                $sliderThreeNewsList[$k]['coverPath']=0;
            unset($sliderThreeNewsList[$k]['cover_id']);
        }

        //获取指定的在首页显示的最新的三个研究方向
        $researchCateID=R("Article/category",array('id'=>'research_forward'));
        $map['category_id']=$researchCateID['id'];
        $researchList=$Document->where($map)->order($order)->limit(3)->select();
//        dump($sliderThreeNewsList);
//        dump($researchList);
//        dump($topFourNewsList);
        $this->assign('indexResearch',$researchList);
        $this->assign("indexNews",$sliderThreeNewsList);
        $this->assign("topFourNewsList",$topFourNewsList);
        $this->display();
    }

    public function research()
    {
        $research=R("Article/category",array('id'=>'research_forward'));
        $Document = D('Document');

        $map['pid']=0;
        $map['status']=1;
        $map['category_id']=$research['id'];
        if(cookie("think_language")=="en")
            $map['group_id']=1;
        else
            $map['group_id']=0;
        $temp=$Document->where($map)->order("create_time DESC")->select();
        foreach($temp as $v)
        {
            $list["research"][]=$Document->detail($v['id']);
        }
        $patent=R("Article/category",array('id'=>'onlyOneDoc'));
        $map['category_id']=$patent['id'];
        $temp=$Document->where($map)->order("create_time DESC")->select();
//        lists($patent['id']);
        foreach($temp as $v)
        {
            if($v['title']=="patent")
                $list['patent']=$Document->detail($v['id']);
        }
//        dump($list);
        $this->assign("list",$list);
        $this->display();
    }

    public function publish()
    {
        $publishCategory=R("Article/category",array('id'=>'publish'));
        $Document = D('Document');

        $map['pid']=0;
        $map['status']=1;
        $map['category_id']=$publishCategory['id'];
        if(cookie("think_language")=="en")
            $map['group_id']=1;
        else
            $map['group_id']=0;
        $list=$Document->where($map)->order("create_time DESC")->select();
        foreach($list as $v)
        {
            $temp=$Document->detail($v['id']);
            $temp["create_time"]=date("Y-m",$temp["create_time"]);
            $yearMonth[]=$temp["create_time"];
            $detail[]=$temp;
        }
        arsort($yearMonth);
        $this->assign("yearMonth",$yearMonth);
        $this->assign('detail',$detail);
        $this->display();
    }

    public function news($p=1)
    {
        $pagesize=15;
        $categoryURL=I('get.category','');
        $Document = D('Document');
        $field = 'id,name,pid,title,link_id';
        //获取新闻下的所有子分类
        $category = D('Category')->getTree("news",$field);
        $category=$category["_"];

        $map['pid']=0;
        $map['status']=1;
        if(cookie("think_language")=="en")
        {
            $prevPage = "Previous";
            $nextPage = "Next";
            $langall="All&nbsp;";
            $langpage="&nbsp;Tatols";
            $map['group_id'] = 1;
        }
        else
        {
            $prevPage = "上一页";
            $nextPage = "下一页";
            $langall="共";
            $langpage="页";
            $map['group_id'] = 0;
        }

        if(isset($_GET['category'])&&$_GET['category']!="")
        {
            $categoryinfo =R("Article/category",array('id'=>I('get.category')));
            $map['category_id']=$categoryinfo['id'];
            $list=$Document->where($map)->order("create_time DESC")->select();
            $num=sizeof($list);
            $end=ceil($num/$pagesize);
            echo $end;
            if($p==1)
                $prev="<li class='disabled'><a href='#'>".$prevPage."</a></li>";
            elseif($p>1)
            {
                $prevp=$p-1;
                $prev = "<li><a href='" . U('Nav/news', 'category=' . $categoryURL . '&p=' . $prevp ). "'>".$prevPage."</a></li>";
            }
            if($p==$end)
                $next="<li class='disabled'><a href='#'>".$nextPage."</a></li>";
            elseif($p<$end)
            {
                $nextp=$p+1;
                $next="<li><a href='".U('Nav/news','category='.$categoryURL.'&p='.$nextp)."'>".$nextPage."</a></li>";
            }
            $list=$Document->page($p, $pagesize)->where($map)->order("create_time DESC")->select();
        }
        else
        {
            $categoryIDs=D('Category')->getTree("news");
            $count=0;
            foreach($categoryIDs["_"] as $k=>$v)
            {
                if($count==0)
                    $ids=$v['id'];
                else
                    $ids=$ids.",".$v['id'];
                $count=1;
            }
            if(is_numeric($ids))
                $map['category_id']=$ids;
            else
                $map['category_id']=array('in',str2arr($ids));
            $list=$Document->where($map)->order("create_time DESC")->select();
            $num=sizeof($list);
            $end=ceil($num/$pagesize);
            if($p==1)
                $prev="<li class='disabled'><a href='#'>".$prevPage."</a></li>";
            elseif($p>1)
            {
                $prevp=$p-1;
                $prev = "<li><a href='" . U('Nav/news', 'category=' . $categoryURL . '&p=' . $prevp ). "'>".$prevPage."</a></li>";
            }
            if($p==$end)
                $next="<li class='disabled'><a href='#'>".$nextPage."</a></li>";
            elseif($p<$end)
            {
                $nextp=$p+1;
                $next="<li><a href='".U('Nav/news','category='.$categoryURL.'&p='.$nextp)."'>".$nextPage."</a></li>";
            }
            $list=$Document->page($p, $pagesize)->where($map)->order("create_time DESC")->select();
        }
        $this->assign("pagearea",$prev.$next."<li><a href='#'>".$langall.$end.$langpage."</a></li>");
        $this->assign("list",$list);
        if(cookie("think_language")=="en")
        {
            foreach($category as $k=>$v)
            {
                $category[$k]['title']=$category[$k]['name'];
            }
        }
        $this->assign("category",$category);
        $this->display();
    }

    public function members()
    {
        //远程调用成员信息目录
        $categoryStudent =R("Article/category",array('id'=>'student'));
        $categoryGraduated_stu=R("Article/category",array('id'=>'graduated_stu'));
        $categoryTeacher=R("Article/category",array('id'=>'teacher'));

        $Document = D('Document');

        $map['pid']=0;
        $map['status']=1;
        if(cookie("think_language")=="en")
            $map['group_id']=1;
        else
            $map['group_id']=0;
        $map['category_id']=$categoryTeacher['id'];
        $list['Teacher']=$Document->where($map)->order("create_time DESC")->select();
        $map['category_id']=$categoryStudent['id'];
        $list['Student'] = $Document->where($map)->order("create_time DESC")->select();
        $map['category_id']=$categoryGraduated_stu['id'];
        $list['Graduated_stu']=$Document->where($map)->order("create_time DESC")->select();

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
        $this->display();
    }

    public function about()
    {
        $researchPatent=R("Article/category",array('id'=>'onlyOneDoc'));

        $Document = D('Document');

        $map['pid']=0;
        $map['status']=1;
        if(cookie("think_language")=="en")
            $map['group_id']=1;
        else
            $map['group_id']=0;
        $map['category_id']=$researchPatent['id'];
        $temp=$Document->where($map)->order("create_time DESC")->select();
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

        $map['pid']=0;
        $map['status']=1;
        if(cookie("think_language")=="en")
            $map['group_id']=1;
        else
            $map['group_id']=0;
        $map['category_id']=$researchPatent['id'];
        $temp=$Document->where($map)->order("create_time DESC")->select();
        foreach($temp as $v)
        {
            if($v['title']=="contact")
                $list=$Document->detail($v['id']);
        }
        $this->assign("list",$list);
        $this->display();
    }

    public function bio()
    {
        $researchPatent=R("Article/category",array('id'=>'onlyOneDoc'));

        $Document = D('Document');

        $map['pid']=0;
        $map['status']=1;
        if(cookie("think_language")=="en")
            $map['group_id']=1;
        else
            $map['group_id']=0;
        $map['category_id']=$researchPatent['id'];
        $temp=$Document->where($map)->order("create_time DESC")->select();
        foreach($temp as $v)
        {
            if($v['title']=="bio")
                $list=$Document->detail($v['id']);
        }
        $this->assign("list",$list);
        $this->display();
    }

}