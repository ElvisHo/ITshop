package cn.tedu.users.dao;

import org.springframework.stereotype.Repository;

import cn.tedu.users.entity.Passenger;
import cn.tedu.users.entity.Person;

/**
 * 买家的DAO
 */
@Repository("passengerDao")
public interface PassengerDao {
	  Passenger findPassengerById(int id);
	  Passenger findPassengerByUname(String uname);
	  void savePassenger(Person passenger);
	  void deletePassenger(int id);
	  void updatePassenger(Person passenger);
}
