<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="index.html">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Interface
    </div>

    <li class="nav-item">
        <a class="nav-link" href="/admin/users">
            <i class="fas fa-fw fa-user-circle"></i>
            <span>Użytkownicy</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/admin/admins">
            <i class="fas fa-fw fa-user"></i>
            <span>Administratorzy</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/admin/institutions">
            <i class="fas fa-fw fa-building"></i>
            <span>Instytucje</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/admin/donations">
            <i class="fas fa-fw fa-gift"></i>
            <span>Dary</span></a>
    </li>




    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->