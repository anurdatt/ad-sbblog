<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/sbTags.tld" prefix="sbTags" %>

<sbTags:template title="${post.title}" cssFiles="post.css,post_tags.css,comments.css"
 sideBar="blogSideBar.jsp">

	<jsp:include page="../partials/post.jsp"></jsp:include>
	<jsp:include page="../partials/comments.jsp"></jsp:include>
	<jsp:include page="../partials/commentForm.jsp"></jsp:include>

</sbTags:template>