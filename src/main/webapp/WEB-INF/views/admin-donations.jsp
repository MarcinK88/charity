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
                <h1 class="h3 mb-2 text-gray-800">Dary</h1>
                <p class="mb-4">Zarządzaj darami</p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Lista darów</h6>

                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th title="quantity">Ilość</th>
                                    <th title="categories">Kategorie</th>
                                    <th title="institution">Instytucja</th>
                                    <th title="user">Użytkownik</th>
                                    <th title="street">Ulica</th>
                                    <th title="city">Miasto</th>
                                    <th title="zipcode">Kod pocztowy</th>
                                    <th title="pickupdate">Termin odbioru</th>
                                    <th title="pickuptime">Czas odbioru</th>
                                    <th title="comment">Komentarz</th>
                                    <th title="phone">Telefon</th>
                                    <th title="pickedup">Odebrane</th>
                                    <th title="edit">Odbierz</th>
                                    <th title="delete">Usuń</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th title="quantity">Ilość</th>
                                    <th title="categories">Kategorie</th>
                                    <th title="institution">Instytucja</th>
                                    <th title="user">Użytkownik</th>
                                    <th title="street">Ulica</th>
                                    <th title="city">Miasto</th>
                                    <th title="zipcode">Kod pocztowy</th>
                                    <th title="pickupdate">Termin odbioru</th>
                                    <th title="pickuptime">Czas odbioru</th>
                                    <th title="comment">Komentarz</th>
                                    <th title="phone">Telefon</th>
                                    <th title="pickedup">Odebrane</th>
                                    <th title="edit">Odbierz</th>
                                    <th title="delete">Usuń</th>
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
                                                <span class="text">Odbierz</span>
                                            </a>
                                        </td>
                                        <td data-table-header="edit">
                                            <a href="/admin/donations/delete/${donation.id}" class="btn btn-danger btn-icon-split">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-trash"></i>
                                                    </span>
                                                <span class="text">Usuń</span>
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
