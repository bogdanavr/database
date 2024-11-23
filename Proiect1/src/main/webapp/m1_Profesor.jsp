<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
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
        <a href="nou_Profesor.jsp"><b>Adaugă un nou profesor.</b></a> | <a href="index.html"><b>Home</b></a>
    </p>
    <%
    String userRole = (String) session.getAttribute("userRole"); 
    jb.connectForUser(userRole);
        int aux = Integer.parseInt(request.getParameter("primarykey"));
        ResultSet rs = jb.intoarceLinieDupaId("profesori", "idprofesor", aux);
        rs.first();
        String Nume = rs.getString("Nume");
        String Prenume = rs.getString("Prenume");
        String Adresa = rs.getString("Adresa");
        rs.close();
        jb.disconnect();
    %>
    <form action="m2_Profesor.jsp" method="post">
        <table align="center">
            <tr>
                <td align="right">IdProfesor:</td>
                <td><input type="text" name="idprofesor" size="30" value="<%= aux %>" readonly /></td>
            </tr>
            <tr>
                <td align="right">Nume:</td>
                <td><input type="text" name="Nume" size="30" value="<%= Nume %>" /></td>
            </tr>
            <tr>
                <td align="right">Prenume:</td>
                <td><input type="text" name="Prenume" size="30" value="<%= Prenume %>" /></td>
            </tr>
            <tr>
                <td align="right">Adresa:</td>
                <td><input type="text" name="Adresa" size="30" value="<%= Adresa %>" /></td>
            </tr>
        </table>
        <p align="center">
            <input type="submit" value="Modifică linia">
        </p>
    </form>
    <p align="center">
        <a href="modifica_Profesor.jsp"><b>Catre Modifica Profesori</b></a> <br />
    </p>
</body>
</html>
