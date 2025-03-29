<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<%@ include file="navbar.jsp" %>

    <div class="container mt-5 d-flex justify-content-center">
        <div class="card shadow p-4" style="width: 50%;">
            <h2 class="mb-4 text-center">Delete Event</h2>
            <form action="deleteeventurl"  method="post">
                <div class="mb-3">
                    <label for="eventName" class="form-label">Event Title</label>
                    <input type="text" class="form-control" id="eventName" name="title" placeholder="Enter event title" required>
                </div>
                <button type="submit" class="btn btn-danger w-100" >Delete</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    
    
</body>
</html>
