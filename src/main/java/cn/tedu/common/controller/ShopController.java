package cn.tedu.common.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import cn.tedu.car.entity.Car;
import cn.tedu.car.service.CarService;
import cn.tedu.common.web.JsonResult;
import cn.tedu.goods.entity.Goods;
import cn.tedu.goods.service.GoodsService;
import cn.tedu.users.entity.Passenger;
import cn.tedu.users.entity.Person;
import cn.tedu.users.entity.Shopkeeper;
import cn.tedu.users.service.ShopService;

@Controller
public class ShopController {
	@Resource
    private  ShopService  shopService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private CarService carService;
	@RequestMapping("/toLogin.do")
	 public String toLogin(){
		 System.out.println("toLogin()");
	     return "jsp/login";
	}
	@RequestMapping("/login.do")
	@ResponseBody
	public JsonResult login(String pass,String uname,HttpSession session){
	   System.out.println("usename:"+uname+",password:"+pass);
	   Person p =shopService.login(uname, pass);
	   System.out.println(p);
	   session.setAttribute("p", p);
	   return new JsonResult();//主界面
 }
	@RequestMapping("/toIndex.do")
	 public String toIndex(){
		 System.out.println("toIndex()");
	     return "jsp/index";
	}
	@RequestMapping("/topassenger_regist.do")
	 public String topassenger_regist(){
		 System.out.println("topassenger_regist()");
	return "jsp/passenger_register";
	}
	@RequestMapping("/toshopkeeper_regist.do")
	 public String toshopkeeper_regist(){
		 System.out.println("toshopkeeper_regist()");
	return "jsp/shopkeeper_register";
	}
	@RequestMapping("/registshopkeeper.do")
	public String regist(Shopkeeper p){
		System.out.println(p);
      shopService.regist(p);
		return "jsp/login";
	}
	@RequestMapping("/registpassenger.do")
	public String regist(Passenger p){
		System.out.println(p);
      shopService.regist(p);
		return "jsp/login";
	}

	@RequestMapping("/regist_detect.do")
	@ResponseBody
	public JsonResult regist_detect(String uname,String type){
		System.out.println("regist_detect()"+uname+type);
		shopService.judgeInput(uname, type);
		return new JsonResult("用户名可用");
	}
	@RequestMapping("/registshopname_detect.do")
	@ResponseBody
	public JsonResult registshopname_detect(String shopname){
		System.out.println("registshopname_detect()"+shopname);
  	shopService.findShopkeeperMessage(shopname);
		return new JsonResult("店铺名可用");
	}
	@RequestMapping("/toorder.do")
	 public String toorder(){
		 System.out.println("toorder()");
	     return "jsp/order_form";
	}
	@RequestMapping("/toshopper.do")
	 public String toshopper(){
		 System.out.println("toshopper()");
	     return "jsp/shopper";
	}
	@RequestMapping("/findGoods.do")
	@ResponseBody
	public JsonResult findGoods(String goodsname){
		System.out.println(" findGoods()"+goodsname);
		List<Goods> goodses=goodsService.findGoodsByGoodsnameHost(goodsname);
		System.out.println(goodses);
		return new JsonResult(goodses);
		
	}
		@RequestMapping("/findAllGoods.do")
		@ResponseBody
		public JsonResult findAllGoods(){
			List<Goods> goodses=goodsService.findAllGoods();
			System.out.println(goodses);
			return new JsonResult(goodses);
	}
		@RequestMapping("/update.do")
	    @ResponseBody
	public JsonResult updateshopkeeper(Person p){
		System.out.println("update.do"+p);
	   shopService.update(p);
		return new JsonResult();
}
		@RequestMapping("/findGoodsByuname.do")
		@ResponseBody
		public JsonResult findGoodsByuname(String uname){
			System.out.println(" findGoodsByuname()"+uname);
			Shopkeeper s=shopService.findPersonByUname(uname);
			List<Goods> goodses=goodsService.findGoodsByGoodsnameHost(s.getShopname());
			System.out.println(goodses);
			return new JsonResult(goodses);
		}

		@RequestMapping("/addCar.do")
	    @ResponseBody
	    public JsonResult addCar(String uname,int id){
		System.out.println("addCar");
		Goods goods=goodsService.findGoodsById(id);
		System.out.println(goods);
		int num=1;
		double price=goods.getPrice();
		Car c=new Car(goods.getGoodsname(),num,price,goods.getHost(),uname,num*price);
		System.out.println(c);
        carService.addCar(c);
		return new JsonResult();
		}
		@RequestMapping("/deleteGoods.do")
		@ResponseBody
		public JsonResult deleteGoods(int id){
			System.out.println("deleteGoods()");
			goodsService.deleteGoods(id);
			return new JsonResult();
		}
		@RequestMapping("/addGoods.do")
		@ResponseBody
		public JsonResult addGoods(Goods g,MultipartFile file,HttpServletRequest request) {
			String abpath = request.getServletContext().getRealPath("/goodsImages/");
			System.out.println(abpath);
			g.setHost(shopService.findPersonByUname(g.getHost()).shopname);
			System.out.println("addGoods(),"+g+","+file.getOriginalFilename());
			goodsService.addGoods(g,file,abpath);
			return new JsonResult();
		}
		@RequestMapping("/findCarByuname.do")
		@ResponseBody
		public JsonResult findCarByuname(String uname){
			System.out.println(" findCarByuname()"+uname);
			List<Car> list=carService.findCarByUname(uname);
			System.out.println(list);
			return new JsonResult(list);
		}
		@RequestMapping("/delCar.do")
		@ResponseBody
		public JsonResult delCar(int id){
			System.out.println("delCar()"+id);
			carService.deleteCar(id);
			return new JsonResult();
		}
		@RequestMapping("/loginout.do")
		@ResponseBody
		public JsonResult loginout(HttpSession session){
			System.out.println("loginout()");
			session.removeAttribute("p");
			return new JsonResult();
		}
}