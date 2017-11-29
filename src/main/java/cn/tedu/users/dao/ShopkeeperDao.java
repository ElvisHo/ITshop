package cn.tedu.users.dao;
import org.springframework.stereotype.Repository;

import cn.tedu.users.entity.Person;
import cn.tedu.users.entity.Shopkeeper;
@Repository("shopkeeperDao")
public interface ShopkeeperDao {
Shopkeeper findShopkeeperById(int id);
Shopkeeper findShopkeeperByUname(String uname);
Shopkeeper findShopkeeperByShopname(String shopname);
void saveShopkeeper(Person shopkeeper);
void deleteShopkeeper(int id);
void updateShopkeeper(Person p);
}
