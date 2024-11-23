<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Repartizari</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<!-- Importăm stilurile -->

</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Repartizari:</h1>
	<br />
	<p align="center">
		<a href="nou_Repartizare.jsp"><b>Adauga o noua repartizare.</b></a> <a
			href="menu.jsp"><b>Home</b></a>
	</p>
	<form action="m1_Repartizare.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdRepartizare:</b></td>
				<td><b>IdProfesor:</b></td>
				<td><b>NumeProfesor:</b></td>
				<td><b>PrenumeProfesor:</b></td>
				<td><b>Adresa:</b></td>
				<td><b>IdCatedra:</b></td>
				<td><b>NumeCatedra:</b></td>
				<td><b>Departament:</b></td>
				<td><b>DataRepartizare:</b></td>
				<td><b>Rol:</b></td>
				<td><b>Salariu:</b></td>
			</tr>
			<%
                    jb.connect();
                    ResultSet rs = jb.vedeRepartizari();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idrepartizare");
                %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x %>" /></td>
				<td><%= x %></td>
				<td><%= rs.getInt("idprofesor") %></td>
				<td><%= rs.getString("NumeProfesor") %></td>
				<td><%= rs.getString("PrenumeProfesor") %></td>
				<td><%= rs.getString("Adresa") %></td>
				<td><%= rs.getInt("idcatedra") %></td>
				<td><%= rs.getString("NumeCatedra") %></td>
				<td><%= rs.getString("Departament") %></td>
				<td><%= rs.getDate("DataRepartizare") %></td>
				<td><%= rs.getString("Rol") %></td>
				<td><%= rs.getInt("Salariu") %></td>
			</tr>
			<%
                    }
                %>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<%
            rs.close();
            jb.disconnect();
        %>
	<br />
	<p align="center">
		<a href="menu.jsp"><b>Home</b></a> <br />
	</p>
</body>
</html>
