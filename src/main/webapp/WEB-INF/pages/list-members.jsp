<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<spring:message code="listmembers.title" var="pagetitle"/>
<t:template title="${pagetitle}">
    <jsp:attribute name="foot">
        <jsp:include page="include/confirmdialog.jsp" />
        <script src="${pageContext.request.contextPath}/resources/js/confirmDelete.js"></script>
    </jsp:attribute>
    <jsp:body>
    <h1><spring:message code="listmembers.heading"/></h1>
    <p><spring:message code="listmembers.intro"/></p>
    
    <table class="table table-hover table-striped" >
        <thead>
        <tr>
            <th width="5%"><spring:message code="listmembers.table.heading.id"/></th>
            <th width="10%"><spring:message code="listmembers.table.heading.firstname"/></th>
            <th width="10%"><spring:message code="listmembers.table.heading.lastname"/></th>
            <th width="10%"><spring:message code="listmembers.table.heading.occupation"/></th>
            <th width="20%"><i><spring:message code="listmembers.table.heading.teams"/></i></th>
            <th width="20%"><spring:message code="listmembers.table.heading.actions"/></th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="member" items="${members}">
            <tr>
                <td>${member.id}</td>
                <td>${member.firstname}</td>
                <td>${member.lastname}</td>
                <td>${member.occupation}</td>
                <td>
                    <c:forEach var="team" items="${member.teams}">
                        <spring:message code="listmembers.table.row.action.editteam.tooltip" var="editteamtooltip"/>
                        <a href="${pageContext.request.contextPath}/team/edit/${team.id}.html" class="link-passive" title="${editteamtooltip}"><i>${team.fullDescription}</i></a><br/>
                    </c:forEach>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/team/editmember/${member.id}.html"><spring:message code="listmembers.table.row.action.edit"/></a><br/>
                    <spring:message code="listmembers.deleteconfirm.title" var="deletetitle"/>
                    <spring:message code="listmembers.deleteconfirm.message" arguments="${member.fullDescription}" var="deletemessage"/>
                    <a class="confirmation" href="${pageContext.request.contextPath}/team/deletemember/${member.id}.html" data-toggle="modal" data-target="#confirmDelete" 
                       data-title="${deletetitle}" data-message="${deletemessage}" >
                            <spring:message code="listmembers.table.row.action.delete"/>
                    </a><br/>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <p><a href="${pageContext.request.contextPath}/index.html"><spring:message code="common.link.homepage"/></a></p>
    </jsp:body>
    
</t:template>
