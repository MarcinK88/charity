<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header--main-page">
    <jsp:include page="header.jsp"></jsp:include>


    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                <spring:message code="home.starthelp" text="default"/><br/>
                <spring:message code="home.givethings" text="default"/>
            </h1>
        </div>
    </div>
</header>