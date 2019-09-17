<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<spring:message code="register.name" var="name"/>
<spring:message code="register.surname" var="surname"/>
<spring:message code="register.pass" var="pass"/>
<spring:message code="register.repass" var="repass"/>

<section class="login-page">
    <h2><spring:message code="register.create" text="default"/></h2>
    <form:form method="post" modelAttribute="newuser">
        <div class="form-group">
            <form:input path="name" type="text" name="name" placeholder='${name}' />
        </div>
        <div class="form-group">
            <form:input path="surname" type="text" name="surname" placeholder='${surname}' />
        </div>
        <div class="form-group">
            <form:input path="username" type="email" name="username" placeholder="Email" />
            <form:errors path="username" cssClass="error" />
        </div>
        <div class="form-group">
            <form:input path="password" type="password" name="password" placeholder='${pass}' />
            <form:errors path="password" cssClass="error" />
        </div>
        <div class="form-group">
            <form:input path="confirmPassword" type="password" name="password2" placeholder='${repass}' />
            <form:errors path="confirmPassword" cssClass="error"/>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/login" class="btn btn--without-border"><spring:message code="register.login" text="default"/></a>
            <form:button class="btn" type="submit"><spring:message code="register.create" text="default"/></form:button>
        </div>
    </form:form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>