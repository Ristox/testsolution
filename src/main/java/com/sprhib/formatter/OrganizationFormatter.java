package com.sprhib.formatter;

import com.sprhib.model.Organization;
import com.sprhib.service.OrganizationService;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

/**
 *
 * @author Risto
 */
@Component
public class OrganizationFormatter implements Formatter<Organization> {
    
    @Autowired
    private OrganizationService organizationService;
    
    @Override
    public String print(Organization org, Locale locale) {
        return org.getId().toString();
    }

    @Override
    public Organization parse(String id, Locale locale) throws ParseException {
        return organizationService.getOrganization( Integer.parseInt(id) );
    }
    
}
