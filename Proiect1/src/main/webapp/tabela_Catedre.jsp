<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Importăm stilurile -->
    <title>Tabela Catedre</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <h1 align="center">Tabela Catedre:</h1>
    <br />
    <p align="center">
        <a href="nou_Catedra.jsp"><b>Adaugă o nouă catedră.</b></a> | <a href="menu.jsp"><b>Home</b></a>
    </p>
    <form action="sterge_Catedra.jsp" method="post">
        <table border="1" align="center">
            <tr>
                <td><b>Mark:</b></td>
                <td><b>IdCatedra:</b></td>
                <td><b>Nume:</b></td>
                <td><b>Departament:</b></td>
                <td><b>PuncteCredit:</b></td>
            </tr>
            <%
            jb.connect();
            ResultSet rs = jb.vedeTabela("catedre");
            long x;
            while (rs.next()) {
                x = rs.getLong("idcatedra");
            %>
            <tr>
                <td><input type="checkbox" name="primarykey" value="<%= x %>" /></td>
                <td><%= x %></td>
                <td><%= rs.getString("Nume") %></td>
                <td><%= rs.getString("Departament") %></td>
                <td><%= rs.getString("PuncteCredit") %></td>
            </tr>
            <%
            }
            rs.close();
            jb.disconnect();
            %>
        </table>
        <br />
        <p align="center">
            <input type="submit" value="Șterge liniile marcate">
        </p>
    </form>
    <br />
    <p align="center">
        <a href="menu.jsp"><b>Home</b></a> <br />
    </p>
</body>
</html>
