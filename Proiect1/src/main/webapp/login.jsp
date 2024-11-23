<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
     <link rel="stylesheet" type="text/css" href="styles.css"> 
    <title>Login</title>
</head>
<body>
	<div class="container">
    <h2>Login</h2>
    <form action="login.jsp" method="post">
       <label for="username">Utilizator:</label><br> <input type="text" name="username" /><br/>
        <label for="password">Parola:</label><br> <input type="password" name="password" /><br/>
       <br> <input type="submit" value="Login" />
    </form>

    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if (username != null && password != null) {
            // Instanțiază JavaBean-ul
    
            String userRole = jb.login(username, password); // Presupunând că această metodă returnează rolul utilizatorului sau null
            
            if (userRole != null) {
                session.setAttribute("userRole", userRole);
                response.sendRedirect("menu.jsp");
            } else {
                out.println("Credentiale invalide!");
            }
        }
    %>
    </div>
</body>
</html>
