<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="v-margin-20 h-margin-20">
	<div class="bold fg3 v-margin-4 font-medium">Find Posts By Tag</div>
	<div class="bg2 pad-5 border shadow">
		<c:forEach items="${tags}" var="tag">
			<div class="v-margin-4 clearfix">
				<a class="post-tag" href="${pageContext.request.contextPath}/blog/tag/${tag.tagId}">${tag.name}</a>
				<span class="bold fg3"> x ${tag.count}</span>
			</div>
		</c:forEach>
	</div>
</div>