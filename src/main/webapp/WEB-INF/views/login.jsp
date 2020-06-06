<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://simpleBlog.cloudfoundry.com/sbTags" prefix="sbTags" %>

<sbTags:template>
	<c:if test="${not empty error}">
		<div>${error}</div>
	</c:if>
	<c:if test="${not empty message}">
		<div>${message}</div>
	</c:if>
	<form name="login" action="<c:url value='/loginAdmin' />" method="post">
		<div class="page-title">Login</div>
		<div class="v-margin-10">
			<div class="bold v-margin-4">Username</div>
			<input name="j_username" />
		</div>
		<div class="v-margin-10">
			<div class="bold v-margin-4">Password</div>
			<input name="j_password" />
		</div>
		<input type="submit" class="control" value="Login" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</sbTags:template>