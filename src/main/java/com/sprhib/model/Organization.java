package com.sprhib.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author Risto
 */
@Entity
@Table( name = "organizations", 
        uniqueConstraints = {@UniqueConstraint(columnNames = "name")} )
public class Organization implements Serializable 
{ 
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    
    private String name;
    private String city;
    
    @OneToMany( fetch = FetchType.LAZY, mappedBy = "organization" )
    private Set<Team> teams = new HashSet<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getName() 
    {
        return name;
    }
    public void setName(String name) 
    {
        this.name = name;
    }
    
    public String getCity() 
    {
        return this.city;
    }
    
    public void setCity(String city) 
    {
        this.city = city;
    }
    
    public Set<Team> getTeams() {
        return this.teams;
    }
    
    public void setTeams(Set<Team> teams) {
        this.teams = teams;
    }
    
     @Override
    public int hashCode() {
        int hash = 29;
        hash *= hash + (getId() != null ? getId().hashCode() : 0);
        if (getId() != null) 
            return hash;

        hash *= hash + (getName() != null ? getName().hashCode() : 0); 
        hash *= hash + (getCity() != null ? getCity().hashCode() : 0); 
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        
        if (object == null)
            return false;
        
        if (this == object) 
            return true;
        
        if (getClass() != object.getClass())
            return false;
        
        Organization that = (Organization)object;
        if( this.getId() != null && that.getId() != null )
                return this.getId().equals(that.getId());
        
        if (
            this.getName().equals(that.getName()) &&
            this.getCity().equals(that.getCity())
            )
            return true;
        
        return false;
    }
    
    @Override
    public String toString() {
        return "Organization[ id=" + getId() + 
                         ", name=" + getName() + 
                         ", city=" + getCity() + " ]";
    }
    
}
