<%@page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html><head lang="en"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>IT商城登陆页面</title>
    <link href="${basePath}/css/header.css" rel="stylesheet">
    <link href="${basePath}/css/footer.css" rel="stylesheet">
    <link href="${basePath}/css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="${basePath}/css/sweet-alert.css">
    
</head>
<body>
<!-- 页面顶部-->
<header id="top">
    <div class="top">
        <img src="./images/logo.png" alt="">
        <span>欢迎登录</span>
    </div>
</header>
<div id="container">
    <div id="cover" class="rt">
        <form id="login_form" method="post" name="form1"  >
            <div class="txt">
                <p>
					登录IT商城
                </p>
                <div class="text">
                    <input type="text" placeholder="请输入您的用户名" name="uname" id="uname" required="">
                    <span><img src="./images/yhm.png"></span>
                    <span style="color:red;" id="msg"></span>
                </div>
                
                <div class="text">
                    <input type="password"  id="password"  placeholder="请输入您的密码" name="password"  required="" minlength="3" maxlength="15">
                    <span><img src="./images/mm.png"></span>
                </div>
                <div class="close">
            
               <span ><a href="topassenger_regist.do" >新用户注册</a></span>
			    <span><a href="toshopkeeper_regist.do" >新店铺注册</a></span>
     
                </div>
                <input class="button_login" type="button" value="登录" id="bt-login" >
            </div>
        </form>
    </div>
</div>
<!--错误提示-->
<div id="showResult"></div>
<!-- 品质保障，私人定制等-->
<div id="foot_box">
  <div class="icon1 lf">
    <img src="./images/icon1.png" alt="">

    <h3>品质保障</h3>
  </div>
  <div class="icon2 lf">
    <img src="./images/icon2.png" alt="">

    <h3>私人定制</h3>
  </div>
  <div class="icon3 lf">
    <img src="./images/icon3.png" alt="">

    <h3>学员特供</h3>
  </div>
  <div class="icon4 lf">
    <img src="./images/icon4.png" alt="">

    <h3>专属特权</h3>
  </div>
</div>
<!-- 页面底部-->
<div class="foot_bj">
  <div id="foot">
    <div class="lf">
      <p class="footer1"><img src="./images/logo(1).png" alt="" class=" footLogo"></p>
      <p class="footer2"><img src="./images/footerFont.png" alt=""></p>
      
    </div>
    <div class="foot_left lf">
      <ul>
        <li><h3>买家帮助</h3></li>
        <li><p>新手指南</p></li>
        <li><p>服务保障</p></li>
        <li><p>常见问题</p></li>
      </ul>
      <ul>
        <li><h3>商家帮助</h3></li>
        <li><p>商家入驻</p></li>
        <li><p>商家后台</p></li>
      </ul>
      <ul>
        <li><p><h3>关于我们</h3></li>
        <li><p>关于达内<p></li>
        <li><p>联系我们</p></li>
        <li>
          <img src="./images/wechat.png" alt="">
          <img src="./images/sinablog.png" alt="">
        </li>
      </ul>
    </div>
    <div class="service">
      <p>商城客户端</p>
      <img src="./images/ios.png" class="lf">
      <img src="./images/android.png" alt="" class="lf">
    </div>
    <div class="download">
      <img src="./images/erweima.png">
    </div>
	<!-- 页面底部-备案号 #footer -->
      <div class="record">
        ©2017 达内集团有限公司 版权所有 
      </div>
  </div>
</div>
<script type="text/javascript" src="${basePath}/js/jquery-1.4.3.js"></script>
<script src="${basePath}/js/sweet-alert.min.js"></script>
<script>
    $("#username").blur(function(){
        var data = $("#username").val();
        if (data == null || data == "") {
            $("#showResult").text("用户名不能为空！");
            $("#showResult").css("color","red");
            return false;
        }
        });
    $("#bt-login").click(function(){
    	var password=document.getElementById("password").value;
    	var uname=document.getElementById("uname").value;
    	console.log(password+","+uname);
     $.ajax({
		type:"post",
		url:"login.do",
		data:{
			  "uname":uname,
			  "pass":password,
		},
		dataType:"json",
		success:function(result){
			console.log(result);
			if(result.state==1){
				 swal({
        		     title: '登陆成功',
        		     type: 'success',
        		     showCancelButton: false,
        		     showConfirmButton: false
        		 });
				 setTimeout(function () {
	            		location.href = "toIndex.do";
	            		 }, 1000);
			}else{
				swal({
        			title:result.message,
        			type: 'error',
        			showCancelButton: false,
        			showConfirmButton: true
        		});
			}
		}
	}); 
    })
</script>



</body></html>