package cn.tedu.car.entity;

public class Car {
	private int id;
	private String goodsname;
    private int num;
    private double price;
    private String host;
    private String uname;
    private double sum;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public double getSum() {
		return sum;
	}
	public void setSum(double sum) {
		this.sum = sum;
	}
	@Override
	public String toString() {
		return "Car [id="+id+",goodsname=" + goodsname + ", num=" + num + ", price=" + price + ", host=" + host + ", uname="
				+ uname + ", sum=" + sum + "]";
	}
	public Car() {
	}
	public Car( int id,String goodsname, int num, double price, String host, String uname, double sum) {
		this.id=id;
		this.goodsname = goodsname;
		this.num = num;
		this.price = price;
		this.host = host;
		this.uname = uname;
		this.sum = sum;
	}
	public Car(String goodsname, int num, double price, String host, String uname, double sum) {
		this.goodsname = goodsname;
		this.num = num;
		this.price = price;
		this.host = host;
		this.uname = uname;
		this.sum = sum;
	}
	
    
}

