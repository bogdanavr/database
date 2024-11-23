<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Catedre</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
	<h1 align="center">Tabela Catedre:</h1>
	<br />
	<p align="center">
		<a href="nou_Catedra.jsp"><b>Adaugă o nouă catedră.</b></a> | <a
			href="index.html"><b>Home</b></a>
	</p>

	<%
        // Retrieve the selected `idcatedra` from the form submission and display its details
        jb.connect();
        int aux = Integer.parseInt(request.getParameter("primarykey"));
        ResultSet rs = jb.intoarceLinieDupaId("catedre", "idcatedra", aux);
        rs.first();
        String Nume = rs.getString("Nume");
        String Departament = rs.getString("Departament");
        String PuncteCredit = rs.getString("PuncteCredit");
        rs.close();
        jb.disconnect();
    %>

	<!-- Form to display and edit Catedra details -->
	<form action="m2_Catedra.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdCatedra:</td>
				<td><input type="text" name="idcatedra" size="30"
					value="<%= aux %>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="Nume" size="30"
					value="<%= Nume %>" /></td>
			</tr>
			<tr>
				<td align="right">Departament:</td>
				<td><input type="text" name="Departament" size="30"
					value="<%= Departament %>" /></td>
			</tr>
			<tr>
				<td align="right">Puncte Credit:</td>
				<td><input type="text" name="PuncteCredit" size="30"
					value="<%= PuncteCredit %>" /></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" value="Modifică linia">
		</p>
	</form>

	<p align="center">
        <a href="modifica_Catedra.jsp"><b>Catre Modifica Catedre</b></a> <br />
	</p>
</body>
</html>
