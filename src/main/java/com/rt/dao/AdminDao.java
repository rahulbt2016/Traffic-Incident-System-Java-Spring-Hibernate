package com.rt.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.rt.model.Admin;


@Component
public class AdminDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	

	//get all admins
	public List<com.rt.model.Admin> getAdmins(){
		return this.hibernateTemplate.loadAll(Admin.class);
	}
	
	
}
