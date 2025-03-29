<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
		<%@ include file="adminnavbar.jsp" %>
	    <div class="container mt-4 d-flex justify-content-center">
        <div class="card shadow p-3" style="max-width: 500px; width: 100%;">
            <h2 class="text-center mb-3">Create Event</h2>
            <form  action="addeventurl" method="post" enctype="multipart/form-data">
                <div class="mb-2">
                    <label for="title" class="form-label">Event Title</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>
                <div class="mb-2">
                    <label for="description" class="form-label">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="2" required></textarea>
                </div>
                <div class="mb-2">
                    <label for="location" class="form-label">Location</label>
                    <input type="text" class="form-control" id="location" name="location" required>
                </div>
                <div class="mb-2">
                    <label for="date" class="form-label">Date</label>
                    <input type="text" class="form-control" id="date" name="date" placeholder="YYYY-MM-DD" pattern="\d{4}-\d{2}-\d{2}" required>
                </div>
                <div class="mb-2">
                    <label for="time" class="form-label">Time</label>
                    <input type="time" class="form-control" id="time" name="time" required>
                </div>
                <div class="mb-2">
                    <label for="image" class="form-label">Select Photo</label>
                    <input type="file" class="form-control" id="image" name="image" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>

	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>