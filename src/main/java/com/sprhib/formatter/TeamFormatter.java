/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.formatter;

import com.sprhib.model.Team;
import com.sprhib.service.TeamService;
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
public class TeamFormatter implements Formatter<Team> {
    
    @Autowired
    private TeamService teamService;

    @Override
    public String print(Team t, Locale locale) {
        return t.getId().toString();
    }

    @Override
    public Team parse(String string, Locale locale) throws ParseException {
        return teamService.getTeam( Integer.parseInt(string) );
    }
     
}
