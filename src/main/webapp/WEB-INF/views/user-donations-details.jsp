<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<sec:authentication var="user" property="principal" />

<jsp:include page="header.jsp"></jsp:include>

<section class="login-page">
    <div class="details-container">

        <h2>Podsumowanie Twojej darowizny</h2>

        <div class="summary">
            <div class="form-section">
                <h4>Oddajesz:</h4>
                <ul>
                    <li>
                        <span class="icon icon-bag"></span>
                        <span class="summary--text">
                                    <span id="quantitySummary">${donation.quantity}</span> worki <span id="categorySummary"></span> </span>
                    </li>

                    <li>
                        <span class="icon icon-hand"></span>
                        <span class="summary--text">
                                    Dla fundacji "<span id="institutionSummary">${donation.institution.name}</span>" </span>
                    </li>
                </ul>
            </div>

            <div class="form-section form-section--columns">
                <div class="form-section--column">
                    <h4>Adres odbioru:</h4>
                    <ul>
                        <li><span id="streetSummary">${donation.street}</span> </li>
                        <li><span id="citySummary">${donation.city}</span></li>
                        <li><span id="zipcodeSummary">${donation.zipcode}</span></li>
                        <li><span id="phoneSummary">${donation.phone}</span></li>
                    </ul>
                </div>

                <div class="form-section--column">
                    <h4>Termin odbioru:</h4>
                    <ul>
                        <li><span id="pickupdateSummary">${donation.pickUpDate}</span></li>
                        <li><span id="pickuptimeSummary"><${donation.pickUpTime}/span></li>
                        <li><span id="pickupcommentSummary">${donation.pickUpComment}</span></li>
                    </ul>
                </div>
            </div>
        </div>


    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>