<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<%@ include file="navbar.jsp" %>
   
    
    <div class="container mt-5">
    <h2 class="text-center text-dark">My Event</h2>

    <!-- Search Box -->
    <div class="mb-3 d-flex justify-content-center" >
            <input type="text" id="searchBox" class="form-control w-50" placeholder="Search events by title">
            <button class="btn btn-primary ms-2" onclick="searchEvents()">Search</button>
        </div>

    <div class="row row-cols-1 row-cols-md-4 g-4" id="eventContainer"> <!-- Grid Layout (4x5) -->
        <%
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
        	 Class.forName("com.mysql.cj.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventproject", "root", "8056");
            stmt = con.createStatement();
            String query = "SELECT title, description, time, location, date, participants,imagename FROM events where createdby='"+session.getAttribute("username")+"';" ;
            rs = stmt.executeQuery(query);

            boolean hasEvents = false;

            while (rs.next()) {
                hasEvents = true;
        %>
        <div class="col">
            <div class="card h-100 shadow-lg"> <!-- Event Card -->
                <img src="images/<%= rs.getString("imagename") %>" class="card-img-top" alt="Event Image">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= rs.getString("title") %></h5>
                    <p class="card-text"><%= rs.getString("description") %></p>
                    <p><strong>Time:</strong> <%= rs.getString("time") %></p>
                    <p><strong>Location:</strong> <%= rs.getString("location") %></p>
                    <p><strong>Date:</strong> <%= rs.getString("date") %></p>
                    <p><strong>Participants:</strong> <%= rs.getString("participants") %></p>
                    <a href="join.jsp?eventname=<%= rs.getString("title") %>" class="btn btn-primary">Join Event</a>
                </div>
            </div>
        </div>
        <%
            }
            if (!hasEvents) {
        %>
        <div align="center" class="col-12 text-center">
            <p class="text-danger">You Have not created any Events Yet...</p>
        </div>
        <%
            }
        } catch (Exception e) {
            out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        }
        %>
    </div> <!-- End of Grid -->
</div>

	<script >
	function searchEvents() {
		
	       var searchTitle = document.getElementById("searchBox").value;
	       var userName = "<%= session.getAttribute("username") %>";
			console.log("search"+searchTitle);
			console.log("search"+userName);
	       $.ajax({
	           type: "GET",
	           url: "searcheventsurl",
	           data: { title: searchTitle,
	        	   username: userName},
	           success: function (response) {
	        	   console.log("Response received:", response);
	               document.getElementById("eventContainer").innerHTML = response;
	           },
	           error: function () {
	               alert("Error fetching search results.");
	           }
	       });
	   }
	
	</script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    
    
</body>
</html>
