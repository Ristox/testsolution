spr-mvc-hib
===========

Spring MVC + Hibernate + Maven tutorial with all CRUD operations

March 24th, 2015
----------------
Risto Uibo: enhanced to a fully functional production solution

CHANGELOG

- Updated pom.xml to use Hibernate 4.3.8.Final, Spring 4.1.5.RELEASE versions 
(in conjunction to Spring (and Spring Test) library update, JUnit version 
had to be updated from 4.7 to 4.12 as well)
- Added organization class (Organization), one-to-many for organization<->team 
(deleting organization also deletes its teams)
- Added team member class (Member), many-to-many for team<->member 
(deleting a team deletes team<->member associations ; team members remain)
- Added controller for Organization 
- Expanded controller for Team to support associations with organization and operations with team members
- Added Services and DAOs for Organization and Member 
- Expanded DAO for Team to handle association updates with organization and team members
- Added views for listing/creating/updating organizations
- Added views for listing/creating/updating team members
- Expanded views for listing/creating/updating teams to include organization and team members associations
- Added formatters for Team, Member and Organization classes for use in add/edit views (forms)
- Added identity methods - equals(), hashCode(), toString() – as well as Serializable interface 
to all entities (Organization, Team and Member classes)
- Added Bootstrap navbar and menus (included in common view template for all views - see below)
- Added Localization/Internationalization and language switcher (last navbar menu)
- Added some css, js and image icons - related to bootstrap compoments, styled views, confirm dialogs (see below)
- Added sql script for initial manual create-drop of „hibnatedb“ schema and Flyway integration 
for database migration, with first migration script.

Additional (non-requested) features applied:
- Templated views (common template for all view pages), navbar JSP and other 
common parts included within template
- Ability to change team's organization and members from "Edit team" view
- Ability to change member's teams from "Edit member" view
- Team members for each team viewable on "Teams list" view, with direct link 
to "edit member" view for the given member 
- Teams for each team member viewable on "Members list" view, with direct link 
to "edit team" view for the given team
- Various CSS applied for views (bootstrap + custom)
- Dialogs (bootstrap modal) for confirmation of organization/team/member delete actions

Versions used
- JDK: 1.8.0 update 40
- NetBeans IDE: 8.0.2
- MySQL: 5.6.23
- Tomcat: 8.0
- Spring: 4.1.5
- Hibernate: 4.3.8.Final
- Flyway: 3.2.1

Known issues & quirks:
- If language switch (?lang=X) is applied right after an entity change action (edit/add), 
  the view will jump back to the previous edit/add page. This is because after action, 
  the URL is left unchanged (no redirect: used) eg the previous target page, while the 
  controller actually returns the home page after action. 
- If language switch (?lang=X) is applied right after a DELETE action, a 500 error 
  (NullPointerException) occurs since the delete URL with an id of already deleted entity 
  gets resubmitted. Thus, delete action reoccurs on an object which doesn’t exist anymore.
