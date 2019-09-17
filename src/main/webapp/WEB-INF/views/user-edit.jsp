<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
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
<sec:authentication var="user" property="principal" />

<jsp:include page="header.jsp"></jsp:include>
<spring:message code="register.name" var="name"/>
<spring:message code="register.surname" var="surname"/>
<section class="login-page">
    <h2><spring:message code="profile.change" text="default"/></h2>
    <form:form method="post" modelAttribute="user">
        <div class="form-group">
            <div class="form-group form-group--inline">
            <label><spring:message code="edituser.name" text="default"/> <form:input path="name" id="name" type="text" name="name" placeholder='${name}' /></label>
            </div>
        </div>
        <div class="form-group">
            <div class="form-group form-group--inline">
                <label><spring:message code="edituser.surname" text="default"/> <form:input path="surname" id="surname" type="text" name="surname" placeholder='${surname}' /></label>
            </div>
        </div>
        <div class="form-group">
            <div class="form-group form-group--inline">
                <label>Email <form:input path="username" id="username" type="email" name="username" placeholder="Email" /></label>
            </div>
        </div>

        <form:hidden path="enabled"/>
        <form:hidden path="id"/>

        <div class="form-group form-group--buttons">
            <a href="/profile" class="btn btn--without-border"><spring:message code="edituser.cancel" text="default"/></a>
            <form:button class="btn" type="submit"><spring:message code="edituser.save" text="default"/></form:button>
        </div>
    </form:form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>