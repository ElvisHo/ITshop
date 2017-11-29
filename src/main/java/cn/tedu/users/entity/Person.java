package cn.tedu.users.entity;
/**
 *买卖家统一父类
 * @author Administrator
 *
 */
public class Person {
	private int id;
	private  String uname;
    private String password;
    private long   phone;
    private String type;
    public int getId() {
    	return id;
    }
    public void setId(int id) {
    	this.id = id;
    }
    public String getType() {
    	return type;
    }
    public void setType(String type) {
    	this.type = type;
    }
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public Person(int id,String uname, String password, long phone,String type) {
		this.id=id;
		this.type=type;
		this.uname = uname;
		this.password = password;
		this.phone = phone;
	}
	public Person() {
		
	}
	@Override
	public String toString() {
		return "Person [id="+id+"uname=" + uname + ", password=" + password + ", phone=" + phone + ", type=" + type + "]";
	}
    
}
