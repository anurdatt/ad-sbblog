<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/sbTags.tld" prefix="sbTags" %>

<sbTags:template title="All Posts" cssFiles="post.css">

	<%-- <div>
		<c:out value="Total number of posts retrieved = ${posts.size()}" />
	</div> --%>
	<c:forEach var="tmpPost" items="${posts}">
		<c:set var="post" value="${tmpPost}" scope="request"></c:set>
		<jsp:include page="/WEB-INF/views/partials/post.jsp"></jsp:include>
		<%-- <div>
			<c:out
				value="${post.postId} | ${post.title} | ${post.author} | ${post.postedDt} | ${post.sourceCode}">
			</c:out>
		</div> --%>
	</c:forEach>

</sbTags:template>