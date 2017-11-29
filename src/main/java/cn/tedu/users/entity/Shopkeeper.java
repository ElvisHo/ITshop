package cn.tedu.users.entity;
/**
 * 卖家表
 * @author Administrator
 *
 */
public class Shopkeeper extends Person{
     public String shopname;
     public double account;
     
	public double getAccount() {
		return account;
	}
	public void setAccount(double account) {
		this.account = account;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public Shopkeeper() {
		
	}
	public Shopkeeper(int id, String shopname, String uname, String password, long phone,  double account,String type) {
		super(id,uname,password,phone,type);
		this.shopname = shopname;
		this.account = account;
	}
	public Shopkeeper(int id,String shopname, String uname, String password, long phone,String type) {
		super(id,uname,password,phone,type);
		this.shopname = shopname;
	}
	
}
