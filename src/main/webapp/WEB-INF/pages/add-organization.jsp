<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<spring:message code="addorganization.title" var="pagetitle"/>
<t:template title="${pagetitle}">
    <h1><spring:message code="addorganization.heading"/></h1>
    <p><spring:message code="addorganization.intro"/></p>
    
    <form:form method="POST" commandName="organization" action="${pageContext.request.contextPath}/organization/add.html">
        <table class="table table-condensed">
            <tbody>
                <tr>
                    <td><spring:message code="addorganization.field.name"/></td>
                    <td><form:input class="form-control" path="name" /></td>
                </tr>
                <tr>
                    <td><spring:message code="addorganization.field.city"/></td>
                    <td><form:input class="form-control" path="city" /></td>
                </tr>
                <tr>
                    <spring:message code="addorganization.button.add" var="buttontext"/>
                    <td><input class="btn-info" type="submit" value="${buttontext}" /></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </form:form>
    
    <p><a href="${pageContext.request.contextPath}/index.html"><spring:message code="common.link.homepage"/></a></p>    
</t:template>