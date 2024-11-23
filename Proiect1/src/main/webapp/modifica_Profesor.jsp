<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<!-- Importăm stilurile -->
<title>Tabela Profesori</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div class="container">
		<h1 align="center">Tabela Profesori:</h1>
		<br />
		<p align="center">
			<a href="nou_Profesor.jsp"><b>Adaugă un nou profesor.</b></a> | <a
				href="menu.jsp"><b>Home</b></a>
		</p>

		<form action="m1_Profesor.jsp" method="post">
			<table border="1" align="center">
				<tr>
					<td><b>Mark:</b></td>
					<td><b>IdProfesor:</b></td>
					<td><b>Nume:</b></td>
					<td><b>Prenume:</b></td>
					<td><b>Adresa:</b></td>
				</tr>
				<%
                String userRole = (String) session.getAttribute("userRole"); 
                jb.connectForUser(userRole);
                    ResultSet rs = jb.vedeTabela("profesori");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idprofesor");
                %>
				<tr>
					<td><input type="checkbox" name="primarykey" value="<%= x %>" /></td>
					<td><%= x %></td>
					<td><%= rs.getString("Nume") %></td>
					<td><%= rs.getString("Prenume") %></td>
					<td><%= rs.getString("Adresa") %></td>
				</tr>
				<%
                    }
                    rs.close();
                    jb.disconnect();
                %>
			</table>
			<br />
			<p align="center">
				<input type="submit" value="Modifică linia">
			</p>
		</form>

		<br />
		<p align="center">
			<a href="menu.jsp"><b>Home</b></a> <br />
		</p>
	</div>
</body>
</html>
