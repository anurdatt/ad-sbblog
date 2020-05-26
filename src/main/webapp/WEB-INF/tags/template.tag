<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fnt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ attribute name="cssFiles" type="java.lang.String" %>
<%@ attribute name="jsFiles" type="java.lang.String" %>
<%@ attribute name="sideBar" type="java.lang.String" %>
<%@ attribute name="title" type="java.lang.String" %>
<%@ attribute name="requiresTextEditor" type="java.lang.Boolean" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html version="-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ink-Drop "${title}"</title>
<!-- <meta name="google-site-verification" content="TWl2IyBn5Tg6pSDse_sG_TFQ6NoAl-HFkzqPAe2e0XE" /> -->

<jsp:include page="/WEB-INF/views/partials/base_css.jsp"></jsp:include>
<c:if test="${!empty cssFiles}">
	<c:forEach var="cssFile" items="${fn:split(cssFiles, ',') }">
		<c:choose>
			<c:when
				test="${(empty pageContext.request.contextPath && !fn:contains(cssFile, '/css')) 
				|| !fn:contains(cssFile, pageContext.request.contextPath)}">
				<link rel="stylesheet" href="<c:url value="/css/${cssFile}" />" />
			</c:when>
			<c:otherwise>
				<link rel="stylesheet" href="${cssFile}" />" />
			</c:otherwise>
		</c:choose>
	</c:forEach>
</c:if>
<jsp:include page="/WEB-INF/views/partials/base_js.jsp"></jsp:include>

<%-- <c:if test="${requiresTextEditor}">
	<jsp:include page="/WEB-INF/views/partials/text_editor_files.jsp"></jsp:include>
	<script type="text/javascript">
		SyntaxHighlighter.all();
	</script>
</c:if> --%>

<c:if test="${!empty jsFiles}">
	<c:forEach var="jsFile" items="${fn:split(jsFiles, ',') }">
		<c:choose>
			<c:when
				test="${(empty pageContext.request.contextPath && !fn:contains(jsFile, '/js')) 
				|| !fn:contains(jsFile, pageContext.request.contextPath)}">
				<link rel="stylesheet" href="<c:url value="/js/${jsFile}" />" />
			</c:when>
			<c:otherwise>
				<link rel="stylesheet" href="${jsFile}" />" />
			</c:otherwise>
		</c:choose>
	</c:forEach>
</c:if>

<!-- <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-41940964-1', 'simple-blog.rhcloud.com');
  ga('send', 'pageview');

</script> -->
<!-- <meta name="google-site-verification" content="ih5hR8pc2tKIyfgiX9PYZggje0VEQger9avVgxABF-0" /> -->



</head>

<body>
	<jsp:include page="/WEB-INF/views/partials/header.jsp"></jsp:include>
	
	<div id="container" class="clearfix bg4">
		<div id="inner-container" class="bg2">
			<div id="center-panel" class="bg2 clearfix">
				<jsp:doBody />
			</div>
			<div id="side-bar">
				<c:if test="${!empty sideBar}">
					<jsp:include page="/WEB-INF/views/sidebars/${sideBar}"></jsp:include>
				</c:if>
			</div>
		</div>
	</div>
	<div class="spacer"></div>
</body>
</html>