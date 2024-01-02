-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: blogdb
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- Dumping data for table `POST_PART`
--

LOCK TABLES `POST_PART` WRITE;
/*!40000 ALTER TABLE `POST_PART` DISABLE KEYS */;
INSERT INTO `POST_PART` (`POST_PART_ID`, `BODY`) VALUES (1,'<h1><span style=\"font-size: large;\"><strong>Static Content</strong></span></h1>\r\n<div>&nbsp;</div>\r\n<div class=\"paragraph\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; direction: ltr; font-family: \'open sans\', sans-serif; font-size: 16px;\">\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.25em; padding: 0px; direction: ltr; font-family: inherit; font-size: 1em; line-height: 1.6; text-rendering: optimizelegibility;\"><span style=\"font-size: small;\">By default, Spring Boot serves static content from a directory called&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">/static</code>&nbsp;(or&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">/public</code>&nbsp;or&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">/resources</code>&nbsp;or&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">/META-INF/resources</code>) in the classpath or from the root of the&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">ServletContext</code>. It uses the&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">ResourceHttpRequestHandler</code>&nbsp;from Spring MVC so that you can modify that behavior by adding your own&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">WebMvcConfigurer</code>&nbsp;and overriding the&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">addResourceHandlers</code>&nbsp;method.</span></p>\r\n</div>\r\n<div class=\"paragraph\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; direction: ltr; font-family: \'open sans\', sans-serif; font-size: 16px;\">\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.25em; padding: 0px; direction: ltr; font-family: inherit; font-size: 1em; line-height: 1.6; text-rendering: optimizelegibility;\"><span style=\"font-size: small;\">In a stand-alone web application, the default servlet from the container is also enabled and acts as a fallback, serving content from the root of the&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">ServletContext</code>&nbsp;if Spring decides not to handle it. Most of the time, this does not happen (unless you modify the default MVC configuration), because Spring can always handle requests through the&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">DispatcherServlet</code>.</span></p>\r\n</div>\r\n<div class=\"paragraph\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; direction: ltr; font-family: \'open sans\', sans-serif; font-size: 16px;\">\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.25em; padding: 0px; direction: ltr; font-family: inherit; font-size: 1em; line-height: 1.6; text-rendering: optimizelegibility;\"><span style=\"font-size: small;\">By default, resources are mapped on&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">/**</code>, but you can tune that with the&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">spring.mvc.static-path-pattern</code>&nbsp;property. For instance, relocating all resources to&nbsp;<code style=\"box-sizing: border-box; font-family: Monaco, Menlo, Consolas, \'courier new\', monospace; color: #000099; word-break: break-word; border: 1px solid #e1e1e8; padding: 2px 6px; font-size: 0.875rem;\">/resources/**</code>&nbsp;can be achieved as follows:</span></p>\r\n</div>'),(2,'<p>As of Spring boot 2.3 release, spring does not support jar packaging for serving static resources from the <code>src/main/webapp</code>.</p>\r\n<p>Below change is needed to change the package type to war in pom file.</p>\r\n<pre class=\"brush: xml; fontsize: 100; first-line: 1; \">&lt;version&gt;1.0&lt;/version&gt;\r\n&lt;packaging&gt;war&lt;/packaging&gt;\r\n&lt;parent&gt;\r\n  &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;\r\n  &lt;artifactId&gt;spring-boot-starter-parent&lt;/artifactId&gt;\r\n  &lt;version&gt;2.3.0.RELEASE&lt;/version&gt;\r\n&lt;/parent&gt;</pre>\r\n<p>Following change to map the resources to the correct path via Web MVC configuration class.</p>\r\n<pre class=\"brush: java; fontsize: 100; first-line: 1; \">@Configuration\r\npublic class WebMvcConfig implements WebMvcConfigurer {\r\n\r\n	@Override\r\n	public void addResourceHandlers(ResourceHandlerRegistry registry){\r\n		registry.addResourceHandler(\"/WEB-INF/**\")\r\n				.addResourceLocations(\"classpath:/WEB-INF/\");\r\n				.setCachePeriod(0);\r\n		registry.addResourceHandler(\"/**\")\r\n				.addResourceLocations(\"classpath:/WEB-INF/classes/static/\");\r\n				.setCachePeriod(0);\r\n	}\r\n}\r\n</pre>\r\n<p>And the following in application.properties / [.yml] to add prefix and suffix path to the requested view .</p>\r\n<pre class=\"brush: jscript; fontsize: 100; first-line: 1; \">spring.mvc.view.prefix=/WEB-INF/views/\r\nspring.mvc.view.suffix=.jsp</pre>'),(3,'<p>We can define a class annotated with @ControllerAdvice to customize the JSON document to return for a particular controller and/or exception type, as shown in following examples:</p>\r\n<pre class=\"brush: java; gutter: false; fontsize: 100; first-line: 1; \">@ControllerAdvice(basePackageClasses = AcmeController.class)\r\npublic class AcmeControllerAdvice extends ResponseEntityExceptionHandler {\r\n\r\n    @ExceptionHandler(YourException.class)\r\n    @ResponseBody\r\n    ResponseEntity&lt;?&gt; handleControllerException(HttpServletRequest request, Throwable ex) {\r\n        HttpStatus status = getStatus(request);\r\n        return new ResponseEntity&lt;&gt;(new CustomErrorType(status.value(), ex.getMessage()), status);\r\n    }\r\n\r\n    private HttpStatus getStatus(HttpServletRequest request) {\r\n        Integer statusCode = (Integer) request.getAttribute(\"javax.servlet.error.status_code\");\r\n        if (statusCode == null) {\r\n            return HttpStatus.INTERNAL_SERVER_ERROR;\r\n        }\r\n        return HttpStatus.valueOf(statusCode);\r\n    }\r\n\r\n}</pre>'),(4,'<p>When running a Spring Boot application that uses an embedded servlet container (and is packaged as an executable archive), there are some limitations in the JSP support.</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>With Jetty and Tomcat, it should work if you use war packaging. An executable war will work when launched with <code><strong>java -jar</strong></code>, and will also be deployable to any standard container. JSPs are not supported when using an executable jar.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Undertow does not support JSPs.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Creating a custom <code><strong>error.jsp</strong></code> page does not override the default view for error handling. Custom error pages should be used instead.</li>\r\n</ul>'),(5,'<p>Very clean demonstration of how to deploy Springboot application on EC2 is given in the video below.</p>\r\n<p>&nbsp;</p>\r\n<p><iframe title=\"Deploy Spring Boot Application in AWS using EC2 &amp; S3 | JavaTechie\" src=\"https://www.youtube.com/embed/LJkkFx7zJJQ\" frameborder=\"0\" width=\"610\" height=\"380\"></iframe></p>\r\n<p>&nbsp;</p>'),(6,'<p>Test blog body</p>');
/*!40000 ALTER TABLE `POST_PART` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `POST`
--

LOCK TABLES `POST` WRITE;
/*!40000 ALTER TABLE `POST` DISABLE KEYS */;
INSERT INTO `POST` (`POST_ID`, `TITLE`, `AUTHOR`, `POSTED_DT`, `SOURCE_CODE`, `POST_PART_ID`) VALUES (1,'Springboot mapping of static content','Anuran Datta','2023-12-29 09:53:41','',1),(2,'Springboot Web configuration for rendering JSP web pages','Anuran Datta','2024-01-01 08:42:16','https://github.com/anurdatt/ad-sbblog',2),(3,'Exception Handler on Controllers in Spring web. ','Anuran Datta','2024-01-01 09:25:40','',3),(4,'JSP Limitation','Anuran Datta','2024-01-01 10:41:20','',4),(5,'Springboot on AWS EC2 Demo','Anuran Datta','2024-01-01 11:28:54','',5),(6,'Test Blog','Anuran Datta','2024-01-01 11:44:02','',6);
/*!40000 ALTER TABLE `POST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `COMMENT`
--

LOCK TABLES `COMMENT` WRITE;
/*!40000 ALTER TABLE `COMMENT` DISABLE KEYS */;
INSERT INTO `COMMENT` (`COMMENT_ID`, `AUTHOR`, `EMAIL`, `SITE`, `BODY`, `IP_ADDRESS`, `RATING`, `POSTED_DT`, `POST_ID`) VALUES (1,'A Datta','ad@gmail.com','www.google.com','Test comment','157.40.92.219',NULL,'2023-12-30 09:30:11',1);
/*!40000 ALTER TABLE `COMMENT` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `TAG`
--

LOCK TABLES `TAG` WRITE;
/*!40000 ALTER TABLE `TAG` DISABLE KEYS */;
INSERT INTO `TAG` (`TAG_ID`, `NAME`) VALUES (1,'springboot'),(2,'Springboot'),(3,'MVC'),(4,'JSP'),(5,'Webapp'),(6,'SpringWeb'),(7,'Exceptions'),(8,'Sprinboot'),(9,'EC2'),(10,'AWS');
/*!40000 ALTER TABLE `TAG` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `POST_TAG`
--

LOCK TABLES `POST_TAG` WRITE;
/*!40000 ALTER TABLE `POST_TAG` DISABLE KEYS */;
INSERT INTO `POST_TAG` (`POST_ID`, `TAG_ID`) VALUES (1,2),(1,3),(2,2),(2,4),(2,5),(3,6),(3,3),(3,7),(4,4),(4,2),(5,9),(5,10),(5,2);
/*!40000 ALTER TABLE `POST_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` (`ROLE_ID`, `NAME`) VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` (`USER_ID`, `NAME`, `PASSWORD`) VALUES (1,'Anuran Datta','$2a$11$Rtbi2JbOKTowp4V0F6sqvuTb45MqcgzrsmldBXw2iTeFklgIcao6m'),(2,'Demo User','$2a$11$.Uz0olRUwTN.DTqOsIlOWusZTwpA56JeTPezCkzkW4biNjjXnUNDu');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `USER_ROLE`
--

LOCK TABLES `USER_ROLE` WRITE;
/*!40000 ALTER TABLE `USER_ROLE` DISABLE KEYS */;
INSERT INTO `USER_ROLE` (`USER_ID`, `ROLE_ID`) VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `USER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ticks`
--

LOCK TABLES `ticks` WRITE;
/*!40000 ALTER TABLE `ticks` DISABLE KEYS */;
INSERT INTO `ticks` (`tick`) VALUES ('2023-12-29 10:48:02'),('2023-12-29 10:51:07'),('2023-12-29 10:54:07'),('2023-12-29 12:23:36');
/*!40000 ALTER TABLE `ticks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-03  3:26:27
