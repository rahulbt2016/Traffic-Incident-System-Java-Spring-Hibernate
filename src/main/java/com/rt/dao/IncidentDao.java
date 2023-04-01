package com.rt.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.rt.model.*;

@Component
@Transactional
public class IncidentDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    // Save an incident
    public void saveIncident(Incident incident) {
        hibernateTemplate.saveOrUpdate(incident);
    }

    // Get all incidents by officer
    public List<Incident> getIncidentsByOfficer(Officer officer) {
        String hql = "FROM Incident WHERE officer = ?1 ORDER BY incident_id DESC";
        return hibernateTemplate
				.getSessionFactory()
				.getCurrentSession()
				.createQuery(hql, Incident.class)
				.setParameter(1, officer)
				.getResultList();
    }

}
