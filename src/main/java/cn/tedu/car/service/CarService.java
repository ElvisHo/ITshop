package cn.tedu.car.service;

import java.util.List;

import cn.tedu.car.entity.Car;
public interface CarService {
	void addCar(Car car);
	void deleteCar(int id);
	void updateCar(Car car);
	List<Car> findByHost(String host);
	List<Car> findCarByUname(String uname);
	
}
