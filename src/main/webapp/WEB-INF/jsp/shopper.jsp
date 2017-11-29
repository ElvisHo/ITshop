<%@page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<!-- saved from url=(0039)http://doc.tedu.cn/tstore/web/cart.html -->
<html><head lang="en"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>商城购物车</title>
    <link rel="stylesheet" href="${basePath}/css/header.css">
    <link rel="stylesheet" href="${basePath}/css/footer.css">
    <link rel="stylesheet" href="${basePath}/css/cart.css">
</head>
<body>
<!-- 页面顶部-->
<header id="top" class="fixed_nav">
    <div id="logo" class="lf">
       <img src="./images/logo.png" alt="">
    </div>
    <div class="rt">
        <ul class="lf">
     
            <li><a href="javascript:;" name="user" id="user">
                      ${sessionScope.p.uname}</a></li>
            <li><a href="toIndex.do">首页</a></li>
        </ul>
    </div>
</header>
<!-- nav主导航-->
<nav id="nav">

</nav>
<div class="modal" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            删除提醒
        </div>
        <div class="modal_information">
            <span>确定删除您的这个宝贝吗？</span>
        </div>
        <div class="yes"><span>删除</span></div>
        <div class="no"><span>不删除</span></div>
    </div>
</div>

<div class="big">
    <form name="" action="" method="post">
    <section id="section">
        <div id="title">
            <b>购物车</b>
            <p>
                已选<span class="total color">0</span>件商品<span class="interval"></span>合计(不含运费):<span class="totalPrices color susum">0.00</span><span class="unit color">元</span>
            </p>
        </div>
        <div id="box">
            <div id="content_box">
                <div class="imfor_top">
                    <div class="check_top">
                        <div class="all">
                            <span class="normal">
                            <input type="checkbox" name="" value="">
                            </span>  
                        </div>
                    </div>
                    <div class="pudc_top">商品</div>
                    <div class="pices_top">单价(元)</div>
                    <div class="num_top">数量</div>
                    <div class="totle_top">金额</div>
                    <div class="del_top">操作</div>
                </div>
                  <div  class="body">
                  
                  </div>
            <div class="foot">
                <div class="foot_check">
                    <div class="all">
                        <span class="normal">
                            </span>  <input type="hidden" name="" value="">全选
                    </div>
                </div>
                <a href="javascript:;" class="foot_del">删除</a>
                <div class="foot_cash" id="go-buy">去结算</div>
                <div class="foot_tol"><span>合计(不含运费):</span><span class="foot_pices susumOne">0.00</span><span class="foot_des">元</span></div>
                <div class="foot_selected">
                    已选<span class="totalOne color">0</span>件商品
                </div>
            </div>
        </div>
    </section>
    </form>

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
        <li><h3>关于我们</h3></li>
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
<script src="${basePath}/js/jquery-3.2.1.min.js"></script>
<script src="${basePath}/js/cart.js"></script>
<script src="${basePath}/js/index.js"></script>
<script>
    $(function(){
    	var uname='${sessionScope.p.uname}';
    	console.log(uname);
    	 var text = "";
    	 $.ajax({
    		type:"post",
    		url:"findCarByuname.do",
    		data:{
    			  "uname":uname
    		},
    		dataType:"json",
    		success:function(result){
    			if(result.state==1){
    				var list=result.data;
    				console.log(list);
    				for(var i=0;i<list.length;i++){
    				text+=
    				      "<div class='imfor'>"+
    				                    "<div class='check'>"+
    				                        "<div class='Each'>"+
    				                            "<span class='normal'>"+
    				                                "<img src='./images/product_normal.png'>"+
    				                            "</span></div> </div>"+
    				                   "<div class='pudc'>"+
    				                        "<div class='pudc_information' >"+
    				                           "<input type='hidden'>"+
    				                        "<span class='des lf'>"+list[i].goodsname+
    				                        "<input type='hidden' ></span></div></div>"+
    				                    "<div class='pices'>"+
    				                        "<p class='pices_des'>商城特价</p>"+
    				                        "<p class='pices_information'><b>￥</b><span>"+list[i].price+"<input type='hidden'></span></p>"+
    				                    "</div><div class='num'><span class='reduc'>&nbsp;-&nbsp;</span><input type='text' value='"+list[i].num+"'><span class='add'>&nbsp;+&nbsp;</span></div>"+
    				                   "<div class='totle'>"+
    				                        "<span>￥</span>"+
    				                        "<span class='totle_information'>"+list[i].price*list[i].num+"</span></div>"+
    				                    "<div class='del'>"+
    				                  "<a href='javascript:;' class='del_d' onclick='dell("+list[i].id+")'>删除</a></div></div>";
    				}
    			}else{
    				text=result.message;
    			}
    			 $('.body').html(text);
    			}
    			
    });
    });
    $("#go-buy").click(function(){
        window.location.href="";
    });
  //删除当前行
	function dell(e){
			console.log(e);
			$('.modal').fadeIn();
			$('.no').click(function(){
				$('.modal').fadeOut();
			});
			$('.yes').click(function(){
				var url='delCar.do';
				params={
						"id":e
				}
				$.post(url,params,function(result){
      			  if(result.state==1){
      				location.reload();
      			  }
      		  });
				});
  }
</script>

</body></html>