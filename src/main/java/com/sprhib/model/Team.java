package com.sprhib.model;

import java.util.Set;
import java.util.HashSet;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Table;

import javax.persistence.Id;
import javax.persistence.GeneratedValue;

import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import java.beans.Transient;
import java.io.Serializable;

@Entity
@Table(name="teams")
public class Team implements Serializable {
	
	@Id
	@GeneratedValue
        private Integer id;
        
	private String name;
	private Integer rating;
        
        @ManyToOne
        @JoinColumn( name = "organization" )
        private Organization organization;

        @ManyToMany( fetch = FetchType.EAGER )
        @JoinTable( name = "teammembers",
                    joinColumns = @JoinColumn( name = "team" ),
                    inverseJoinColumns = @JoinColumn( name = "member" ) )
        private Set<Member> members = new HashSet<>();

        public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public Organization getOrganization() {
		return this.organization;
	}
        
        public void setOrganization(Organization organization) {
                this.organization = organization;
        }                

        public Set<Member> getMembers() {
            return members;
        }

        public void setMembers(Set<Member> members) {
            this.members = members;
        }
        
        @Transient
        public String getFullDescription() {
            return getName()+" ("+getOrganization().getName()+") ["+getRating()+"]";
        }
        
        @Override
        public int hashCode() {
            int hash = 17;
            hash *= hash + (getId() != null ? getId().hashCode() : 0);
            if (getId() != null) 
                return hash;

            hash *= hash + (getName() != null ? getName().hashCode() : 0); 
            hash *= hash + (getRating() != null ? getRating().hashCode() : 0); 
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

            Team that = (Team)object;
            if( this.getId() != null && that.getId() != null )
                return this.getId().equals(that.getId());

            if (
                this.getName().equals(that.getName()) &&
                this.getRating().equals(that.getRating())
               )
                return true;

            return false;
        }

        @Override
        public String toString() {
            return "Team[ id=" + getId() + 
                     ", name=" + getName() + 
                   ", rating=" + getRating() + " ]";
        }
        
}
