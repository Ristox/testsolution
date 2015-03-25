package com.sprhib.controller;

import com.sprhib.model.Member;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sprhib.model.Team;
import com.sprhib.service.TeamService;

import com.sprhib.model.Organization;
import com.sprhib.service.MemberService;
import com.sprhib.service.OrganizationService;
import java.util.Locale;
import org.springframework.context.MessageSource;
import org.springframework.ui.Model;

@Controller
@RequestMapping(value="/team")
public class TeamController {
	
	@Autowired
	private TeamService teamService;
        
        @Autowired
        private MemberService memberService;
        
        @Autowired
        private OrganizationService organizationService;
        
        @Autowired
        private MessageSource messageSource;
	
        
	@RequestMapping(value="/list")
	public ModelAndView listTeamsPage() {
		ModelAndView modelAndView = new ModelAndView("list-of-teams");
		List<Team> teams = teamService.getTeams();
		modelAndView.addObject("teams", teams);
		return modelAndView;
	}
        
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public ModelAndView addTeamPage() {
		ModelAndView modelAndView = new ModelAndView("add-team-form");
		modelAndView.addObject("team", new Team());
                List<Organization> organizations = organizationService.getOrganizations();
                List<Member> members = memberService.getMembers();
                modelAndView.addObject("organizations", organizations);
                modelAndView.addObject("teammembers", members);
		return modelAndView;
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public ModelAndView addTeamAction(@ModelAttribute Team team, Model model, Locale locale) {
		ModelAndView modelAndView = new ModelAndView("home");
		teamService.addTeam(team);
                String message = messageSource.getMessage("addteam.success", new Object[]{team.getName()}, locale);
		modelAndView.addObject("message", message);
		return modelAndView;
	}
        
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public ModelAndView editTeamPage(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("edit-team-form");
		Team team = teamService.getTeam(id);
		modelAndView.addObject("team",team);
                List<Organization> organizations = organizationService.getOrganizations();
                List<Member> members = memberService.getMembers();
                modelAndView.addObject("organizations", organizations);
                modelAndView.addObject("teammembers", members);
		return modelAndView;
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.POST)
	public ModelAndView editTeamAction(@ModelAttribute Team team, @PathVariable Integer id, Locale locale) {
		ModelAndView modelAndView = new ModelAndView("home");
		teamService.updateTeam(team);
                String message = messageSource.getMessage("editteam.success", new Object[]{team.getName()}, locale);
		modelAndView.addObject("message", message);
		return modelAndView;
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public ModelAndView deleteTeamAction(@PathVariable Integer id, Locale locale) {
		ModelAndView modelAndView = new ModelAndView("home");
                Team team = teamService.getTeam(id);
		teamService.deleteTeam(id);
                String message = messageSource.getMessage("deleteteam.success", new Object[]{team.getName()}, locale);
		modelAndView.addObject("message", message);
		return modelAndView;
	}
        
        
        
        
        @RequestMapping(value="/listmembers", method=RequestMethod.GET)
        public ModelAndView listMembersPage() {
                ModelAndView modelAndView = new ModelAndView("list-members");
		List<Member> members = memberService.getMembers();
		modelAndView.addObject("members", members);
		return modelAndView;
        }
        
        @RequestMapping(value="/addmember", method=RequestMethod.GET)
	public ModelAndView addTeamMemberPage() {
		ModelAndView modelAndView = new ModelAndView("add-teammember");
		modelAndView.addObject("member", new Member());
                List<Team> teams = teamService.getTeams();
		modelAndView.addObject("teams", teams);
		return modelAndView;
	}

        @RequestMapping(value="/addmember", method=RequestMethod.POST)
        public ModelAndView addTeamMemberAction(@ModelAttribute Member member, Locale locale) {
                ModelAndView modelAndView = new ModelAndView("home");
                memberService.addMember(member);
                String message = messageSource.getMessage("addteammember.success", new Object[]{ member.getFullDescription() }, locale );
                modelAndView.addObject("message", message);
                return modelAndView;
        }
        
        @RequestMapping(value="/editmember/{id}", method=RequestMethod.GET)
	public ModelAndView editTeamMemberPage(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("edit-teammember");
		Member member = memberService.getMember(id);
                modelAndView.addObject("member", member);
                List<Team> teams = teamService.getTeams();
		modelAndView.addObject("teams", teams);
		return modelAndView;
	}
        
        @RequestMapping(value="/editmember/{id}", method=RequestMethod.POST)
	public ModelAndView editTeamMemberPage(@ModelAttribute Member member, @PathVariable Integer id,Locale locale) {
		ModelAndView modelAndView = new ModelAndView("home");
                memberService.updateMember(member);
                String message = messageSource.getMessage("editteammember.success", new Object[]{ member.getFullDescription() }, locale);
		modelAndView.addObject("message", message);
		return modelAndView;
	}
        
        @RequestMapping(value="/deletemember/{id}", method=RequestMethod.GET)
	public ModelAndView deleteMemberAction(@PathVariable Integer id, Locale locale) {
                ModelAndView modelAndView = new ModelAndView("home");
                Member member = memberService.getMember(id);
		memberService.deleteMember(id);
                String message = messageSource.getMessage("deleteteammember.success", new Object[]{ member.getFullDescription() }, locale);
		modelAndView.addObject("message", message);
		return modelAndView;
        }
}
