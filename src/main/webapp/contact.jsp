<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact Us</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
        body {
            background-image: url('images/cover.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }
        .carousel-container {
            max-width: 80%; /* Increased width */
            height: 400px;
            margin: auto;
            background: transparent;
            margin-bottom: 10px; /* Decreased bottom margin */
        }
        .carousel-inner img {
            height: 400px;
            object-fit: cover;
        }
        .carousel-item {
            background: transparent;
        } 
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="bi bi-calendar-event"></i> Events
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item mx-2">
                    <a class="nav-link" href="index.html">
                        <i class="bi bi-house-door"></i> Home
                    </a>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link" href="services.jsp">
                        <i class="bi bi-tools"></i> Services
                    </a>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link " href="about.jsp">
                        <i class="bi bi-info-circle"></i> About Us
                    </a>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link active" href="contact.jsp">
                        <i class="bi bi-envelope"></i> Contact
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item mx-2">
                    <a class="btn btn-outline-light" href="login.jsp">
                        <i class="bi bi-box-arrow-in-right"></i> Login
                    </a>
                </li>
                <li class="nav-item mx-2">
                    <a class="btn btn-primary" href="register.jsp">
                        <i class="bi bi-person-plus"></i> Register
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

	 <div class="container mt-5">
        <h2 class="text-center">Contact Us</h2>
        <p class="text-center">Have any questions? Feel free to reach out to us.</p>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form>
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" placeholder="Enter your name">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" placeholder="Enter your email">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Message</label>
                        <textarea class="form-control" rows="4" placeholder="Your message"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Send</button>
                </form>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>