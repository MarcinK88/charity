<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form:form method="post" modelAttribute="donation">
    <form:checkboxes path="categories"
                     items="${categories}" itemValue="name" itemLabel="name"/>
    <form:select path="institution" items="${institutions}" itemValue="name" itemLabel="name"/>
    <form:input path="zipcode"/>
    <form:input path="street"/>
    <form:input path="city"/>
    <form:input path="quantity"/>
    <form:textarea path="pickUpComment"/>
    <form:input type="date" path="pickUpDate"/>
    <form:input type="time" path="pickUpTime"/>
    <button type="submit"></button>
</form:form>

<jsp:include page="footer.jsp"></jsp:include>
<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>