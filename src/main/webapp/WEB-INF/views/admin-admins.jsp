<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<sec:authentication var="admin" property="principal" />

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <jsp:include page="sbadmin-sidebar.jsp"></jsp:include>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <jsp:include page="sbadmin-topbar.jsp"></jsp:include>


            <!--          ODTĄD-->
            <!-- Begin Page Content -->
            <div class="container-fluid">


                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800"><spring:message code="admin.admins" text="default"/></h1>
                <p class="mb-4"><spring:message code="admin.manageadmins" text="default"/></p>
                <div class="bg-gradient-danger text-gray-100">${error}</div>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary"><spring:message code="admin.adminlist" text="default"/></h6>
                        <a href="/admin/admins/add" class="btn btn-success btn-icon-split">
                            <span class="icon text-white-50">
                                <i class="fas fa-arrow-right"></i>
                            </span>
                            <span class="text"><spring:message code="admin.addnew" text="default"/></span>
                        </a>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th><spring:message code="admin.name" text="default"/></th>
                                    <th><spring:message code="admin.surname" text="default"/></th>
                                    <th>Email</th>
                                    <th><spring:message code="admin.active" text="default"/></th>
                                    <th><spring:message code="admin.edit" text="default"/></th>
                                    <th><spring:message code="admin.delete" text="default"/></th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th><spring:message code="admin.name" text="default"/></th>
                                    <th><spring:message code="admin.surname" text="default"/></th>
                                    <th>Email</th>
                                    <th><spring:message code="admin.active" text="default"/></th>
                                    <th><spring:message code="admin.edit" text="default"/></th>
                                    <th><spring:message code="admin.delete" text="default"/></th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${admins}" var="admin">
                                    <tr>
                                        <td data-table-header="Name">${admin.name}</td>
                                        <td data-table-header="Surname">${admin.surname}</td>
                                        <td data-table-header="Email">${admin.username}</td>
                                        <td data-table-header="Active">${admin.enabled}</td>
                                        <td data-table-header="Delete">
                                            <a href="/admin/admins/edit/${admin.id}" class="btn btn-info btn-icon-split">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-edit"></i>
                                                    </span>
                                                <span class="text"><spring:message code="admin.edit" text="default"/></span>
                                            </a>
                                        </td>
                                        <td data-table-header="Delete">
                                            <a href="/admin/admins/delete/${admin.id}" class="btn btn-danger btn-icon-split">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-trash"></i>
                                                    </span>
                                                <span class="text"><spring:message code="admin.delete" text="default"/></span>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->
            <!--DOTĄD-->
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
