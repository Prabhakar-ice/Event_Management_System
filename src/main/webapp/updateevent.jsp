<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .custom-select {
            padding: 10px;
            border-radius: 8px;
            background-color: #f8f9fa;
            font-size: 16px;
            transition: all 0.3s ease-in-out;
        }
        .custom-select:hover, .custom-select:focus {
            background-color: #e9ecef;
            border-color: #007bff;
        }
    </style>
</head>
<body>

	<%@ include file="navbar.jsp" %>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="col-md-6 p-4 border rounded shadow bg-white">
            <h2 class="text-center text-dark">Update Event</h2>
            
            <form>
                <div class="mb-3">
                    <label for="eventname" class="form-label">Event Name</label>
                    <input type="text" class="form-control" id="eventname" name="eventname" placeholder="Enter event name" required>
                </div>
                
                <div class="mb-3">
                    <label for="updatefield" class="form-label">Select Field to Update</label>
                    <select class="form-select custom-select" id="updatefield" name="updatefield" required>
                        <option value="event">Event</option>
                        <option value="description">Description</option>
                        <option value="location">Location</option>
                        <option value="date">Date</option>
                        <option value="time">Time</option>
                    </select>
                </div>
                
                <div class="mb-3">
                    <label for="newvalue" class="form-label">New Value</label>
                    <input type="text" class="form-control" id="newvalue" name="newvalue" placeholder="Enter new value" required>
                </div>
                
                <button  type="submit" class="btn btn-primary w-100">Update Event</button>
            </form>
            
            <div class="text-center mt-3">
                <a href="user.jsp" class="btn btn-secondary">Back to Events</a>
            </div>
        </div>
    </div>

	<%
	
		String value = request.getParameter("newvalue");
        String field = request.getParameter("updatefield");
        String eventname = request.getParameter("eventname");
        
        System.out.println("update page "+ eventname);
        
        if(value != null && eventname != null && field != null ){
        	
        	Connection con = null;
        	Statement stmt = null;
        	int rows = 0;
        	
        	try{
        		Class.forName("com.mysql.cj.jdbc.Driver");
        		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventproject","root","8056");
        		
        		//UPDATE events SET _______ = _________ where title = __________
        		String updatequery = "UPDATE events SET "+field+" ='"+value+"' WHERE title='"+eventname+"' AND createdby ='"+session.getAttribute("username")+"';" ;
        		
        		stmt = con.createStatement();
        		rows = stmt.executeUpdate(updatequery);
        		
        		if(rows > 0){
					session.setAttribute("result","Event is Created");
					session.setAttribute("option","Go Back");
					response.sendRedirect("results/success.jsp");
				}
				else{
					session.setAttribute("result","Event is not updated check the details");
					response.sendRedirect("results/fail.jsp");
				}
        	}
        	catch (Exception e) {
                out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            }
        	
        }
	%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

