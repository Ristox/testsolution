<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>  
<!-- Fixed navbar -->
    
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">

        <div class="navbar-header">
          <%-- navbar expand button, visible within a compact view (when navbar menus don't fit natively) %--%>
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button> 
          <span class="navbar-brand"><spring:message code="navbar.main.title"/></span>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}/"><spring:message code="navbar.main.item.home"/></a></li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><spring:message code="navbar.main.item.organizations"/><span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="${pageContext.request.contextPath}/organization/add.html"><spring:message code="navbar.main.menuitem.add"/></a></li>
                    <li><a href="${pageContext.request.contextPath}/organization/list.html"><spring:message code="navbar.main.menuitem.list"/></a></li>
                </ul>            
            </li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><spring:message code="navbar.main.item.teams"/><span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="${pageContext.request.contextPath}/team/add.html"><spring:message code="navbar.main.menuitem.add"/></a></li>
                    <li><a href="${pageContext.request.contextPath}/team/list.html"><spring:message code="navbar.main.menuitem.list"/></a></li>
                </ul>            
            </li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><spring:message code="navbar.main.item.teammembers"/><span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="${pageContext.request.contextPath}/team/addmember.html"><spring:message code="navbar.main.menuitem.add"/></a></li>
                    <li><a href="${pageContext.request.contextPath}/team/listmembers.html"><spring:message code="navbar.main.menuitem.list"/></a></li>
                </ul>            
            </li>
            
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><spring:message code="navbar.main.item.language"/><span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="?lang=en"><img src="${pageContext.request.contextPath}/resources/img/english.png" width="21" height="15"/> En</a></li>
                    <li><a href="?lang=et"><img src="${pageContext.request.contextPath}/resources/img/estonian.png" width="20" height="15"/> Et</a></li>
                </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->

      </div>
    </nav>