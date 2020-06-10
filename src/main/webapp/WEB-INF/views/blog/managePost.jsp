<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sbTags" uri="http://softBlog.cloudfoundry.com/sbTags" %>

<sbTags:template cssFiles="post.css,post_tags.css" jsFiles="tag_editor.js,pages/manage_post.js"
title="New Blog" requiresTextEditor="true">
	<div class="font-large bold">New Blog Post</div>
	<form action="<c:url value='/secure/post/save'/>" method="POST">
		<div class="v-margin-10">
			<div class="bold v-margin-4"><span class="required">*</span>Title</div>
			<div>
				<input name="title" class="post-title" value="${post.title}" />
			</div>
			<form:errors path="post.title" cssClass="error field-error" />
			<div class="bold v-margin-4">Source Code</div>
			<div>
				<input name="sourceCode" class="post-title" value="${post.sourceCode}" />
			</div>
		</div>
		<div class="v-margin-10 clearfix">
			<textarea id="post-editor" class="post-editor post-title" name="postPart.body">${post.postPart.body}</textarea>
		</div>
		<div class="v-margin-10">
			<div class="bold v-margin-4">Tags</div>
			<div class="tag-editor"></div>
		</div>
		<%-- <c:set var="hasPostedDt" value="false" />
		<c:if test="${ ! empty post.postedDt}"><c:set var="hasPostedDt" value="true" /></c:if>
		<input name="hasPostedDt" type="hidden" value="${hasPostedDt}" /> --%>
		<%-- <input id="postedDt" name="postedDt" type="hidden" value="<fmt:formatDate pattern="yyyy-MM-dd hh:mm:SS.s" value="${post.postedDt}"/>" /> --%>
		<input id="postId" name="postId" type="hidden" value="${post.postId}" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	<div class="spacer"></div>
</sbTags:template>