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
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/sb.css"/>"/>


</head>
<body>
<sec:authentication var="user" property="principal" />

<jsp:include page="header.jsp"></jsp:include>

<section class="login-page">
    <div class="details-container">
<h1>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary"><spring:message code="donations.your" text="default"/></h6>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered sortable" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th><spring:message code="donations.date" text="default"/></th>
                            <th><spring:message code="donations.status" text="default"/></th>
                            <th><spring:message code="donations.pickupdate" text="default"/></th>
                            <th><spring:message code="donations.details" text="default"/></th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${donations}" var="donation">
                            <tr>
                                <td data-table-header="recordDate">${donation.recordDate}</td>
                                    <c:if test="${donation.pickedUp}">
                                        <td data-table-header="pickedup"><spring:message code="donations.yes" text="default"/></td>
                                    </c:if>
                                    <c:if test="${!donation.pickedUp}">
                                        <td data-table-header="pickedup"><spring:message code="donations.no" text="default"/></td>
                                    </c:if>
                                </td>
                                <td data-table-header="pickuprealdate">${donation.pickupRealDate}</td>
                                <td data-table-header="details"><a href="/mydonations/details/${donation.id}"><spring:message code="donations.details" text="default"/></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>

    </div>
</h1>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="<c:url value="/resources/js/sorttable.js"/>"></script>

</body>
</html>