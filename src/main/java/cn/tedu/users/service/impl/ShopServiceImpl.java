package cn.tedu.users.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.common.exception.ServiceException;
import cn.tedu.users.dao.PassengerDao;
import cn.tedu.users.dao.ShopkeeperDao;
import cn.tedu.users.entity.Passenger;
import cn.tedu.users.entity.Person;
import cn.tedu.users.entity.Shopkeeper;
import cn.tedu.users.service.ShopService;
@Service
public class ShopServiceImpl implements ShopService{
    @Autowired
    private ShopkeeperDao shDao;
    @Autowired
    private PassengerDao paDao;
	@Override
	public void regist(Person p) {
		judgeInput(p.getUname(), p.getType());
	  if("s".equals(p.getType())){
		  shDao.saveShopkeeper(p);
	  }else{
		  paDao.savePassenger(p);
	  }
	}

	@Override
	public Person login(String uname, String password) {
	Passenger pa=paDao.findPassengerByUname(uname);
	Shopkeeper sh=shDao.findShopkeeperByUname(uname);
	if(pa==null&&sh==null){
		throw new ServiceException("用户名不存在");
	}
	if(pa!=null&&pa.getPassword().equals(password)){
		return pa;
	}else if(sh!=null&&sh.getPassword().equals(password)){
		return sh;
	}else{
		throw new ServiceException("密码错误");
	}
	}

	@Override
	public void update(Person p) {
		if("s".equals(p.getType())){
			Shopkeeper s=shDao.findShopkeeperById(p.getId());
			s.setPassword(p.getPassword());
			s.setUname(p.getUname());
			s.setPhone(p.getPhone());
		      shDao.updateShopkeeper(s);
		  }else{
			  Passenger s=paDao.findPassengerById(p.getId());
				s.setPassword(p.getPassword());
				s.setUname(p.getUname());
				s.setPhone(p.getPhone());
			  paDao.updatePassenger(s);
		  }
	}

	@Override
	public Person findPersonMessage(int id, String type) {
	Person p;
    if("p".equals(type)){
		p=paDao.findPassengerById(id);
	}else{
		p=shDao.findShopkeeperById(id);
	}
		return p;
	}

	@Override
	public void judgeInput(String uname, String type) {
		Person p=null;
	    if("p".equals(type)){
			p=paDao.findPassengerByUname(uname);
		}else{
			p=shDao.findShopkeeperByUname(uname);
		}
      if(p!=null){
    	  throw new ServiceException("用户名已存在");
      }
		}
		
	@Override
	public Shopkeeper findPersonByUname(String uname) {
		Shopkeeper sh=shDao.findShopkeeperByUname(uname);
		 if(sh!=null){
			return sh;
		}
		return null;
	}

	@Override
	public Shopkeeper findShopkeeperMessage(String shopname) {
		Shopkeeper sh=shDao.findShopkeeperByShopname(shopname);
		if(sh!=null) throw new ServiceException("店铺名已存在");
		return sh;
	}

}
