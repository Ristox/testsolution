/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.formatter;

import com.sprhib.model.Member;
import com.sprhib.service.MemberService;
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
public class MemberFormatter implements Formatter<Member> {
    
    @Autowired
    private MemberService memberService;

    @Override
    public String print(Member member, Locale locale) {
        return member.getId().toString();
    }

    @Override
    public Member parse(String memberId, Locale locale) throws ParseException {
        return memberService.getMember( Integer.parseInt(memberId) );
    }
    
}
