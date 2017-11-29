package cn.tedu.users.entity;
/**
 * 买家表
 * @author Administrator
 *
 */
public class Passenger extends Person{
    private double money;
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	
	public Passenger(int id,String uname, String password, long phone,double money,String type) {
		super(id,uname, password, phone,type);
		this.money=money;
	}
	public Passenger() {
		
	}
	
	public Passenger(int id,String uname, String password, long phone,String type) {
		super(id,uname, password, phone,type);
	}
	private void Passenger() {
		// TODO Auto-generated method stub
		
	}
    
}
