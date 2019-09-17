<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <sec:authentication var="user" property="principal" />
<nav class="container container--70">
    <ul class="nav--actions">
        <sec:authorize access="isAnonymous()">
        <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
        <li><a href="/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <li class="logged-user">
                <spring:message code="hello" text="default"/> ${user.name}
                <ul class="dropdown">
                    <li><a href="/profile">Profil</a></li>
                    <li><a href="/mydonations">Moje zbiórki</a></li>
                    <sec:authorize access="hasAuthority('ADMIN')">
                        <li><a href="/admin">Admin panel</a></li>
                    </sec:authorize>
                    <li><a href="/logout">Wyloguj</a></li>
                </ul>
            </li>
            <li class="logged-user">
                <spring:message code="lang.change" text="default"/>
                <ul class="dropdown">
                    <li><a href="/?lang=pl"><spring:message code="lang.pl" text="default"/>
                    </a></li>
                    <li><a href="/?lang=en"><spring:message code="lang.en" text="default"/></a></li>
                </ul>
            </li>







        </sec:authorize>
    </ul>

    <ul>
        <li><a href="/" class="btn btn--without-border active">Start</a></li>
        <li><a href="#" class="btn btn--without-border">O co chodzi?</a></li>
        <li><a href="#" class="btn btn--without-border">O nas</a></li>
        <li><a href="#" class="btn btn--without-border">Fundacje i organizacje</a></li>
        <li><a href="/adddonation" class="btn btn--without-border">Przekaż dary</a></li>
        <li><a href="#" class="btn btn--without-border">Kontakt</a></li>
    </ul>
</nav>
</header>