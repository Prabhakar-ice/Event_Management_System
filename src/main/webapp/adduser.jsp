<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            max-width: 400px; /* Decreasing the width */
            margin: auto;
            padding: 15px;
        }
    </style>
</head>
<body>

<%@ include file="adminnavbar.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5"> <!-- Decreased from col-md-6 -->
            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h5>Register New User</h5>
                </div>
                <div class="card-body">
                    <form>
                        <!-- Username -->
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" class="form-control" required>
                        </div>
                        <!-- Email -->
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>
                        <!-- Password -->
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <!-- Role Dropdown -->
                        <div class="mb-3">
                            <label class="form-label">Role</label>
                            <select name="role" class="form-select" required>
                                <option value="USER">USER</option>
                                <option value="ADMIN">ADMIN</option>
                            </select>
                        </div>
                        <!-- Submit Button -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-success">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

	<%
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
		System.out.println("admin add page "+role);
		
		if(username != null && email != null && password != null && role != null){
			Connection con = null;
			Statement stmt = null;
			
			int rows = 0;
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventproject", "root", "8056");
				
				String insertquery = "INSERT INTO eventusers(name, email, password, role) values('"+username+"','"+email+"','"+password+"','"+role+"'); " ;
				
				stmt = con.createStatement();
				rows = stmt.executeUpdate(insertquery);
				
				if(rows > 0){
					session.setAttribute("result","User is Added.");
					response.sendRedirect("results/adminsuccess.jsp");
				}
				else{
					session.setAttribute("result","User is not Added.");
					response.sendRedirect("results/adminfail.jsp");
				}
			}
			catch(ClassNotFoundException e){
				session.setAttribute("exception", e);
				response.sendRedirect("results/exception.jsp");
			}
			catch(SQLException e){
				session.setAttribute("exception", e);
				response.sendRedirect("results/exception.jsp");
			}
			finally{
				if(con != null)con.close();
				if(stmt != null)stmt.close();
			}
		}
	
	%>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
