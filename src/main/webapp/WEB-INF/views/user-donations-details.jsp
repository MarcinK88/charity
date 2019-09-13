<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <h2>Szczegóły zbiórki</h2>
        <div class="summary">
            <div class="form-section">
                <h1>
                    <table class="table-striped" border="1px">
                        <thead>
                            <th>Instytucja</th>
                            <th>Ilość</th>
                            <th>Kategorie</th>
                            <th>Adres odbioru</th>
                            <th>Data odbioru</th>
                            <th>telefon</th>
                            <th>Komentarz</th>
                            <th>Czy odebrane</th>
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