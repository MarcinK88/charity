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


            <!--          ODTĄD-->
            <!-- Begin Page Content -->
            <div class="container-fluid">


                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800"><spring:message code="admin.donats" text="default"/></h1>
                <p class="mb-4"><spring:message code="admin.managedonats" text="default"/></p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary"><spring:message code="admin.donatslist" text="default"/></h6>

                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th title="quantity"><spring:message code="donationdetails.quantity" text="default"/></th>
                                    <th title="categories"><spring:message code="donationdetails.categories" text="default"/></th>
                                    <th title="institution"><spring:message code="donationdetails.institution" text="default"/></th>
                                    <th title="user"><spring:message code="user" text="default"/></th>
                                    <th title="street"><spring:message code="donation.s4.street" text="default"/></th>
                                    <th title="city"><spring:message code="donation.s4.city" text="default"/></th>
                                    <th title="zipcode"><spring:message code="donation.s4.zipcode" text="default"/></th>
                                    <th title="pickupdate"><spring:message code="donation.s4.pickuptime" text="default"/></th>
                                    <th title="pickuptime"><spring:message code="hour" text="default"/></th>
                                    <th title="comment"><spring:message code="donationdetails.comment" text="default"/></th>
                                    <th title="phone"><spring:message code="donationdetails.phone" text="default"/></th>
                                    <th title="pickedup"><spring:message code="donationdetails.ispicked" text="default"/></th>
                                    <th title="edit"><spring:message code="admin.pickup" text="default"/></th>
                                    <th title="delete"><spring:message code="admin.delete" text="default"/></th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th title="quantity"><spring:message code="donationdetails.quantity" text="default"/></th>
                                    <th title="categories"><spring:message code="donationdetails.categories" text="default"/></th>
                                    <th title="institution"><spring:message code="donationdetails.institution" text="default"/></th>
                                    <th title="user"><spring:message code="user" text="default"/></th>
                                    <th title="street"><spring:message code="donation.s4.street" text="default"/></th>
                                    <th title="city"><spring:message code="donation.s4.city" text="default"/></th>
                                    <th title="zipcode"><spring:message code="donation.s4.zipcode" text="default"/></th>
                                    <th title="pickupdate"><spring:message code="donation.s4.pickuptime" text="default"/></th>
                                    <th title="pickuptime"><spring:message code="hour" text="default"/></th>
                                    <th title="comment"><spring:message code="donationdetails.comment" text="default"/></th>
                                    <th title="phone"><spring:message code="donationdetails.phone" text="default"/></th>
                                    <th title="pickedup"><spring:message code="donationdetails.ispicked" text="default"/></th>
                                    <th title="edit"><spring:message code="admin.pickup" text="default"/></th>
                                    <th title="delete"><spring:message code="admin.delete" text="default"/></th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${donations}" var="donation">
                                    <tr>
                                        <td data-table-header="quantity">${donation.quantity}</td>
                                        <td data-table-header="categories">
                                        <c:forEach items="${donation.categories}" var="category">
                                            ${category.name}
                                        </c:forEach>
                                        </td>
                                        <td data-table-header="name">${donation.institution.name}</td>
                                        <td data-table-header="user">${donation.user.name}</td>
                                        <td data-table-header="street">${donation.street}</td>
                                        <td data-table-header="city">${donation.city}</td>
                                        <td data-table-header="zipcode">${donation.zipcode}</td>
                                        <td data-table-header="pickupdate">${donation.pickUpDate}</td>
                                        <td data-table-header="pickuptime">${donation.pickUpTime}</td>
                                        <td data-table-header="comment">${donation.pickUpComment}</td>
                                        <td data-table-header="phone">${donation.phone}</td>
                                        <td data-table-header="phone">${donation.pickedUp}</td>
                                        <td data-table-header="delete">
                                            <a href="/admin/donations/pickup/${donation.id}" class="btn btn-success btn-icon-split">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-check"></i>
                                                    </span>
                                                <span class="text"><spring:message code="admin.pickup" text="default"/></span>
                                            </a>
                                        </td>
                                        <td data-table-header="edit">
                                            <a href="/admin/donations/delete/${donation.id}" class="btn btn-danger btn-icon-split">
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

<script src="<c:url value="resources/js/Chart.min.js"/>"></script>


</body>

</html>
