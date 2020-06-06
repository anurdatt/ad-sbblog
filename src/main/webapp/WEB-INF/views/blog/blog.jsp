<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/sbTags.tld" prefix="sbTags" %>

<sbTags:template title="All Posts" cssFiles="post.css,post_tags.css"
	sideBar="blogSideBar.jsp">

	<%-- <div>
		<c:out value="Total number of posts retrieved = ${posts.size()}" />
	</div> --%>
	<c:set var="isNew" value="true" scope="request"></c:set>
	<c:forEach var="tmpPost" items="${posts}">
		<c:set var="post" value="${tmpPost}" scope="request"></c:set>
		<jsp:include page="/WEB-INF/views/partials/post.jsp"></jsp:include>
		<%-- <div>
			<c:out
				value="${post.postId} | ${post.title} | ${post.author} | ${post.postedDt} | ${post.sourceCode}">
			</c:out>
		</div> --%>
	</c:forEach>
	
	<div>
		<%-- <c:if test="${!isLastPage}">
			<span><a href="${nextPage}">Next 5 Entries </a> </span>
		</c:if>
		<c:if test="${prevPage > -1}">
			<span><a href="${prevPage}">Previous 5 Entries </a> </span>
		</c:if> --%>

		<c:if test="${!isLastPage}">
			<sbTags:control text="Next 5 Entries" href="${nextPage}"
				classes="float-right shadow" imageClass="next-btn" shrinkwrap="true"
				floatImage="right" />
		</c:if>
		<c:if test="${prevPage > -1}">
			<sbTags:control text="Previous 5 Entries" href="${prevPage}"
				classes="float-left shadow" shrinkwrap="true" imageClass="prev-btn" />
		</c:if>
	</div>

</sbTags:template>