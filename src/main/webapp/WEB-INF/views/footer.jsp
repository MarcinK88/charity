<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<footer>
    <div class="contact">
        <h2><spring:message code="footer.contactus" text="default"/></h2>
        <h3><spring:message code="footer.contactform" text="default"/></h3>
        <form class="form--contact" action="/contact" method="post">
            <div class="form-group form-group--50"><input type="text" name="name" placeholder="<spring:message code="footer.name" text="default"/>"/></div>
            <div class="form-group form-group--50"><input type="text" name="surname" placeholder="<spring:message code="footer.surname" text="default"/>"/></div>

            <div class="form-group"><textarea name="message" placeholder="<spring:message code="footer.message" text="default"/>" rows="1"></textarea></div>

            <button class="btn" type="submit"><spring:message code="footer.send" text="default"/></button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img src="<c:url value="resources/images/icon-facebook.svg"/>"/></a> <a href="#"
                                                                                            class="btn btn--small"><img
                src="<c:url value="resources/images/icon-instagram.svg"/>"/></a>
        </div>
    </div>
</footer>