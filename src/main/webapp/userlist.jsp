<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	<style>
        /* Make table borders bold */
        .table-bordered {
            border-width: 2px !important;
        }
        .table-bordered th, 
        .table-bordered td {
            border: 2px solid black !important;
        }
    </style>

</head>
<body>

	<%@ include file="adminnavbar.jsp" %>
	
	<div class="container mt-5">
        <h2 class="text-center text-dark">All Users Details</h2>
        
        <!-- Search Box and Add Button -->
        <div class="mb-3 d-flex justify-content-center" >
            <input type="text" id="searchBox" class="form-control w-50" placeholder="Search events by title">
            <button class="btn btn-primary ms-2" onclick="searchUsers()">Search</button>
        </div>
        
        <table class="table table-light table-striped table-bordered mt-3">
            <thead class="table-primary text-center">
                <tr>
                	<th width="20">User Id</th>
                    <th width="100">User Name</th>
                    <th width="200">Email</th>
                    <th width="20">Role</th>
                    
                </tr>
            </thead>
            <tbody  align="center" id="allusers">
            	<%
            	Connection con = null;
            	Statement stmt = null;
            	ResultSet rs = null;
            	
            	System.out.println("admin page "+session.getAttribute("username"));
            	
            	try{
            		Class.forName("com.mysql.cj.jdbc.Driver");
            		
            		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventproject", "root", "8056");
            		
            		stmt = con.createStatement();
            		
            		rs = stmt.executeQuery("select id, name,email,role from eventusers");
            	
		            boolean hasEvents = false;
		            
		            while (rs.next()) {
		                hasEvents = true;
		        %>
		        <tr>
		        	<td>usr<%= rs.getInt("id") %></td>
		            <td><%= rs.getString("name") %></td>
		            <td><%= rs.getString("email") %></td>
		            <td><%= rs.getString("role") %></td>
		        </tr>
		        <%
	                 }
                	if(!hasEvents){
                    	%>
        	            <tr>
		                    <td colspan="6">No users found</td>
		                </tr>
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
            
            </tbody>
        </table>
    </div>

	<script >
	function searchUsers() {
		
	       var searchTitle = document.getElementById("searchBox").value;
	       var username
			console.log("search"+searchTitle);
			
		       $.ajax({
		           type: "GET",
		           url: "searchusersurl",
		           data: { name: searchTitle},
	           success: function (response) {
	        	   console.log("Response received:", response);
	               document.getElementById("allusers").innerHTML = response;
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