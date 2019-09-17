<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<section class="login-page">
    <div class="details-container">
        <h2>${user.name} ${user.surname}</h2>
        <div class="summary">
            <div class="form-section">
                <h1>
                <ul>
                    <li>
                        <h4>email:</h4>
                        <span class="title">${user.username}</span>
                    </li>
                    <li>
                        <h4><spring:message code="profile.quantity" text="default"/></h4>
                        <span class="title">${donationQuantity}</span>
                    </li>
                    <a href="/edituser" class="btn btn--without-border"><spring:message code="profile.change" text="default"/></a>
                    <a href="/password" class="btn btn--without-border"><spring:message code="profile.changepwd" text="default"/></a>
                </ul>
                </h1>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>