package com.sprhib.dao;

import com.sprhib.model.Organization;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;


/**
 *
 * @author Risto
 */
@Repository
public class OrganizationDAOImpl implements OrganizationDAO {

    
    @Autowired
    private SessionFactory sessionFactory;
	
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @Override
    public void addOrganization(Organization organization) {
        getCurrentSession().save(organization);
    }

    @Override
    public void updateOrganization(Organization organization) {
        Organization o = getOrganization(organization.getId());
        o.setName(organization.getName());
        o.setCity(organization.getCity());
        o.setTeams(organization.getTeams());
        getCurrentSession().update(o);
    }

    @Override
    public Organization getOrganization(int id) {
        return (Organization) getCurrentSession().get(Organization.class, id);
    }

    @Override
    public void deleteOrganization(int id) {
        Organization o = getOrganization(id);
        if (o != null)
            getCurrentSession().delete(o);
    }

    @Override
    public List<Organization> getOrganizations() {
        return getCurrentSession().createCriteria(Organization.class).list();
    }
    
}
