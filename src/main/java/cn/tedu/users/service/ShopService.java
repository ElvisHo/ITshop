package cn.tedu.users.service;

import cn.tedu.users.entity.Person;
import cn.tedu.users.entity.Shopkeeper;

public interface ShopService {
    void regist(Person p);
	Person login(String uname,String password);
	void update(Person p);
	Person findPersonMessage(int id,String type);
	void judgeInput(String uname,String hidden);
	Shopkeeper findShopkeeperMessage(String shopname);
	Shopkeeper findPersonByUname(String uname);
}
