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

        //获取最新的四条新闻在首页显示
        $topFourNewsList=$Document->where($map)->order($order)->limit(4)->select();
        foreach($topFourNewsList as $k=>$v)
        {
            if($v['cover_id']>0)
                $topFourNewsList[$k]['coverPath']="/onethink".M("Picture")->where("id=".$v['cover_id'])->getField("path");
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
                $sliderThreeNewsList[$k]['coverPath']="/onethink".M("Picture")->where("id=".$v['cover_id'])->getField("path");
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
        $temp=$Document->lists($research['id']);
        foreach($temp as $v)
        {
            $list["research"][]=$Document->detail($v['id']);
        }

        $patent=R("Article/category",array('id'=>'onlyOneDoc'));
        $temp=$Document->lists($patent['id']);
        foreach($temp as $v)
        {
            if($v['title']=="patent")
                $list['patent']=$Document->detail($v['id']);
        }
        $this->assign("list",$list);
        $this->display();
    }

    public function publish()
    {
        $publishCategory=R("Article/category",array('id'=>'publish'));
        $Document = D('Document');
        $list=$Document->lists($publishCategory['id']);
        foreach($list as $v)
        {
            $detail[]=$Document->detail($v['id']);
        }
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


        if(isset($_GET['category'])&&$_GET['category']!="")
        {
            $categoryinfo =R("Article/category",array('id'=>I('get.category')));
            $list=$Document->lists($categoryinfo['id']);
            $num=sizeof($list);
            $end=ceil($num/$pagesize);
            echo $end;
            if($p==1)
                $prev="<li class='disabled'><a href='#'>上一页</a></li>";
            elseif($p>1)
            {
                $prevp=$p-1;
                $prev = "<li><a href='" . U('Nav/news', 'category=' . $categoryURL . '&p=' . $prevp ). "'>上一页</a></li>";
            }
            if($p==$end)
                $next="<li class='disabled'><a href='#'>下一页</a></li>";
            elseif($p<$end)
            {
                $nextp=$p+1;
                $next="<li><a href='".U('Nav/news','category='.$categoryURL.'&p='.$nextp)."'>下一页</a></li>";
            }
            $list=$Document->page($p, $pagesize)->lists($categoryinfo['id']);
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
            $list=$Document->lists($ids);
            $num=sizeof($list);
            $end=ceil($num/$pagesize);
            if($p==1)
                $prev="<li class='disabled'><a href='#'>上一页</a></li>";
            elseif($p>1)
            {
                $prevp=$p-1;
                $prev = "<li><a href='" . U('Nav/news', 'category=' . $categoryURL . '&p=' . $prevp ). "'>上一页</a></li>";
            }
            if($p==$end)
                $next="<li class='disabled'><a href='#'>下一页</a></li>";
            elseif($p<$end)
            {
                $nextp=$p+1;
                $next="<li><a href='".U('Nav/news','category='.$categoryURL.'&p='.$nextp)."'>下一页</a></li>";
            }
            $list=$Document->page($p, $pagesize)->lists($ids);
        }
        $this->assign("pagearea",$prev.$next."<li><a href='#'>共".$end."页</a></li>");
        $this->assign("list",$list);
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