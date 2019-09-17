<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>

<jsp:include page="header-main-page.jsp"></jsp:include>


<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${quantityDonations}</em>

            <h3><spring:message code="home.totalbags" text="default"/></h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius est beatae, quod accusamus illum
                tempora!</p>
        </div>

        <div class="stats--item">
            <em>${quantityInstitutions}</em>
            <h3><spring:message code="home.totalorg" text="default"/></h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam magnam, sint nihil cupiditate quas
                quam.</p>
        </div>

    </div>
</section>

<section class="steps">
    <h2><spring:message code="home.steps" text="default"/></h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3><spring:message code="home.step1" text="default"/></h3>
            <p><spring:message code="home.step1.desc" text="default"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3><spring:message code="home.step2" text="default"/></h3>
            <p><spring:message code="home.step2.desc" text="default"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3><spring:message code="home.step3" text="default"/></h3>
            <p><spring:message code="home.step3.desc" text="default"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3><spring:message code="home.step4" text="default"/></h3>
            <p><spring:message code="home.step4.desc" text="default"/></p>
        </div>
    </div>
<sec:authorize access="isAnonymous()">
    <a href="/register" class="btn btn--large"><spring:message code="home.createaccount" text="default"/></a>
</sec:authorize>
</section>

<section class="about-us">
    <div class="about-us--text">
        <h2><spring:message code="header.about" text="default"/></h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="<c:url value="resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="<c:url value="resources/images/about-us.jpg"/>" alt="People in circle"/>
    </div>
</section>

<section class="help">
    <h2><spring:message code="home.help" text="default"/></h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p><spring:message code="home.help.desc" text="default"/></p>

        <ul class="help--slides-items">
            <li>
                <c:forEach items="${institutions}" var="institution" varStatus="loopCounter">
                <div class="col">
                    <div class="title"><spring:message code="foundation" text="default"/> "${institution.name}"</div>
                    <div class="subtitle"><spring:message code="goal" text="default"/> ${institution.description}</div>
                </div>
                <c:if test="${loopCounter.index %2 != 0}">
            </li><li>
            </c:if>
            </c:forEach>
        </li>

        </ul>
    </div>

</section>

<jsp:include page="footer.jsp"></jsp:include>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
