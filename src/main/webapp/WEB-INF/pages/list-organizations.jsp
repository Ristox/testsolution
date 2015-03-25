<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<spring:message code="listorganizations.title" var="pagetitle"/>
<t:template title="${pagetitle}">
    <jsp:attribute name="foot">
        <jsp:include page="include/confirmdialog.jsp" />
        <script src="${pageContext.request.contextPath}/resources/js/confirmDelete.js"></script>
    </jsp:attribute>
    <jsp:body>
    <h1><spring:message code="listorganizations.heading"/></h1>
    <p><spring:message code="listorganizations.intro"/></p>
    
    <table class="table table-hover table-striped" >
        <thead>
            <tr>
            <th width="10%"><spring:message code="listorganizations.table.heading.id"/></th>
            <th width="15%"><spring:message code="listorganizations.table.heading.name"/></th>
            <th width="10%"><spring:message code="listorganizations.table.heading.city"/></th>
            <th width="10%"><spring:message code="listorganizations.table.heading.actions"/></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="org" items="${organizations}">
            <tr>
                <td>${org.id}</td>
                <td>${org.name}</td>
                <td>${org.city}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/organization/edit/${org.id}.html"><spring:message code="listorganizations.table.row.action.edit"/></a><br/>
                    <spring:message code="listorganizations.deleteconfirm.title" var="deletetitle"/>
                    <spring:message code="listorganizations.deleteconfirm.message" arguments="${org.name}" var="deletemessage"/>
                    <a class="confirmation" href="${pageContext.request.contextPath}/organization/delete/${org.id}.html" data-toggle="modal" data-target="#confirmDelete" 
                       data-title="${deletetitle}" data-message="${deletemessage}" >
                            <spring:message code="listorganizations.table.row.action.delete"/>
                    </a><br/>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>

    <p><a href="${pageContext.request.contextPath}/index.html"><spring:message code="common.link.homepage"/></a></p>
    </jsp:body>
</t:template> 
