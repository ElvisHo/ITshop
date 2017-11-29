$(window).load(function() {   
			// 通过swipeslider()方法来初始化该幻灯片插件。
		      $('#full_feature').swipeslider();
		      $('#content_slider').swipeslider({
		        transitionDuration: 600,
		        autoPlayTimeout: 10000,
		        sliderHeight: '300px',

		      });
		      $('#responsiveness').swipeslider();
		      $('#customizability').swipeslider({
		        transitionDuration: 1500, 
		        autoPlayTimeout: 4000, 
		        timingFunction: 'cubic-bezier(0.38, 0.96, 0.7, 0.07)',
		        sliderHeight: '30%'});
	
		
		// $(window).scroll(function(){   //scroll()
			var t=$(window).scrollTop()
			if (t>200) {
				$('.top').stop().fadeIn()
			}else{
				$('.top').stop().fadeOut()
			}
		// })
		$('.top').click(function(){
			$('body,html').stop().animate({scrollTop:0},500)
		})
	})

	$('#hc_btn').click(function(){
    	var goodsname=document.getElementById("goodsname").value;
				 var text = "";
     $.ajax({
		type:"post",
		url:"findGoods.do",
		data:{
			  "goodsname":goodsname
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
					"<a href='javascript:; class='a1'>"+
					"<div class= 'main_name'>商品："+list[i].goodsname+"</div>"+
					"<div class='main_name'> 价格：￥<span>"+list[i].price+"</span></div>"+
					"<div class= 'main_name'>数量："+list[i].num+"件</div>"+
					"<div class= 'main_name'>卖家："+list[i].host+"</div>"+
					"</a><div class='main_name'>" +
                      "<a  id='a2' onclick='f1("+list[i].id+")'>加入购物车</a></div>"+
					"</div></li></ul>"
					}
			}else{
				  text ="<p class='main_right '>"+result.message+"</p>";
			}
		 $('#session').html(text);
		 
	}
     });
	})
	
	$('#allGoods').click(function(){
		$('.banner').hide();
		 var text = "";
		 $.ajax({
				type:"post",
				url:"findAllGoods.do",
				dataType:"json",
				success:function(result){
					if(result.state==1){
						var list=result.data;
						for (var i = 0; i <list.length; i++) {
							text +="<li class='l1'><div class='main_right '>"+
							"<a href='javascript:;'>"+
							"<div class= 'main_name' >商品："+list[i].goodsname+"</div>"+
							"<div class='main_name' >价格：￥<span>"+list[i].price+"</span></div>"+
							"<div class= 'main_name' >数量："+list[i].num+"件</div>"+
							"<div class= 'main_name' >卖家："+list[i].host+"</div></a>" +
						    "<div class='main_name'><a  id='a2' onclick='f1("+list[i].id+")'>加入购物车</a></div>"+
							"</div></li> ";
							}
					}
					 $('#session').html(text);
				}
	});
	})
$('#update').click(function(){
	var uname=$("#uname").val();
	var password=$("#password").val();
	var phone=$("#phone").val();
	var type=$("#type").val();
	var id=$("#id").val();
	var url="update.do";
	 $.ajax({
			type:"post",
			url:url,
			data:{
				  "uname":uname,
				  "password":password,
				  "phone":phone,
				  "type":type,
				  "id":id
			},
			dataType:"json",
			success:function(result){
				console.log(result);
			}
});
});
$('#addGoods').click(function(){
	/*
	var goodsname=$('#modal-goodsname').val();
	var num=$('#modal-num').val();
	var price=$('#modal-price').val();
	var productiveTime=$('#modal-productiveTime').val();
	var badTime=$('#modal-badTime').val();
	var uname=$('#modal-uname').val();
	var file=$('#modal-file').val();
	console.log(file)
	*/
	console.log($('#modal-host'))
	var url="addGoods.do"
	 $("#goodsadd").ajaxSubmit({
			type:"post",
			url:url,
			dataType:"json",
			success:function(result){
				console.log(result);
			}
});
	$('myModaladd').fadeOut();
});



  