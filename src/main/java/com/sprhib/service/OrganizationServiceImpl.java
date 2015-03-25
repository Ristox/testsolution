package com.sprhib.service;

import com.sprhib.dao.OrganizationDAO;
import com.sprhib.model.Organization;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Risto
 */

@Service
@Transactional
public class OrganizationServiceImpl implements OrganizationService {

    @Autowired
    private OrganizationDAO organizationDAO;
    
    @Override
    public void addOrganization(Organization organization) {
        organizationDAO.addOrganization(organization);
    }

    @Override
    public void updateOrganization(Organization organization) {
        organizationDAO.updateOrganization(organization);
    }

    @Override
    public Organization getOrganization(int id) {
        return organizationDAO.getOrganization(id);
    }

    @Override
    public void deleteOrganization(int id) {
        organizationDAO.deleteOrganization(id);
    }

    @Override
    public List<Organization> getOrganizations() {
        return organizationDAO.getOrganizations();
    }
    
}
