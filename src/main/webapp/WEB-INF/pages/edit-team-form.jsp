<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<spring:message code="editteam.title" var="pagetitle"/>
<t:template title="${pagetitle}">
    <h1><spring:message code="editteam.heading"/></h1>
    <p><spring:message code="editteam.intro"/></p>
    <p>${message}</p>
    
    <form:form method="POST" commandName="team" action="${pageContext.request.contextPath}/team/edit/${team.id}.html">
        <table class="table table-condensed">
        <tbody>
            <tr>
                <td><spring:message code="editteam.field.name"/></td>
                <td><form:input class="form-control" path="name" /></td>
            </tr>
            <tr>
                <td><spring:message code="editteam.field.rating"/></td>
                <td><form:input class="form-control" path="rating" /></td>
            </tr>
            <tr>
                <td><spring:message code="editteam.field.organization"/></td>
                <td>
                    <form:select class="form-control" path="organization" items="${organizations}" itemLabel="name" />
                 </td>
            </tr>
            <tr>
                <td><spring:message code="editteam.field.members"/></td>
                <td>
                    <%-- TODO: improve "itemLabel" concatenation - 
                               how to avoid @Transient Member.fullDescription here and instead use some sort of 2nd-level "Member"-formatter?
                               (considering that MemberFormatter is already in use for conversion between <id> string and <Member> object so it cannot be used) --%>
                    <form:select class="form-control" path="members" multiple="true" items="${teammembers}" size="8" itemLabel="fullDescription" /> 
                 </td>
            </tr>
            <tr>
                <spring:message code="editteam.button.edit" var="buttontext"/>
                <td><input class="btn-info" type="submit" value="${buttontext}" /></td>
                <td></td>
            </tr>
        </tbody>
        </table>
    </form:form>

    <p><a href="${pageContext.request.contextPath}/index.html"><spring:message code="common.link.homepage"/></a></p>    
</t:template>