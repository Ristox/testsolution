<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<spring:message code="listteams.title" var="pagetitle"/>
<t:template title="${pagetitle}">
    <jsp:attribute name="foot">
        <jsp:include page="include/confirmdialog.jsp" /> 
        <script src="${pageContext.request.contextPath}/resources/js/confirmDelete.js"></script>
    </jsp:attribute>
    <jsp:body>
    <h1><spring:message code="listteams.heading"/></h1>
    <p><spring:message code="listteams.intro"/></p>
    
    <table class="table table-hover table-striped" >
        <thead>
        <tr>
            <th width="5%"><spring:message code="listteams.table.heading.id"/></th>
            <th width="15%"><spring:message code="listteams.table.heading.name"/></th>
            <th width="5%"><spring:message code="listteams.table.heading.rating"/></th>
            <th width="15%"><spring:message code="listteams.table.heading.organization"/></th>
            <th width="15%"><i><spring:message code="listteams.table.heading.teammembers"/></i></th>
            <th width="20%"><spring:message code="listteams.table.heading.actions"/></th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="team" items="${teams}">
            <tr>
                <td>${team.id}</td>
                <td>${team.name}</td>
                <td>${team.rating}</td>
                <td>${team.organization.name}</td>
                <td>
                    <c:forEach var="member" items="${team.members}">
                        <spring:message code="listteams.table.row.action.editmember.tooltip" var="editmembertooltip"/>
                        <a href="${pageContext.request.contextPath}/team/editmember/${member.id}.html" class="link-passive" title="${editmembertooltip}"><i>${member.fullDescription}</i></a><br/>
                    </c:forEach>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/team/edit/${team.id}.html"><spring:message code="listteams.table.row.action.edit"/></a><br/>
                    <spring:message code="listteams.deleteconfirm.title" var="deletetitle"/>
                    <spring:message code="listteams.deleteconfirm.message" arguments="${team.name}" var="deletemessage"/>
                    <a class="confirmation" href="${pageContext.request.contextPath}/team/delete/${team.id}.html" data-toggle="modal" data-target="#confirmDelete" 
                       data-title="${deletetitle}" data-message="${deletemessage}" >
                            <spring:message code="listteams.table.row.action.delete"/>
                    </a><br/>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <p><a href="${pageContext.request.contextPath}/index.html"><spring:message code="common.link.homepage"/></a></p>
    </jsp:body>
</t:template>
