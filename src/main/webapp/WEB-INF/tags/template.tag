
<%@tag description="Common page template" pageEncoding="ISO-8859-1"%>
<%@attribute name="title" required="true"%>
<%@attribute name="foot" fragment="true" %>
<%-- any content can be specified here e.g.: --%>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />

    <%-- "title" must be given as key from the locale properties file --%>
    <title>${title}</title>

</head>
<body>
    <%-- include separately defined navbar (Bootstrap) --%>
    <jsp:include page="include/navbar.jsp" />
    
    <div class="mycontainer">
    <jsp:doBody/>
    </div>
    
    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <jsp:invoke fragment="foot"/>
</body>
</html>