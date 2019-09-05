<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form method="post" modelAttribute="newuser">
        <div class="form-group">
            <form:input path="email" type="email" name="email" placeholder="Email" />
        </div>
        <div class="form-group">
            <form:input path="password" type="password" name="password" placeholder="Hasło" />
        </div>
<%--        <div class="form-group">--%>
<%--            <form:input path="password" type="password" name="password2" placeholder="Powtórz hasło" />--%>
<%--        </div>--%>

        <div class="form-group form-group--buttons">
            <a href="login.html" class="btn btn--without-border">Zaloguj się</a>
            <form:button class="btn" type="submit">Załóż konto</form:button>
        </div>
    </form:form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>