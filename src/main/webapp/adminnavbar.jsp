<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item mx-2">
                    <a class="nav-link active" href="admin.jsp">
                        <i class="bi bi-house-door"></i> My Home Page
                    </a>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link active" href="joinevents.jsp">
                        <i class="bi bi-people"></i> Join Events
                    </a>
                </li>
                <!-- New Users Tab -->
                <li class="nav-item mx-2">
                    <a class="nav-link active" href="userlist.jsp">
                        <i class="bi bi-people-fill"></i> Users
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item dropdown mx-2">
				    <a class="nav-link dropdown-toggle text-white" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				        <i class="bi bi-person-circle"></i> <strong>${sessionScope.username}</strong>
				    </a>
				    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
				        <li><a class="dropdown-item" href="profile.jsp"><i class="bi bi-person"></i> View Profile</a></li>
				        <li><a class="dropdown-item" href="editprofile.jsp"><i class="bi bi-pencil-square"></i> Edit Profile</a></li>
				    </ul>
				</li>

                <li class="nav-item mx-2">
                    <a class="btn btn-danger" href="login.jsp">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
