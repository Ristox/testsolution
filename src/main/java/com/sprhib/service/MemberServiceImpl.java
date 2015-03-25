package com.sprhib.service;

import com.sprhib.dao.MemberDAO;
import com.sprhib.model.Member;
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
public class MemberServiceImpl implements MemberService {
    
    @Autowired
    private MemberDAO memberDAO;

    @Override
    public void addMember(Member member) {
        memberDAO.addMember(member);
    }

    @Override
    public void updateMember(Member member) {
        memberDAO.updateMember(member);
    }

    @Override
    public Member getMember(int id) {
        return memberDAO.getMember(id);
    }

    @Override
    public void deleteMember(int id) {
        memberDAO.deleteMember(id);
    }

    @Override
    public List<Member> getMembers() {
        return memberDAO.getMembers();
    }
    
}
