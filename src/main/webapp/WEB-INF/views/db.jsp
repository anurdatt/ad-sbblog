<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head></head>
<body>

<div class="container">
  <h1>Database Output</h1>
  <ul>
  	<c:forEach var="record" items="${records}">
    <li>${record}</li>
    </c:forEach>
  </ul>
</div>

</body>
</html>