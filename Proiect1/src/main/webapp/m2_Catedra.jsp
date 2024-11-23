<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
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
        <a href="nou_Catedra.jsp"><b>Adaugă o nouă catedră.</b></a> | <a href="index.html"><b>Home</b></a>
    </p>

    <%
        // Retrieve form data and selected `idcatedra` to update the entry in `catedre` table
        int aux = Integer.parseInt(request.getParameter("idcatedra"));
        String Nume = request.getParameter("Nume");
        String Departament = request.getParameter("Departament");
        String PuncteCredit = request.getParameter("PuncteCredit");

        String[] valori = { Nume, Departament, PuncteCredit };
        String[] campuri = { "Nume", "Departament", "PuncteCredit" };

        try {
            jb.connect();
            jb.modificaTabela("catedre", "idcatedra", aux, campuri, valori);
            jb.disconnect();
            out.println("<h1 align='center' style='color:green;'>Modificările au fost efectuate!</h1>");
        } catch (Exception e) {
            out.println("<h1 align='center' style='color:red;'>Eroare la modificarea catedrei: " + e.getMessage() + "</h1>");
        }
    %>
    <p align="center">
        <a href="modifica_Catedra.jsp"><b>Catre Modifica Catedre</b></a> <br />
    </p>
</body>
</html>
