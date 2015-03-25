package com.sprhib.dao;

import com.sprhib.model.Member;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Risto
 */
@Repository
public class MemberDAOImpl implements MemberDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Autowired 
    private TeamDAO teamDAO;   //for updating teams within addMember() and updateMember()

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void addMember(Member member) {
         getCurrentSession().save(member); 
         if ( member.getTeams() != null && !member.getTeams().isEmpty() )
            teamDAO.updateTeamsWith(member);
    }

    @Override
    public void updateMember(Member member) {
        Member m = getMember(member.getId());
        m.setFirstname(member.getFirstname());
        m.setLastname(member.getLastname());
        m.setOccupation(member.getOccupation());
        m.setTeams(member.getTeams());
        getCurrentSession().update(m);
        teamDAO.updateTeamsWith(member);
    }

    @Override
    public Member getMember(int id) {
        return (Member) getCurrentSession().get(Member.class, id);
    }

    @Override
    public void deleteMember(int id) {
        Member m = getMember(id);
        if (m != null)
            getCurrentSession().delete(m);
    }

    @Override
    public List<Member> getMembers() {
        return getCurrentSession().createQuery("from Member").list();
    }
    
}
