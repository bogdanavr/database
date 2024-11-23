<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Repartizari</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <h1 align="center">Tabela Repartizari:</h1>
    <br />
    <p align="center">
        <a href="nou_Repartizare.jsp"><b>Adauga o noua repartizare.</b></a> <a href="index.html"><b>Home</b></a>
    </p>
    <%
        jb.connect();
        int aux = java.lang.Integer.parseInt(request.getParameter("idrepartizare"));
        String idprofesor = request.getParameter("idprofesor");
        String idcatedra = request.getParameter("idcatedra");
        String DataRepartizare = request.getParameter("DataRepartizare");
        String Rol = request.getParameter("Rol");
        String Salariu = request.getParameter("Salariu");
        String[] valori = { idprofesor, idcatedra, DataRepartizare, Rol, Salariu };
        String[] campuri = { "idprofesor", "idcatedra", "DataRepartizare", "Rol", "Salariu" };
        jb.modificaTabela("repartizari", "idrepartizare", aux, campuri, valori);
        jb.disconnect();
    %>
    <h1 align="center">Modificarile au fost efectuate!</h1>
    <p align="center">
        <a href="modifica_Repartizare.jsp"><b>Catre Modificare Repartizari</b></a> <br />
    </p>
</body>
</html>
