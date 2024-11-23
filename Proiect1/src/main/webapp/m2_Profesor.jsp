<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Profesori</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Profesori:</h1>
	<br />
	<p align="center">
		<a href="nou_Profesor.jsp"><b>Adaugă un nou profesor.</b></a> | <a
			href="index.html"><b>Home</b></a>
	</p>
	<%
	// Retrieve form parameters for the selected professor
	String userRole = (String) session.getAttribute("userRole");
	jb.connectForUser(userRole);
	int aux = Integer.parseInt(request.getParameter("idprofesor"));
	String Nume = request.getParameter("Nume");
	String Prenume = request.getParameter("Prenume");
	String Adresa = request.getParameter("Adresa");
	String[] valori = { Nume, Prenume, Adresa };
	String[] campuri = { "Nume", "Prenume", "Adresa" };

	// Update the professor's information in the database
	jb.modificaTabela("profesori", "idprofesor", aux, campuri, valori);
	jb.disconnect();
	%>
	<h1 align="center">Modificările au fost efectuate!</h1>
	<p align="center">
        <a href="modifica_Profesor.jsp"><b>Catre Modifica Profesori</b></a> <br />
	</p>
</body>
</html>
