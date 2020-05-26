<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="post v-margin-20">
	<div class="font-large bold">
		<a href="/post/${post.postId}" class="post-title"><c:out value="${post.title}" /></a>
	</div>
	<div>
		<fmt:formatDate value="${post.postedDt}" pattern="dd MMMM YYYY"/> By ${post.author}
	</div>
	<div class="post-body">
		<c:choose>
			<c:when test="${tease}">
			<div>
				<c:out value="${post.teaser}"></c:out>
				<a href="/post/${post.postId}">Continue Reading</a>
			</div>
			</c:when>
			<c:otherwise>
			<div>
				<c:out value="${post.body}"></c:out>
			</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="v-margin-10 clearfix" >
		
		<c:if test="${!empty post.sourceCode}">
			<a href="<c:url value="${post.sourceCode}" />" target="_blank" title="Source Code"
				class="button-32 github-btn"></a>
		</c:if>
	</div>
</div>
