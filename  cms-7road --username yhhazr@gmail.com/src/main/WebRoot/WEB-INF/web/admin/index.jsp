<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

  <head>
   
    
<link href="static/css/bootstrap.css" rel="stylesheet">
<link href="static/css/demo_table_jui.css" rel="stylesheet">
<script type="text/javascript" src="static/js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf-8">

$(document).ready(function() {
	$('#example').dataTable( {
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"bAutoWidth": false,
		     "oLanguage": {
                    "sProcessing": "正在加载中......",
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "对不起，查询不到相关数据！",
                    "sEmptyTable": "表中无数据存在！",
                    "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                    "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
                    "sSearch": "搜索",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上一页",
                        "sNext": "下一页",
                        "sLast": "末页"
                    }
                } //多语言配置
	} );
} );
</script>
<style type="text/css" media="screen">
 
body
{
    padding-top: 60px;
    padding-bottom: 40px;
	background-image:url("static/images/bg.png");
}

.accordion-heading, .nav.nav-tabs.myTab li a {
background: #575757;
background: -moz-linear-gradient(top, #575757 0%, #3D3D3D 100%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#575757), color-stop(100%,#3D3D3D));
background: -webkit-linear-gradient(top, #575757 0%,#3D3D3D 100%);
background: -o-linear-gradient(top, #575757 0%,#3D3D3D 100%);
background: -ms-linear-gradient(top, #575757 0%,#3D3D3D 100%);
background: linear-gradient(top, #575757 0%,#3D3D3D 100%);
}
.blue{
	background: #5BC0DE;
	background: -moz-linear-gradient(center top , #5BC0DE, #2F96B4);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#5BC0DE), color-stop(100%,#2F96B4));
	background: -webkit-linear-gradient(top, #5BC0DE 0%,#2F96B4 100%);
	background: -o-linear-gradient(top, #5BC0DE 0%,#2F96B4 100%);
	background: -ms-linear-gradient(top, #5BC0DE 0%,#2F96B4 100%);
	background: linear-gradient(top, #5BC0DE 0%,#2F96B4 100%);
}
.green{
	background: #51A351;
	background: -moz-linear-gradient(center top , #62C462, #51A351);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#62C462), color-stop(100%,#51A351));
	background: -webkit-linear-gradient(top, #62C462 0%,#51A351 100%);
	background: -o-linear-gradient(top, #62C462 0%,#51A351 100%);
	background: -ms-linear-gradient(top, #62C462 0%,#51A351 100%);
	background: linear-gradient(top, #62C462 0%,#51A351 100%);
}
.orenge{
	background: #F89406;
	background: -moz-linear-gradient(center top , #FBB450, #F89406);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FBB450), color-stop(100%,#F89406));
	background: -webkit-linear-gradient(top, #FBB450 0%,#F89406 100%);
	background: -o-linear-gradient(top, #FBB450 0%,#F89406 100%);
	background: -ms-linear-gradient(top, #FBB450 0%,#F89406 100%);
	background: linear-gradient(top, #FBB450 0%,#F89406 100%);
}
.red{
	background: #BD362F;
	background: -moz-linear-gradient(center top , #EE5F5B, #BD362F);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#EE5F5B), color-stop(100%,#BD362F));
	background: -webkit-linear-gradient(top, #EE5F5B 0%,#BD362F 100%);
	background: -o-linear-gradient(top, #EE5F5B 0%,#BD362F 100%);
	background: -ms-linear-gradient(top, #EE5F5B 0%,#BD362F 100%);
	background: linear-gradient(top, #EE5F5B 0%,#BD362F 100%);
}
.accordion-inner{
	background:#E5E5E5;
}
.accordion-group{
	border:0;
}
.accordion-heading{width:100%;margin:auto;border-radius: 4px 4px 4px 4px;}
.accordion .accordion-heading a {
display: block;
position: relative;
# padding: 10px 10px 10px 40px;
color: #FDFDFD;
font: bold 12px/18px Arial, sans-serif;
text-decoration: none;
}

#content
{
    height: 650px;
    background-color: #F5F5F5;
    border-radius: 4px 4px 4px 4px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05) inset;
    margin-bottom: 20px;
    min-height: 20px;
   
}
.testtable{
	
}
</style>
</head>
<body>

    <!-- 顶部 -->    
    <div id="header" class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          
          <a class="brand" href="#">网站后台管理系统</a>
          	<div class="btn-group pull-right">
				<button id="user" class="btn btn-inverse dropdown-toggle" data-toggle="dropdown" href="#"> 
					<i class="icon-user icon-white"></i>  ${sessionScope.userName}
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">修改密码</a></li>
					<li class="divider"></li>
					<li><a href="#">退出</a></li>
				</ul>
			</div>
          <div class="nav-collapse">
            <ul class="nav">
              
              <li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				背景
				<b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#" id="nonebg">无</a></li>
					<li><a href="#" id="bg1">背景一</a></li>
					<li><a href="#" id="bg2">背景二</a></li>
					<li><a href="#" id="bg3">背景三</a></li>
					<li><a href="#" id="bg4">背景四</a></li>
					<li><a href="#" id="bg5">背景五</a></li>
					<li><a href="#" id="bg6">背景六</a></li>
				</ul>
			  </li>
              
			  <li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				主题
				<b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#" id="black">黑色</a></li>
					<li><a href="#" id="blue">蓝色</a></li>
					<li><a href="#" id="green">绿色</a></li>
					<li><a href="#" id="orenge">橙色</a></li>
					<li><a href="#" id="red">红色</a></li>
				</ul>
			  </li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>


    <div class="container-fluid">
        <div class="row-fluid">
            <!-- 侧边栏 -->
            <div id="sidebar" class="span2">
                <div class="accordion" id="accordionSB">

                    <div class="accordion-group ">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionSB" href="#dashboardsb">
                                <i class="icon-th-large"></i> 用户及权限管理
                            </a>
                        </div>
                        <div id="dashboardsb" class="accordion-body collapse" style="height: 0px; ">
                            <div class="accordion-inner">
                                <ul class="nav nav-list">
                                    <li><a href="index.html"><i class="icon-th-list"></i> 用户管理</a></li>
                                    <li><a href="stats.html"><i class="icon-th-list"></i> 角色管理</a></li>
                                    <li><a href="stats.html"><i class="icon-th-list"></i> 权限管理</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionSB" href="#articlesb">
                                <i class="icon-large icon-th-large head_icon"></i> Articles
                            </a>
                        </div>
                        <div id="articlesb" class="accordion-body collapse" style="height: 0px; ">
                            <div class="accordion-inner">
                                <ul class="nav nav-list">
                                    <li><a href="articles.html"><i class="icon-large icon-th"></i> List</a></li>
                                    <li><a href="add-new-article.html"><i class="icon-large icon-th"></i> Add New</a></li>
                                    <li><a href="article-category.html"><i class="icon-large icon-th"></i> Categories</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionSB" href="#pagesb">
                                <i class="icon-large icon-th-large head_icon"></i> Pages
                            </a>
                        </div>
                        <div id="pagesb" class="accordion-body  collapse" style="height: 0px; ">
                            <div class="accordion-inner">
                                <ul class="nav nav-list">
                                    <li><a href="pages.html"><i class="icon-large icon-th"></i> List</a></li>
                                    <li><a href="add-new-page.html"><i class="icon-large icon-th"></i> Add New</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>                  
                    
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionSB" href="#reportsb">
                                <i class="icon-large icon-th-large head_icon"></i> Field Reports
                            </a>
                        </div>
                        <div id="reportsb" class="accordion-body collapse" style="height: 0px; ">
                            <div class="accordion-inner">
                                <ul class="nav nav-list">
                                    <li><a href="field-reports.html"><i class="icon-large icon-th"></i> List</a></li>
                                    <li><a href="add-new-field-report.html"><i class="icon-large icon-th"></i> Add New</a></li>
                                    <li><a href="field-report-category.html"><i class="icon-large icon-th"></i> Categories</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionSB" href="#mediasb">
                                <i class="icon-large icon-th-large head_icon"></i> Media
                            </a>
                        </div>
                        <div id="mediasb" class="accordion-body collapse" style="height: 0px; ">
                            <div class="accordion-inner">
                                <ul class="nav nav-list">
                                    <li><a href="media-library.html"><i class="icon-large icon-th"></i> Library</a></li>
                                    <li><a href="add-new-media.html"><i class="icon-large icon-th"></i> Add New</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionSB" href="#commentsb">
                                <i class="icon-large icon-th-large head_icon"></i> Comments
                            </a>
                        </div>
                        <div id="commentsb" class="accordion-body collapse" style="height: 0px; ">
                            <div class="accordion-inner">
                                <ul class="nav nav-list">
                                    <li><a href="comments.html"><i class="icon-large icon-th"></i> Comments</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>

            <!-- 右侧内容 -->
            <div id="content" class="span10">
                 <div class="navbar-inner">
                    <div class="container-fluid">
                    </div>
                </div>
                <div class="testtable">
                       	<table width="60%" cellpadding="0" cellspacing="0" border="0"  id="example" class="display datatable dataTable">
                       		<thead>
								<tr>
									<th width="10%">Rendering engine</th>
									<th width="10%">Browser</th>
									<th width="10%">Platform(s)</th>
									<th width="10%">Engine version</th>
									<th width="10%">CSS grade</th>
								</tr>
							</thead>
							<tbody>
		<tr class="odd gradeX">
			<td>Trident</td>
			<td>Internet
				 Explorer 4.0</td>
			<td>Win 95+</td>
			<td class="center"> 4</td>
			<td class="center">X</td>
		</tr>
		<tr class="even gradeC">
			<td>Trident</td>
			<td>Internet
				 Explorer 5.0</td>
			<td>Win 95+</td>
			<td class="center">5</td>
			<td class="center">C</td>
		</tr>
		<tr class="odd gradeA">
			<td>Trident</td>
			<td>Internet
				 Explorer 5.5</td>
			<td>Win 95+</td>
			<td class="center">5.5</td>
			<td class="center">A</td>
		</tr>
		<tr class="even gradeA">
			<td>Trident</td>
			<td>Internet
				 Explorer 6</td>
			<td>Win 98+</td>
			<td class="center">6</td>
			<td class="center">A</td>
		</tr>
		<tr class="odd gradeA">
			<td>Trident</td>
			<td>Internet Explorer 7</td>
			<td>Win XP SP2+</td>
			<td class="center">7</td>
			<td class="center">A</td>
		</tr>
		<tr class="even gradeA">
			<td>Trident</td>
			<td>AOL browser (AOL desktop)</td>
			<td>Win XP</td>
			<td class="center">6</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Firefox 1.0</td>
			<td>Win 98+ / OSX.2+</td>
			<td class="center">1.7</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Firefox 1.5</td>
			<td>Win 98+ / OSX.2+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Firefox 2.0</td>
			<td>Win 98+ / OSX.2+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Firefox 3.0</td>
			<td>Win 2k+ / OSX.3+</td>
			<td class="center">1.9</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Camino 1.0</td>
			<td>OSX.2+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Camino 1.5</td>
			<td>OSX.3+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Netscape 7.2</td>
			<td>Win 95+ / Mac OS 8.6-9.2</td>
			<td class="center">1.7</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Netscape Browser 8</td>
			<td>Win 98SE+</td>
			<td class="center">1.7</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Netscape Navigator 9</td>
			<td>Win 98+ / OSX.2+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.0</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.1</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.1</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.2</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.2</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.3</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.3</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.4</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.4</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.5</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.5</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.6</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.6</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.7</td>
			<td>Win 98+ / OSX.1+</td>
			<td class="center">1.7</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.8</td>
			<td>Win 98+ / OSX.1+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Seamonkey 1.1</td>
			<td>Win 98+ / OSX.2+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Epiphany 2.20</td>
			<td>Gnome</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>Safari 1.2</td>
			<td>OSX.3</td>
			<td class="center">125.5</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>Safari 1.3</td>
			<td>OSX.3</td>
			<td class="center">312.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>Safari 2.0</td>
			<td>OSX.4+</td>
			<td class="center">419.3</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>Safari 3.0</td>
			<td>OSX.4+</td>
			<td class="center">522.1</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>OmniWeb 5.5</td>
			<td>OSX.4+</td>
			<td class="center">420</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>iPod Touch / iPhone</td>
			<td>iPod</td>
			<td class="center">420.1</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>S60</td>
			<td>S60</td>
			<td class="center">413</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Presto</td>
			<td>Opera 7.0</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">-</td>
			<td class="center">A</td>
		</tr>
							</tbody>
                       	</table>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript">
	$("#blue").click( function(){
		$(".navbar-inner").attr("class","navbar-inner");	
		$(".navbar-inner").addClass("blue");	
		$(".navbar .nav li a").css("color","#ffffff");
		$(".navbar .nav li ul li a").css("color","#333333");
		$(".brand").css("color","#ffffff");
		$("#user").attr('class','btn btn-info dropdown-toggle');
		$(".accordion-heading").attr("class","accordion-heading");
		$(".accordion-heading").addClass("blue");
	});
	$("#green").click( function(){
		$(".navbar-inner").attr("class","navbar-inner");	
		$(".navbar-inner").addClass("green");	
		$(".navbar .nav li a").css("color","#ffffff");
		$(".navbar .nav li ul li a").css("color","#333333");
		$(".brand").css("color","#ffffff");
		$("#user").attr('class','btn btn-success dropdown-toggle');
		$(".accordion-heading").attr("class","accordion-heading");
		$(".accordion-heading").addClass("green");
	});
	$("#orenge").click( function(){
		$(".navbar-inner").attr("class","navbar-inner");	
		$(".navbar-inner").addClass("orenge");	
		$(".navbar .nav li a").css("color","#ffffff");
		$(".navbar .nav li ul li a").css("color","#333333");
		$(".brand").css("color","#ffffff");
		$("#user").attr('class','btn btn-warning dropdown-toggle');
		$(".accordion-heading").attr("class","accordion-heading");
		$(".accordion-heading").addClass("orenge");
	});
	$("#red").click( function(){
		$(".navbar-inner").attr("class","navbar-inner");	
		$(".navbar-inner").addClass("red");	
		$(".navbar .nav li a").css("color","#ffffff");
		$(".navbar .nav li ul li a").css("color","#333333");
		$(".brand").css("color","#ffffff");
		$("#user").attr('class','btn btn-danger dropdown-toggle');
		$(".accordion-heading").attr("class","accordion-heading");
		$(".accordion-heading").addClass("red");
	});
	$("#black").click(function(){
		$(".navbar-inner").attr("class","navbar-inner");
		$(".navbar .nav li a").css("color","#999999");
		$(".navbar .nav li ul li a").css("color","#333333");
		$(".brand").css("color","#999999");
		$("#user").attr('class','btn btn-inverse dropdown-toggle');
		$(".accordion-heading").attr("class","accordion-heading");
	});
	$("#bg1").click(function(){
		$("body").css("background-image","url('static/images/bg.png')");
	});
	$("#nonebg").click(function(){	
		$("body").css("background-image","url('static/images/sdf.png')");
	});
	$("#bg3").click(function(){	
		$("body").css("background-image","url('static/images/bg3.jpg')");
	});
	$("#bg4").click(function(){	
		$("body").css("background-image","url('static/images/bg4.jpg')");
	});
	$("#bg5").click(function(){	
		$("body").css("background-image","url('static/images/bg5.jpg')");
	});
	$("#bg6").click(function(){	
		$("body").css("background","url('static/images/17.png') repeat scroll 0 0 #454545");
	});
	$("#bg2").click(function(){
		$("body").css("background-image","url('static/images/dark_brick_wall.png')");
	});
</script>
</body>
</html>