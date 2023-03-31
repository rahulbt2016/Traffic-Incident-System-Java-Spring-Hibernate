package com.rt.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.rt.model.Officer;


@Component
public class OfficerDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	

	//get all officers
	public List<Officer> getOfficers(){
		return this.hibernateTemplate.loadAll(Officer.class);
	}
	
	
}
