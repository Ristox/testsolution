package com.sprhib.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Table;

import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.ManyToMany;
import java.beans.Transient;
import java.io.Serializable;

/**
 *
 * @author Risto
 */
@Entity
@Table( name="members" )
public class Member implements Serializable {
    
    @Id
    @GeneratedValue( strategy = GenerationType.AUTO )
    private Integer id;
    
    private String firstname;
    private String lastname;
    private String occupation;

    @ManyToMany( mappedBy = "members", fetch = FetchType.EAGER )
    private Set<Team> teams = new HashSet<>();
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }
    
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public Set<Team> getTeams() {
        return teams;
    }

    public void setTeams(Set<Team> teams) {
        this.teams = teams;
    }
    
    @Transient
    public String getFullDescription() {
        return getFirstname()+" "+getLastname()+" ("+getOccupation()+")";
    }
    
    @Override
    public int hashCode() {
        int hash = 47;
        hash *= hash + (getId() != null ? getId().hashCode() : 0);
        if (getId() != null) 
            return hash;

        hash *= hash + (getFirstname()!= null ? getFirstname().hashCode() : 0); 
        hash *= hash + (getLastname()!= null ? getLastname().hashCode() : 0); 
        hash *= hash + (getOccupation()!= null ? getOccupation().hashCode() : 0); 

        return hash;
    }
   
    @Override
    public boolean equals(Object object) {

        if( object == null )
            return false;

        if( this == object )
            return true;

        if( getClass() != object.getClass() )
            return false;

        Member that = (Member)object;
        if( this.getId() != null && that.getId() != null )
            return this.getId().equals(that.getId());

        if (
            this.getFirstname().equals(that.getFirstname()) &&
            this.getLastname().equals(that.getLastname()) &&
            this.getOccupation().equals(that.getOccupation())
           )
            return true;

        return false;
    }

    @Override
    public String toString() {
        return "Member[ id=" + getId() + 
              ", firstname=" + getFirstname()+ 
               ", lastname=" + getLastname()+ 
             ", occupation=" + getOccupation()+ " ]";
    }
}
