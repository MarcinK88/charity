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
    <h2>Zmień dane</h2>
    <form:form method="post" modelAttribute="user">
        <div class="form-group">
            <div class="form-group form-group--inline">
            <label>Imię <form:input path="name" id="name" type="text" name="name" placeholder="Imię" /></label>
            </div>
        </div>
        <div class="form-group">
            <div class="form-group form-group--inline">
                <label>Nazwisko <form:input path="surname" id="surname" type="text" name="surname" placeholder="Nazwisko" /></label>
            </div>
        </div>
        <div class="form-group">
            <div class="form-group form-group--inline">
                <label>Email <form:input path="username" id="username" type="email" name="username" placeholder="Email" /></label>
            </div>
        </div>

        <form:hidden path="enabled"/>

        <div class="form-group form-group--buttons">
            <a href="/profile" class="btn btn--without-border">Anuluj</a>
            <form:button class="btn" type="submit">Zapisz</form:button>
        </div>
    </form:form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>