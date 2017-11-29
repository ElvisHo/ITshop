package cn.tedu.goods.entity;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import cn.tedu.common.web.JsonDateTypeConvert;

/**
 * 商品表
 * @author Administrator
 *
 */
public class Goods { 
	private int id;
	private double price;
     private int num;
     //生产日期
     private Date productiveTime;
     //保质期
     private Date badTime;
     private String goodsname;
     private String host;
     private String img;
     public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
     public int getId() {
    	 return id;
     }
     public void setId(int id) {
    	 this.id = id;
     }
     public String getGoodsname() {
    	 return goodsname;
     }
     public void setGoodsname(String goodsname) {
    	 this.goodsname = goodsname;
     }
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	@JsonSerialize(using=JsonDateTypeConvert.class)
	public Date getProductiveTime() {
		return productiveTime;
	}
	public void setProductiveTime(Date productiveTime) {
		this.productiveTime = productiveTime;
	}
	@JsonSerialize(using=JsonDateTypeConvert.class)
	public Date getBadTime() {
		return badTime;
	}
	public void setBadTime(Date badTime) {
		this.badTime = badTime;
	}

	public Goods() {
		
	}
	public Goods(int id, String goodsname, double price, int num, Date productiveTime, Date badTime,String host,String img) {
		this.id = id;
		this.goodsname = goodsname;
		this.price = price;
		this.num = num;
		this.productiveTime = productiveTime;
		this.badTime = badTime;
		this.img=img;
		this.host=host;
	}
	@Override
	public String toString() {
		return "Goods [id=" + id + ", price=" + price + ", num=" + num+ ", productiveTime=" + productiveTime
				+ ", badTime=" + badTime + ", goodsname=" + goodsname +"host= "+host+"img"+img+"]";
	}

     
    
}
