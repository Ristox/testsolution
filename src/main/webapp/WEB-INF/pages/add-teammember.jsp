<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<spring:message code="addteammember.title" var="pagetitle"/>
<t:template title="${pagetitle}">
    <h1><spring:message code="addteammember.heading"/></h1>
    <p><spring:message code="addteammember.intro"/></p>

    <form:form method="POST" commandName="member" action="${pageContext.request.contextPath}/team/addmember.html">
    <table class="table table-condensed">
    <tbody>
        <tr>
            <td><spring:message code="addteammember.field.firstname"/></td>
            <td><form:input class="form-control" path="firstname" /></td>
        </tr>
        <tr>
            <td><spring:message code="addteammember.field.lastname"/></td>
            <td><form:input class="form-control" path="lastname" /></td>
        </tr>
        <tr>
            <td><spring:message code="addteammember.field.occupation"/></td>
            <td><form:input class="form-control" path="occupation" /></td>
        </tr>
        <tr>
            <td><spring:message code="addteammember.field.teams"/></td>
            <td>
                <form:select class="form-control" multiple="true" path="teams" items="${teams}" itemLabel="name" size="6" />
             </td>
        </tr>
        <tr>
            <spring:message code="addteammembers.button.add" var="buttontext"/>
            <td><input class="btn-info" type="submit" value="${buttontext}" /></td>
            <td></td>
        </tr>
    </tbody>
    </table>
    </form:form>

    <p><a href="${pageContext.request.contextPath}/index.html"><spring:message code="common.link.homepage"/></a></p>    
</t:template>