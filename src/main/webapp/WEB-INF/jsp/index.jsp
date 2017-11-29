<%@page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>IT商店</title>
	<link rel="stylesheet" type="text/css" href="${basePath}/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${basePath}/css/banner.css">
	<link rel="stylesheet" type="text/css" href="${basePath}/css/swipeslider.css">
	<link rel="stylesheet" href="${basePath}/css/index.css">
	<link rel="stylesheet" href="${basePath}/bootstrapcss/bootstrap/bootstrap.min.css" />

</head>
<body>
	<!-- 头部开始 -->
	<div class="head_box">
		<a href="javascript:;" class="head_left"></a>
		<div class="head_right">
			<div class="head_cent">
			<div class="hc_box">
					<form method="post" >
						<input type="text" name="goodsname" id="goodsname" placeholder="根据商品名或店铺查询"  />
					</form>
                              <span id="hc_btn" ><img src="./images/search.png"  width="30px" class="his"></span>    
					</div>
			</div>
			<div class="hc_right">
				<div class="hc_login">
					<a href="javascript:;" name="user" id="user">
                      ${sessionScope.p.uname}</a>
				</div>
				<div class="hc_show">
			
					<a  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"  id="btn1">修改信息</a>
					<span ></span>
					<a  id="loginout">退出登陆</a>
					<span ></span>
					<a href="toshopper.do" >购物车</a>
				</div>
			</div>
		</div>
	</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改信息
				</h4>
			</div>
			<div class="modal-body">
			<form action="" >
			 <table>
			   <tr>
			     <td>用户名:</td> <td><input type="text"  name="uname" id="uname" value="${p.uname}"/></td>
			   </tr>
			   <tr>
			     <td>密    码:</td> <td><input type="password" name="password" id="password" value="${p.password}"/></td>
			   </tr>
			   <tr>
			     <td>电    话:</td> <td><input type="text"  name="phone" id="phone" value="${p.phone}"/></td>
			   </tr>
			     <input type="hidden"   name="type" id="type" value="${p.type}"/>
			     <input type="hidden"  name="id" id="id" value="${p.id }"/>
			 </table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary"data-dismiss="modal" id="update">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<div class="modal fade" id="myModaladd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加商品
				</h4>
			</div>
			<div class="modal-body">
			<form action="" method="post" enctype="multipart/form-data"  id="goodsadd">
			 <table>
			   <tr>
			     <td>商品名:</td> <td><input  name="goodsname" id="modal-goodsname" /></td>
			   </tr>
			   <tr>
			     <td>数  量:</td> <td><input  name="num" id="modal-num" /></td>
			   </tr>
			   <tr>
			     <td>价  格:</td> <td><input  name="price" id="modal-price" /></td>
			   </tr>
			   <tr>
			     <td>生产期:</td> <td><input  name="productiveTime" id="modal-productiveTime" /></td>
			   </tr>
			   <tr>
			     <td>保质期:</td> <td><input  name="badTime" id="modal-badTime" /></td>
			   </tr>
			   <tr>
			   <td>图 片:</td><td><input type="file" name="file" id="modal-file"/>
			    <input type="hidden"   name="host" id="modal-host" value="${p.uname}"/></td>
			   </tr>
			    
			 </table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary"data-dismiss="modal" id="addGoods">
					增加商品
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 导航栏	 -->
	<div class="daohang clf">
		<ul>
			<li><a href="toIndex.do">首页</a></li>
			<li><a href="javascript:;"  id="allGoods">全部商品</a></li>
			<c:if test="${sessionScope.p.type=='s'}">
			<li><a href="javascript:;" class="shopkeepershow" id="myshop">我的商店</a></li>
			</c:if>
		</ul>
	</div>
	
	
<!-- 导航栏	 -->

<!-- banner 开始 -->
	<div class="banner" >
	 	<div class="banner-left">
	 		<figure id="responsiveness" class="swipslider" style=" padding-top: 80%;">
		        <ul class="sw-slides">
		          <li class="sw-slide">
		           <img src="./images/ban-1.jpg" alt="">
		          </li>
		          <li class="sw-slide">
		           <img src="./images/ban-2.jpg" alt="">
		          	</li>
		           <li class="sw-slide"><img src="./images/ban-3.jpg" alt=""></li>
				   <li class="sw-slide"><img src="./images/ban-4.jpg" alt=""></li>
		        </ul>
		      </figure>
			
	 	</div>
	 	<div class="banner-right">
	 		<a href=""><img src="./images/ban-5.jpg" alt=""  ></a>
	 		<a href=""><img src="./images/ban-6.jpg" alt=""  ></a>
	 		<a href=""><img src="./images/ban-7.jpg" alt=""  ></a>
	 	</div>
	 	<div style="clear:both"></div>
	 </div>
<!-- banner结束 -->

<!-- 内容1开始 -->
		<div class="main_box clf">
		
    <section class="session" id="session">
			
        
       
        </section>
