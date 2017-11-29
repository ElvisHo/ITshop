package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.tedu.goods.dao.GoodsDao;
import cn.tedu.goods.entity.Goods;
import cn.tedu.goods.service.GoodsService;
import cn.tedu.users.dao.ShopkeeperDao;
import cn.tedu.users.entity.Shopkeeper;

public class Demo {
		  ClassPathXmlApplicationContext ctx;
			@Before
			public void init(){
				ctx=new ClassPathXmlApplicationContext("spring-mvc.xml","spring-mybatis.xml");
			}
			@Test
			public void test1() throws ParseException{
				GoodsService pd=ctx.getBean("goodsServiceImpl",GoodsService.class);
		       List<Goods>list= pd.findGoodsByGoodsnameHost("H");
		        System.out.println(list);
			}
			@After
			public void destroy(){
				ctx.close();
			}
		}



