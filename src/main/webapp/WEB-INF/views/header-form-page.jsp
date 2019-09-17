<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header--form-page">
    <jsp:include page="header.jsp"></jsp:include>


    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                <spring:message code="donation.give" text="default"/>
                <br />
                <span class="uppercase"<spring:message code="donation.need" text="default"/>
</span>
            </h1>

            <div class="slogan--steps">
                <div class="slogan--steps-title"><spring:message code="donation.steps" text="default"/></div>
                <ul class="slogan--steps-boxes">
                    <li>
                        <div><em>1</em><span><spring:message code="donation.step1" text="default"/></span></div>
                    </li>
                    <li>
                        <div><em>2</em><span><spring:message code="donation.step2" text="default"/></span></div>
                    </li>
                    <li>
                        <div><em>3</em><span><spring:message code="donation.step3" text="default"/></span></div>
                    </li>
                    <li>
                        <div><em>4</em><span><spring:message code="donation.step4" text="default"/></span></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>




