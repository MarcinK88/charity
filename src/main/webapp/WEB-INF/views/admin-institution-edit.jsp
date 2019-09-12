<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link rel="stylesheet" href="<c:url value="/resources/fontawesome/css/all.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/datatables/dataTables.bootstrap4.min.css"/>"/>


    <!-- Custom styles for this template-->
    <link rel="stylesheet" href="<c:url value="/resources/css/sb-admin-2.min.css"/>"/>


</head>
<sec:authentication var="user" property="principal" />

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <jsp:include page="sbadmin-sidebar.jsp"></jsp:include>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

<jsp:include page="sbadmin-topbar.jsp"></jsp:include>
            <div class="container">

            <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
            <div class="row">
            <div class="col-lg-6">
            <div class="p-5">
            <form:form method="post" modelAttribute="institution" class="user">
                <div class="form-group">
                    <label for="name">Nazwa</label>
                    <form:input path="name" id="name" name="name" type="text" placeholder="Nazwa" cssClass="form-control form-control-user" />
                </div>
                <div class="form-group">
                    <label for="description">Opis</label>
                    <form:input path="description" id="description" name="description" type="text" placeholder="Opis" cssClass="form-control form-control-user" />
                </div>
                <div class="px-sm-5">
                    <button type="submit" id="save" name="save" class="btn btn-success btn-user btn-block">Zapisz</button>
                    <a href="/admin/institutions" class="btn btn-secondary btn-user btn-block">
                        Anuluj
                    </a>
                </div>
            </form:form>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>







        </div>
        <!-- End of Main Content -->

        <jsp:include page="sbadmin-footer.jsp"></jsp:include>


    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>



<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>


<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/js/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

<script src="<c:url value="/resources/datatables/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/resources/datatables/dataTables.bootstrap4.min.js"/>"></script>
<script src="<c:url value="/resources/demo/datatables-demo.js"/>"></script>



</body>

</html>
