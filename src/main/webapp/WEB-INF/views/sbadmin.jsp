<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <link rel="stylesheet" href="<c:url value="resources/fontawesome/css/all.min.css"/>"/>
        <link rel="stylesheet" href="<c:url value="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"/>"/>


    <!-- Custom styles for this template-->
        <link rel="stylesheet" href="<c:url value="resources/css/sb-admin-2.min.css"/>"/>


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



<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
   </div>

<!-- Content Row -->
<div class="row">

    <!-- Earnings (Monthly) Card Example -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
    <div class="card-body">
    <div class="row no-gutters align-items-center">
    <div class="col mr-2">
    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Użytkowników</div>
    <div class="h5 mb-0 font-weight-bold text-gray-800">${quantityUsers}</div>
</div>
<div class="col-auto">
    <i class="fas fa-user-circle fa-2x text-gray-300"></i>
    </div>
    </div>
    </div>
    </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-success shadow h-100 py-2">
    <div class="card-body">
    <div class="row no-gutters align-items-center">
    <div class="col mr-2">
    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Administratorów</div>
    <div class="h5 mb-0 font-weight-bold text-gray-800">${quantityAdministrators}</div>
</div>
<div class="col-auto">
    <i class="fas fa-user fa-2x text-gray-300"></i>
    </div>
    </div>
    </div>
    </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-info shadow h-100 py-2">
    <div class="card-body">
    <div class="row no-gutters align-items-center">
    <div class="col mr-2">
    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Instytucji</div>
    <div class="row no-gutters align-items-center">
    <div class="col-auto">
    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${quantityInstitutions}</div>
    </div>
    <div class="col">
    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    </div>
    </div>
    <div class="col-auto">
    <i class="fas fa-building fa-2x text-gray-300"></i>
    </div>
    </div>
    </div>
    </div>
    </div>

    <!-- Pending Requests Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-warning shadow h-100 py-2">
    <div class="card-body">
    <div class="row no-gutters align-items-center">
    <div class="col mr-2">
    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Darów</div>
<div class="h5 mb-0 font-weight-bold text-gray-800">${quantityDonations}</div>
    </div>
    <div class="col-auto">
    <i class="fas fa-gift fa-2x text-gray-300"></i>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>

    <!-- Content Row -->

    <div class="row">

    <!-- Area Chart -->
<div class="col-xl-8 col-lg-7">
    <div class="card shadow mb-4">
    <!-- Card Header - Dropdown -->

</div>

</div>
</div>

</div>
<!-- /.container-fluid -->

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
    <script src="<c:url value="resources/js/jquery.min.js"/>"></script>
    <script src="<c:url value="resources/js/bootstrap.bundle.min.js"/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value="resources/js/jquery.easing.min.js"/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value="resources/js/sb-admin-2.min.js"/>"></script>


    <!-- Page level plugins -->
    <script src="<c:url value="resources/js/Chart.min.js"/>"></script>



    </body>

    </html>
