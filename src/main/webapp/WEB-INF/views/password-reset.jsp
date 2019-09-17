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

<section class="login-page">
    <h2><spring:message code="resetpwd.reset" text="default"/></h2>
    <form method="post" action="/resetpassword">
        <div class="form-group">
            <input type="text" name="username" id="username" placeholder="Email" />
        </div>

        <div class="form-group form-group--buttons">
            <button class="btn" type="submit"><spring:message code="resetpwd.res" text="default"/></button>

        </div>
    </form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>