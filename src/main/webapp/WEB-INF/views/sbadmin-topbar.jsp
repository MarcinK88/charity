<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authentication var="user" property="principal" />

<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Change language -->
    <ul class="navbar-nav ml-auto">

        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><i class="fas fa-fw "></i><spring:message code="lang.change" text="default"/></span>
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="/admin?lang=pl">
                    <i class="fas fa-sm fa-fw mr-2 text-gray-400"></i>
                    <spring:message code="lang.pl" text="default"/>
                </a>

                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/admin?lang=en" >
                    <i class="fas fa-sm fa-fw mr-2 text-gray-400"></i>
                <spring:message code="lang.en" text="default"/>
                </a>
            </div>
        </li>

    </ul>

    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">

        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><i class="fas fa-fw fa-user-circle"></i>${user.name}</span>
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="/profile">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    <spring:message code="admin.profile" text="default"/>
                </a>

                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/logout" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    <spring:message code="admin.logout" text="default"/>
                </a>
            </div>
        </li>

    </ul>



</nav>
<!-- End of Topbar -->

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><spring:message code="admin.logout.confirm" text="default"/></h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body"><spring:message code="admin.logout.confirm2" text="default"/></div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal"><spring:message code="edituser.cancel" text="default"/></button>
                <a class="btn btn-primary" href="/logout"><spring:message code="admin.logout" text="default"/></a>
            </div>
        </div>
    </div>
</div>