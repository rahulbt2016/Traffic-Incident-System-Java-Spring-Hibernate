package com.rt.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.rt.model.Taxi;

@Component
@Transactional
public class TaxiDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	public void saveOrUpdate(Taxi taxi) {
		hibernateTemplate.saveOrUpdate(taxi);
	}

	public Taxi getById(int id) {
		return hibernateTemplate.get(Taxi.class, id);
	}

	public List<Taxi> getAll() {
		return hibernateTemplate.loadAll(Taxi.class);
	}

	public void delete(Taxi taxi) {
		hibernateTemplate.delete(taxi);
	}

	public List<Taxi> getTaxisBySourceAndDestination(String source, String destination) {
		String query = "from Taxi where source = ?1 and destination = ?2";
		return hibernateTemplate
				.getSessionFactory()
				.getCurrentSession()
				.createQuery(query, Taxi.class)
				.setParameter(1, source)
				.setParameter(2, destination)
				.getResultList();
	}

}
