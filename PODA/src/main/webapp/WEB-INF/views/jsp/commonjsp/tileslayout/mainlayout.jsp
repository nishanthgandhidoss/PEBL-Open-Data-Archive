<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<c:set var="webapp_path" value="${pageContext.request.contextPath}"
	scope="session" />
	

	
<link type="image/x-icon" href="<c:out value='${webapp_path}'/>/images/favicon1.ico" rel="icon">
<meta>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title><tiles:insertAttribute name="title" ignore="true"/></title>
<tiles:insertAttribute name="maincss" />
<tiles:insertAttribute name="mainjs" />
</head>

<body>
  <div class="">
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
	</div>
</body>

</html>