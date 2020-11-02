<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head></head>
<body>

<div class="container">
  <c:set var="dbURL" value="${dbUrl}"></c:set>
  <h1>Database URL: ${dbURL}</h1>
  <h1>Database Output</h1>
  <ul>
  	<c:forEach var="record" items="${records}">
    <li>${record}</li>
    </c:forEach>
  </ul>
</div>

</body>
</html>