</div>
<!-- 内容1结束-->
	<div class="foot-box">
	<div class="foot-top">
		<div class="foot-ul">
			<ul>
				<li class="ft-1">严格准入标准</li>
				<li class="ft-2">七天无理由退货</li>
				<li class="ft-3">15天免费换货</li>
				<li class="ft-4">全场包邮</li>
			</ul>
		</div>
	</div>
	<div class="foot-bottom">
		<div class="foot-left">
			<div class="lt">
				售后服务电话 ：
				<a href="javascript:;">010-58001118</a>
				<span>（周一至周五9:00-18:00）</span>
			</div>
			<div class="lb">
				<span>©2016IT</span>
				<a href="javascript:;">使用前必读</a>
				<a href="javascript:;">关于我们</a>
				<a href="javascript:;">服务条款</a>
				<a href="javascript:;">意见反馈</a>
				<a href="javascript:;">售后政策</a>
				<a href="javascript:;">合作咨询</a>
			</div>
		</div>
		<div class="foot-right">
			<div class="content-us">关于我们</div>
			<div class="content-info">
				<div class="info-left">
	 				<a href="javascript:;" class="info1"></a>
					<a href="javascript:;" class="info2"></a>
					<a href="javascript:;" class="info3"></a>
				</div>
				<div class="info-right">
					<img src="images/wap.png" alt="">
				</div>
				
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="${basePath}/js/jquery-1.4.3.js"></script>
 <script src="${basePath}/js/jquery-1.12.4.min.js"></script>
 <script>window.jQuery || document.write('<script src="js/jquery-1.12.4.min.js"><\/script>')</script>
	<script src="${basePath}/js/banner.js"></script>
	<script src="${basePath}/js/index.js"></script>
	<script src="${basePath}/js/jquery.form.js"></script>
<script src="${basePath}/bootstrapcss/bootstrap/bootstrap.min.js"></script>
<script src="${basePath}/bootstrapcss/bootstrap-dialog/bootstrap-dialog.min.js"></script>
<script type="text/javascript">


$('#myshop').click(function(){
	$('.banner').hide();
var uname='${sessionScope.p.uname}';
console.log(uname);
 var text = "";
 $.ajax({
	type:"post",
	url:"findGoodsByuname.do",
	data:{
		  "uname":uname
	},
	dataType:"json",
	success:function(result){
		if(result.state==1){
			text ="<div class='main_left'>"+
			"<a href='javascript:;'><img src='images/good16.jpg' alt=''></a>"+
			"</div>"+ " <ul id='u1'>";
			var list=result.data;
			for (var i = 0; i <list.length; i++) {
				text+="<li class='l1'><div class='main_right '>"+
				"<a href='javascript:;'>"+
				"<div class= 'main_name'>商品："+list[i].goodsname+"</div>"+
				"<div class='main_name'>价格：￥<span>"+list[i].price+"</span></div>"+
				"<div class= 'main_name'>数量："+list[i].num+"件</div>"+
				"<div class= 'main_name' >卖家："+list[i].host+"</div></a>" +
			    "<div class='main_name'><a  id=' ' onclick='f1("+list[i].id+")'>加入购物车</a></div>"+
			    "<div class='main_name'><a  onclick='f2("+list[i].id+")'>删除</a></div>"+
				"</div></ul></li>";
				}
		}else{
			  text ="<p class='main_right '>"+result.message+"</p>";
		}
		     text+="<div class= 'main_right' ><a  class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModaladd'  id='btn2'>添加商品</a></div>";
	 $('#session').html(text);
}
 });
 
})
function f1(e){
	var uname='${sessionScope.p.uname}';
	var id=e;
	console.log(id);
	var url='addCar.do';
	var params={
		'uname':uname,
		 'id':id
	};
	  $.post(url,params,function(result){
		  if(result.state==1){
			  alert("加入购物车成功");
		  }
	  });
} ;
	function f2 (e) {
		console.log(e); 
		BootstrapDialog.show({
			title: "删除商品",
			message: "确认删除此商品?",
			size: BootstrapDialog.SIZE_SMALL,
			type: BootstrapDialog.TYPE_DANGER,
			buttons: [
			          {
			        	  label: "取消", 
			        	  action: function (cancel) {
			        		  cancel.close();
			        	  }
			          }, {
			        	  label: "确定",
			        	  action: function (cancel) {
			        		var url="deleteGoods.do";
			        		var params={
			        				"id":e
			        		} 
			        		  $.post(url,params,function(result){
			        			  if(result.state==1){
			        				  alert("删除成功");
			        			  }
			        		  });
			        		  cancel.close();
			        	  }
			          }]
		});
	};
	
	$('#loginout').click(function(){
		var url="loginout.do";
		$.post(url,function(result){
			location.href="toLogin.do";
		});
	})
	
</script>
</body>
</html>