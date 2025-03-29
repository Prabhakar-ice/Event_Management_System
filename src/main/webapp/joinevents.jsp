<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script src="javascript/joinevents.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	    .card {
	    height: 380px; /* Reduced height */
	    display: flex;
	    flex-direction: column;
		}
		
		.card-img-container {
		    height: 150px; /* Reserved space for image */
		    background-color: #f0f0f0; /* Light background for empty images */
		    display: flex;
		    align-items: center;
		    justify-content: center;
		}
		
		.card-img-top {
		    max-height: 100%;
		    object-fit: cover;
		}
		  
		.card-body {
		    flex-grow: 1;
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		}

</style>
</head>
<body>
	
	<% if ("USER".equals(session.getAttribute("role"))) { %>
    <jsp:include page="navbar.jsp" />
<% } 
	else{ %>
	<jsp:include page="adminnavbar.jsp" />
	<%}	 %>
	
	<div class="container mt-5">
    <h2 class="text-center text-dark">All Event</h2>

    <!-- Search Box -->
    <!-- 🔍 Search Box and Button -->
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
            String query = "SELECT title, description, time, location, date, participants,imagename FROM events order by date ASC;" ;
            rs = stmt.executeQuery(query);

            boolean hasEvents = false;

            while (rs.next()) {
                hasEvents = true;
        %>
        <div class="col">
            <div class="card h-100 shadow-lg"> <!-- Event Card -->
                 <% String imageName = rs.getString("imagename"); %>
            <img src="images/<%= (imageName != null && !imageName.isEmpty()) ? imageName : "default.jpg" %>" class="card-img-top" alt="Event Image">
                <div class="card-body text-left">
                    <h5 class="card-title"><%= rs.getString("title") %></h5>
                    <p class="card-text"><%= rs.getString("description") %></p>
                    <p><strong>Time:</strong> <%= rs.getString("time") %></p>
                    <p><strong>Location:</strong> <%= rs.getString("location") %></p>
                    <p><strong>Date:</strong> <%= rs.getString("date") %></p>
                    <p><strong>Participants:</strong> <%= rs.getString("participants") %></p>
                    <a href="join.jsp?eventname=<%= rs.getString("title") %>" class="btn btn-primary ">Join Event</a>
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
	       
			console.log("search"+searchTitle);
	       $.ajax({
	           type: "GET",
	           url: "searcheventsurl",
	           data: { title: searchTitle },
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
</body>
</html>