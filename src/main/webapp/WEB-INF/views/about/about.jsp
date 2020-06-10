<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sbTags" uri="http://softBlog.cloudfoundry.com/sbTags"%>
<sbTags:template cssFiles="post.css,post_tags.css,resume.css" title="About">
	<div class="page-title">About Soft Blog</div>
	<p class="v-margin-text-block">Soft Blog is a blog application
		I created to share my Java coding adventures. The site functions as
		an outlet to share my programming experiences with others, as well as
		documentation of my work. This site also grants me the oppurtunity to
		reflect upon different programming concepts and practices.</p>

	<p class="v-margin-text-block">
		Soft Blog also serves as a test bed for new ideas and the exploration
		of new technologies. <!-- The code behind Soft Blog has been taken from following github repo
		<a
			href="https://github.com/kmb385/toThought" target="_blank"> repository</a>.
		-->
	</p>

	<jsp:include page="../partials/profile.jsp"/> 
</sbTags:template>