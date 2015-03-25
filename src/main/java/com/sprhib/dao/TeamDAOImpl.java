package com.sprhib.dao;

import com.sprhib.model.Member;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sprhib.model.Team;
import org.hibernate.criterion.Restrictions;

@Repository
public class TeamDAOImpl implements TeamDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
        
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

        @Override
	public void addTeam(Team team) {
		getCurrentSession().save(team);
	}

        @Override
	public void updateTeam(Team team) {
		Team teamToUpdate = getTeam(team.getId());
		teamToUpdate.setName(team.getName());
		teamToUpdate.setRating(team.getRating());
                teamToUpdate.setOrganization(team.getOrganization());
                
                //if "team" has members, add/keep that latest set on the persisted version
                if (team.getMembers() != null && !team.getMembers().isEmpty()) {
                    teamToUpdate.getMembers().addAll(team.getMembers()); 
                    teamToUpdate.getMembers().retainAll(team.getMembers()); 
                } 
                else 
                    teamToUpdate.getMembers().clear(); //in case there were any members previously
                    
		getCurrentSession().update(teamToUpdate);
	}

        @Override
	public Team getTeam(int id) {
		Team team = (Team) getCurrentSession().get(Team.class, id);
		return team;
	}

        @Override
	public void deleteTeam(int id) {
		Team team = getTeam(id);
		if (team != null)
			getCurrentSession().delete(team);
	}

	@SuppressWarnings("unchecked")
        @Override
	public List<Team> getTeams() {
		return getCurrentSession().createQuery("from Team").list();
	}

        /**
         * Update the teams of the given member<br/>
         * Each saved team associated with the member is updated, by<br/>
         *  - removing the member from the members of the team, if the team is not part of the teams list of the member anymore<br/>
         *  - adding (or keeping, if already added) the member to the members of the team, if the team is part of the teams list of the member<br/>
         * @param member 
         */
        @Override
        public void updateTeamsWith(Member member) {
                List<Team> savedTeams = getCurrentSession().createCriteria(Team.class)
                                            .createCriteria("members")
                                            .add(Restrictions.idEq( member.getId() ))
                                            .list();
                
                if (savedTeams.equals(member.getTeams()))
                    return;
                System.out.println("different, continuing..");
                if (member.getTeams() == null || member.getTeams().isEmpty()) {
                    for (Team t: savedTeams)
                        t.getMembers().remove(member);
                    return;
                }

                for (Team t: savedTeams)
                    if ( !member.getTeams().contains(t) )
                       t.getMembers().remove(member);
                
                for (Team t: member.getTeams())
                    getTeam(t.getId()).getMembers().add(member);
                
        }
        
}
