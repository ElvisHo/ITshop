package cn.tedu.car.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tedu.car.dao.CarDao;
import cn.tedu.car.entity.Car;
import cn.tedu.car.service.CarService;
import cn.tedu.common.exception.ServiceException;

@Service
public class CarServiceImpl implements CarService{
@Autowired
private CarDao cardao;

@Override
public void addCar(Car car) {
 cardao.saveCar(car);
}

@Override
public void deleteCar(int id) {
	cardao.deleteCar(id);
	
}

@Override
public void updateCar(Car car) {
 cardao.updateCar(car);	
}

@Override
public List<Car> findByHost(String host) {
	List<Car> list=cardao.findCarByHost(host);
	if(list.isEmpty())throw new ServiceException("没有添加该商家的商品");
	return list;
}

@Override
public List<Car> findCarByUname(String uname) {
    List<Car> list=cardao.findCarByUname(uname);
    if(list.isEmpty())throw new ServiceException("你的购物车是空的");
	return list;
}

}
