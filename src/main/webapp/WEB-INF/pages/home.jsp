<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<spring:message code="home.title" var="pagetitle"/>
<t:template title="${pagetitle}">
    <div align="center">
        <h1><span><spring:message code="home.heading"/></span></h1>
        <c:if test="${not empty message}"><div class="success">${message}</div></c:if>
        <div class="mainmenu">
            <a href="${pageContext.request.contextPath}/organization/list.html"><spring:message code="home.link.organizationlist"/></a><br/>
            <a href="${pageContext.request.contextPath}/organization/add.html"><spring:message code="home.link.addorganization"/></a><br/>
            <br/>
            <a href="${pageContext.request.contextPath}/team/list.html"><spring:message code="home.link.teamlist"/></a><br/>
            <a href="${pageContext.request.contextPath}/team/add.html"><spring:message code="home.link.newteam"/></a><br/>
            <br/>
            <a href="${pageContext.request.contextPath}/team/listmembers.html"><spring:message code="home.link.listmembers"/></a><br/>
            <a href="${pageContext.request.contextPath}/team/addmember.html"><spring:message code="home.link.addmembers"/></a> 
        </div>    
    </div>
</t:template>
