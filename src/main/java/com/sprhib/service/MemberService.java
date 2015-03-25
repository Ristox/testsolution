package com.sprhib.service;

import com.sprhib.model.Member;
import java.util.List;

/**
 *
 * @author Risto
 */
public interface MemberService {
	
	public void addMember(Member member);
	public void updateMember(Member member);
	public Member getMember(int id);
	public void deleteMember(int id);
	public List<Member> getMembers();

}
