package com.sprhib.controller;

import com.sprhib.model.Organization;
import com.sprhib.service.OrganizationService;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Risto
 */
@Controller
@RequestMapping(value="/organization")
public class OrganizationController {
    
    @Autowired
    private OrganizationService organizationService;
    
    @Autowired
    private MessageSource messageSource;
    
    @RequestMapping( value="/list" )
    public ModelAndView listOrganizationsPage() 
    {
        ModelAndView modelAndView = new ModelAndView("list-organizations");

        List<Organization> organizations = organizationService.getOrganizations();
        modelAndView.addObject("organizations", organizations);

        return modelAndView;
    }
    
    @RequestMapping( value="/edit/{id}", method=RequestMethod.GET )
    public ModelAndView editOrganizationPage(@PathVariable Integer id) 
    {
        ModelAndView modelAndView = new ModelAndView("edit-organization");
        
        Organization organization = organizationService.getOrganization(id);
        modelAndView.addObject("organization",organization);
        
        return modelAndView;
    }
    
    @RequestMapping( value="/edit/{id}", method=RequestMethod.POST )
    public ModelAndView editOrganizationAction(@ModelAttribute Organization organization, @PathVariable Integer id, Locale locale) 
    {
        ModelAndView modelAndView = new ModelAndView("home");
        
        organizationService.updateOrganization(organization);

        String message = messageSource.getMessage("editorganization.success", new Object[]{organization.getName()}, locale);
	modelAndView.addObject("message", message);
        
        return modelAndView;
    }
    
    @RequestMapping( value="/add", method=RequestMethod.GET )
    public ModelAndView addOrganizationPage() 
    {
        ModelAndView modelAndView = new ModelAndView("add-organization");
        modelAndView.addObject("organization",new Organization());
        
        return modelAndView;
    }
    
    @RequestMapping( value="/add", method=RequestMethod.POST )
    public ModelAndView addOrganizationAction(@ModelAttribute Organization organization, Locale locale) 
    {
        ModelAndView modelAndView = new ModelAndView("home");
        organizationService.addOrganization(organization);
        
        String message = messageSource.getMessage("addorganization.success", new Object[]{organization.getName()}, locale);
	modelAndView.addObject("message", message);
        
        return modelAndView;
    }
    
    @RequestMapping( value="/delete/{id}", method=RequestMethod.GET )
    public ModelAndView deleteOrganizationAction(@PathVariable Integer id, Locale locale) 
    {
        ModelAndView modelAndView = new ModelAndView("home");
        
        Organization organization = organizationService.getOrganization(id);
        organizationService.deleteOrganization(id);
        
        String message = messageSource.getMessage("deleteorganization.success", new Object[]{organization.getName()}, locale);
        modelAndView.addObject("message", message);
        
        return modelAndView;
    }
}
