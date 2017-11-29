<%@page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<!-- saved from url=(0043)http://doc.tedu.cn/tstore/web/register.html -->
<html><head lang="en"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  <title>IT商城注册页面</title>
  <link href="${basePath}/css/header.css" rel="stylesheet">
  <link href="${basePath}/css/footer.css" rel="stylesheet">
  <link href="${basePath}/css/animate.css" rel="stylesheet">
  <link href="${basePath}/css/login.css" rel="stylesheet">
</head>
<body>
<!-- 页面顶部-->
<header id="top">
  <div class="top">
    <img src="./images/logo.png" alt="">
    <span>欢迎注册</span>
  </div>
</header>
<div class="parent">
  <div class="container">
    <div class="panel rt">
      <form id="form-register" method="post" action="registpassenger.do">
        <div class="txt">
          <p>新用户注册
            <span>
              <a href="toLogin.do">直接登录</a>
            </span>
          </p>
        </div>
        <div class="form-group">
          <label for="uname">用户名：</label>
          <input autocomplete="" required="" minlength="6" maxlength="9" type="text" placeholder="请输入用户名"  name="uname" id="uname" onblur="check();">
          <span class="msg-error" id="msg-error"  >用户名不能为空</span>
        </div>
        <div class="form-group">
          <label for="upwd">登录密码：</label>
          <input required="" type="password" minlength="6" maxlength="12" placeholder="请输入密码" name="password"  id="upwd">
          <span class="msg-default hidden">密码长度在6到12位之间</span>
        </div>
		 <div class="form-group">
          <label for="upwdconfirm">确认密码：</label>
          <input required="" type="password" minlength="6" maxlength="12" placeholder="请确认密码" name="upwdconfirm"  id="upwdconfirm">
          <span class="msg-default hidden">密码长度在6到12位之间</span>
          <input type="hidden"  value="p" name="type" id="type"/>
        </div>
      
        <div class="form-group">
          <label for="phone">手机号：</label>
          <input id="phone" name="phone" placeholder="请输入您的手机号" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$"  type="text">
          <span class="msg-default hidden">请输入合法的手机号</span>
        </div>
        <div class="form-group">
          <label></label>
          <input type="submit" value="提交注册信息" id="bt-register">
        </div>
      </form>
    </div>
  </div>
</div>

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
<script>
  /*1.对用户名进行验证*/
  uname.onblur = function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '用户名不能为空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('用户名不能为空');
    }else if(this.validity.tooShort){
      this.nextElementSibling.innerHTML = '用户名不能少于6位';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('用户名不能少于6位');
    }else {
      this.nextElementSibling.innerHTML = '用户名格式正确';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');
      var data =document.getElementById("uname").value;
      if(!data){   //用户没有输入任何内容
        return;
      }
      var data ={
    		  "uname":document.getElementById("uname").value,
    		  "type":document.getElementById("type").value
      };
      if(!data){   //用户没有输入任何内容
        return;
      }
      console.log(data);
	      $.post("regist_detect.do",data,function(result){
	    	 console.log(result);
	    	 if(result.state==1){
	    	 $("#msg-error").html(result.data);
	    	 }else{
	         $("#msg-error").html(result.message);
	    	 }
	      });
    }
  }

  uname.onfocus = function(){
    this.nextElementSibling.innerHTML = '用户名长度在6到9位之间';
    this.nextElementSibling.className = 'msg-default';
  }

  upwd.onfocus = function(){
    this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
    this.nextElementSibling.className = 'msg-default';
  }
  upwd.onblur = function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '密码不能为空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('密码不能为空');
    }else if(this.validity.tooShort){
      this.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('密码长度在尽量别少于6位');
    }else {
      this.nextElementSibling.innerHTML = '密码格式正确';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');
    }
  }
  

  upwdconfirm.onfocus = function(){
    this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
    this.nextElementSibling.className = 'msg-default';
  }
  
  upwdconfirm.onblur = function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '密码不能为空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('密码不能为空');
    }else if(this.validity.tooShort){
      this.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('密码长度在尽量别少于6位');
    }else {
      this.nextElementSibling.innerHTML = '密码格式正确';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');
    }
  }

  /*3.对手机号进行验证*/
  phone.onblur = function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '手机号不能为空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('手机号不能为空');
    }else if(this.validity.patternMismatch){
      this.nextElementSibling.innerHTML = '手机号格式不正确';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('手机号格式不正确');
    }else {
      this.nextElementSibling.innerHTML = '手机号格式正确';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');
      var data =document.getElementById("phone").value;
      if(!data){   //用户没有输入任何内容
        return;
      }
  
  phone.onfocus = function(){
    this.nextElementSibling.innerHTML = '请输入合法的手机号';
    this.nextElementSibling.className = 'msg-default';
  }
  }
  }
  </script>

</body></html>