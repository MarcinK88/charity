<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
<%--    <link rel="stylesheet" href="<c:url value="/resources/css/sb-admin-2.min.css"/>"/>--%>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section class="login-page">
    <div class="details-container">
        <h2><spring:message code="donationdetails.details" text="default"/></h2>
        <div class="summary">
            <div class="form-section">
                <h1>
                    <table class="table-striped" border="1px">
                        <thead>
                            <th><spring:message code="donationdetails.institution" text="default"/></th>
                            <th><spring:message code="donationdetails.quantity" text="default"/></th>
                            <th><spring:message code="donationdetails.categories" text="default"/></th>
                            <th><spring:message code="donationdetails.address" text="default"/></th>
                            <th><spring:message code="donationdetails.pickupdate" text="default"/></th>
                            <th><spring:message code="donationdetails.phone" text="default"/></th>
                            <th><spring:message code="donationdetails.comment" text="default"/></th>
                            <th><spring:message code="donationdetails.ispicked" text="default"/></th>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${donation.institution.name}</td>
                            <td>${donation.quantity}</td>
                            <td>
                                <c:forEach items="${donation.categories}" var="category">
                                ${category.name}
                                </c:forEach>
                            </td>
                            <td>${donation.street}, ${donation.zipcode} ${donation.city}</td>
                            <td>${donation.pickUpDate}, ${donation.pickUpTime}</td>
                            <td>${donation.phone}</td>
                            <td>${donation.pickUpComment}</td>
                            <c:if test="${donation.pickedUp}">
                            <td>tak, dnia ${donation.pickupRealDate}</td>
                            </c:if>
                            <c:if test="${!donation.pickedUp}">
                                <td>nie</td>
                            </c:if>
                        </tr>
                        </tbody>
                    </table>
                </h1>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>