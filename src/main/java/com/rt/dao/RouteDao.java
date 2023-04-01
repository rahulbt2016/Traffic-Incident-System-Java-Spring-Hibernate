package com.rt.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.rt.model.Route;


@Component
public class RouteDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	//get route by route id
	public Route getRoute(int routeId) {
		return hibernateTemplate.get(Route.class, routeId);
	}

	//get all routes
	public List<Route> getRoutes(){
		DetachedCriteria criteria = DetachedCriteria.forClass(Route.class);
	    criteria.addOrder(Order.asc("routeName"));
	    return (List<Route>) hibernateTemplate.findByCriteria(criteria);
	}
	
	
}
