<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<spring:message code="editorganization.title" var="pagetitle"/>
<t:template title="${pagetitle}">
    <h1><spring:message code="editorganization.heading"/></h1>
    <p><spring:message code="editorganization.intro"/></p>
    
    <form:form method="POST" commandName="organization" action="${pageContext.request.contextPath}/organization/edit/${organization.id}.html">
    <table class="table table-condensed">
    <tbody>
        <tr>
            <td><spring:message code="editorganization.field.name"/></td>
            <td><form:input class="form-control" path="name" /></td>
        </tr>
        <tr>
            <td><spring:message code="editorganization.field.city"/></td>
            <td><form:input class="form-control" path="city" /></td>
        </tr>
        <tr>
            <spring:message code="editorganization.button.edit" var="buttontext"/>
            <td><input class="btn-info" type="submit" value="${buttontext}" /></td>
            <td></td>
        </tr>
    </tbody>
    </table>
    </form:form>

    <p><a href="${pageContext.request.contextPath}/index.html"><spring:message code="common.link.homepage"/></a></p>
</t:template>