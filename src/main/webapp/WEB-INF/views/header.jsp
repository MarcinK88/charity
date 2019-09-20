<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<c:url value="resources/fontawesome/css/all.min.css"/>"/>

<header>
    <sec:authentication var="user" property="principal" />
<nav class="container container--70">
    <ul class="nav--actions">

        <li class="language">
            <spring:message code="lang.change" text="default"/>
            <ul class="dropdown">
                <li><a href="/?lang=pl"><spring:message code="lang.pl" text="default"/>
                </a></li>
                <li><a href="/?lang=en"><spring:message code="lang.en" text="default"/></a></li>
            </ul>
            <i class="fas fa-globe-americas fa-sm fa-fw mr-2 text-gray-400"></i>
        </li>

        <sec:authorize access="isAnonymous()">
        <li><a href="/login" class="btn btn--small btn--without-border"><spring:message code="header.login" text="default"/></a></li>
        <li><a href="/register" class="btn btn--small btn--highlighted"><spring:message code="header.register" text="default"/></a></li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <li class="logged-user">
                <spring:message code="hello" text="default"/> ${user.name}
                <ul class="dropdown">
                    <li><a href="/profile"><spring:message code="header.profile" text="default"/></a></li>
                    <li><a href="/mydonations"><spring:message code="header.mydonats" text="default"/></a></li>
                    <sec:authorize access="hasAuthority('ADMIN')">
                        <li><a href="/admin">Admin panel</a></li>
                    </sec:authorize>
                    <li><a href="/logout"><spring:message code="header.logout" text="default"/></a></li>
                </ul>
            </li>
        </sec:authorize>


    </ul>

    <ul>
        <li><a href="/" class="btn btn--without-border active">Start</a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="header.whatisit" text="default"/>
        </a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="header.about" text="default"/></a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="header.fundandorg" text="default"/></a></li>
        <li><a href="/adddonation" class="btn btn--without-border"><spring:message code="header.gifts" text="default"/></a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="header.contact" text="default"/></a></li>
    </ul>
</nav>
</header>