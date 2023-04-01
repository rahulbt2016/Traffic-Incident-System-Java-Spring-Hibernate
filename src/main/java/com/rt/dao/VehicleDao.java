package com.rt.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.rt.model.Route;
import com.rt.model.Vehicle;


@Component
public class VehicleDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	

	//get all vehicles
	public List<Vehicle> getVehicles(){
		DetachedCriteria criteria = DetachedCriteria.forClass(Vehicle.class);
	    criteria.addOrder(Order.asc("vehicleId"));
	    return (List<Vehicle>) hibernateTemplate.findByCriteria(criteria);
	}
	
}
