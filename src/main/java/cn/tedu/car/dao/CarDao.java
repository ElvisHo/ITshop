package cn.tedu.car.dao;

import java.util.List;

import cn.tedu.car.entity.Car;

public interface CarDao {
	List<Car> findCarByUname(String uname);
	List<Car> findCarByHost(String host);
	void saveCar(Car car);
	void deleteCar(int id);
	void updateCar(Car car);
}
