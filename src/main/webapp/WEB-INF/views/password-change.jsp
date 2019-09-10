<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
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

<section class="login-page">
    <h2>Zmień hasło</h2>
    <form:form method="post" modelAttribute="user">
        <form:hidden path="username"/>
        <form:hidden path="name"/>
        <form:hidden path="surname"/>
        <form:hidden path="enabled"/>
        <form:hidden path="userRoles"/>
        <form:hidden path="id"/>
        <div class="form-group">
            <input type="password" name="oldpwd" id="oldpwd" placeholder="Stare hasło" />
            ${iscorrectpassword}
        </div>
        <div class="form-group">
            <form:input path="password" type="password" name="password" placeholder="Nowe hasło" />
            <form:errors path="password" cssClass="error" />
        </div>
        <div class="form-group">
            <input:input path="confirmPassword" type="password" name="password2" placeholder="Potwierdź nowe hasło" />
            <form:errors path="confirmPassword" cssClass="error"/>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/profile" class="btn btn--without-border">Anuluj</a>
            <button class="btn" type="submit">Zmień hasło</button>
        </div>
    </form:form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>