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
<jsp:include page="header-form-page.jsp"></jsp:include>

<section class="form--steps">
    <sec:authentication var="user" property="principal" />
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3><spring:message code="donation.important" text="default"/></h3>

            <p data-step="1" class="active">
                <spring:message code="donation.important.desc" text="default"/>
            </p>
            <p data-step="2">
                <spring:message code="donation.important.desc" text="default"/>
            </p>
            <p data-step="3">
                <spring:message code="donation.step3.desc" text="default"/>
            </p>
            <p data-step="4"><spring:message code="donation.step4.desc" text="default"/></p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter"><spring:message code="donation.step" text="default"/>
            <span>1</span>/4</div>

        <form:form modelAttribute="donation" method="post">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3><spring:message code="donation.s1" text="default"/></h3>

                <c:forEach items="${categories}" var="category">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="checkbox" name="categories" itemid="${category.name}" value="${category.id}" />
                            <span class="checkbox"></span>
                            <span class="description">${category.name}</span>
                        </label>
                    </div>
                </c:forEach>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step"><spring:message code="donation.next" text="default"/></button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3><spring:message code="donation.s2" text="default"/></h3>

                <div class="form-group form-group--inline">
                    <label>
                        <spring:message code="donation.s2.s2" text="default"/>
                        <input type="number" name="quantity" step="1" min="1" value="1" id="quantity" />
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="donation.back" text="default"/></button>
                    <button type="button" class="btn next-step"><spring:message code="donation.next" text="default"/></button>
                </div>
            </div>



            <!-- STEP 3 -->
            <div data-step="3">
                <h3><spring:message code="donation.s3" text="default"/></h3>

                <c:forEach items="${institutions}" var="institution">
                <div class="form-group form-group--checkbox">
                    <label>
                        <input type="radio" name="institution" itemid="${institution.name}" value="${institution.id}" id="institution" />
                        <span class="checkbox radio"></span>
                        <span class="description">
                  <div class="title" id="selectedInstitution"><spring:message code="donation.s3.f" text="default"/> “${institution.name}”</div>
                  <div class="subtitle">
                    <spring:message code="donation.s3.g" text="default"/> ${institution.description}
                  </div>
                </span>
                    </label>
                </div>
                </c:forEach>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="donation.back" text="default"/></button>
                    <button type="button" class="btn next-step"><spring:message code="donation.next" text="default"/></button>
                </div>
            </div>

            <!-- STEP 4 -->
            <div data-step="4">
                <h3><spring:message code="donation.s4" text="default"/></h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4><spring:message code="donation.s4.address" text="default"/></h4>
                        <div class="form-group form-group--inline">
                            <label> <spring:message code="donation.s4.street" text="default"/> <input type="text" name="street" id="street" /> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> <spring:message code="donation.s4.city" text="default"/> <input type="text" name="city" id="city" /> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="donation.s4.zipcode" text="default"/> <input type="text" name="zipcode" id="zipcode" />
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="donation.s4.phone" text="default"/> <input type="tel" name="phone" id="phone" />
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4><spring:message code="donation.s4.pickuptime" text="default"/></h4>
                        <div class="form-group form-group--inline">
                            <label> <spring:message code="donation.s4.date" text="default"/> <input type="date" name="pickUpDate" id="pickUpDate" /> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> <spring:message code="donation.s4.hour" text="default"/> <input type="time" name="pickUpTime" id="pickUpTime" /> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="donation.s4.info" text="default"/>
                                <textarea name="pickUpComment" rows="5" id="pickUpComment"></textarea>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="donation.back" text="default"/></button>
                    <button type="button" class="btn next-step"><spring:message code="donation.next" text="default"/></button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="5">
                <h3><spring:message code="donation.summary" text="default"/></h3>

                <div class="summary">
                    <div class="form-section">
                        <h4><spring:message code="donation.giveaway" text="default"/></h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text">
                                    <span id="quantitySummary"></span> <spring:message code="donation.bags" text="default"/> <span id="categorySummary"></span> </span>
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text">
                                    <spring:message code="donation.forfund" text="default"/>"<span id="institutionSummary"></span>" </span>
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4><spring:message code="donation.s4.address" text="default"/></h4>
                            <ul>
                                <li><span id="streetSummary"></span> </li>
                                <li><span id="citySummary"></span></li>
                                <li><span id="zipcodeSummary"></span></li>
                                <li><span id="phoneSummary"></span></li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4><spring:message code="donation.s4.pickuptime" text="default"/></h4>
                            <ul>
                                <li><span id="pickupdateSummary"></span></li>
                                <li><span id="pickuptimeSummary"></span></li>
                                <li><span id="pickupcommentSummary"></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="user" id="user" value="${user.id}"/>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="donation.back" text="default"/></button>
                    <button type="submit" class="btn"><spring:message code="donation.confirm" text="default"/></button>
                </div>
            </div>
        </form:form>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>


<script src="<c:url value="resources/js/app.js"/>"></script>

</body>
</html>
