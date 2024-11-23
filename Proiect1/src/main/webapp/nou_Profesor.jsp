<%-- 
    Document   : nou_Profesor
    Created on : Nov 14, 2016, 1:08:21 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Importăm stilurile -->
        <title>Adaugă Profesor</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String Adresa = request.getParameter("Adresa");
            if (Nume != null && Prenume != null && Adresa != null) {
            	 String userRole = (String) session.getAttribute("userRole"); 
                jb.connectForUser(userRole);
                jb.adaugaProfesor(Nume, Prenume, Adresa);
                jb.disconnect();
        %>
        <p>Datele au fost adăugate.</p>
        <%
            } else {
        %>
        <div class="container">
            <h1> Adăugare Profesor</h1>
            <form action="nou_Profesor.jsp" method="post">
                <table>
                    <tr>
                        <td align="right">Nume Profesor:</td>
                        <td><input type="text" name="Nume" size="40"  /></td>
                    </tr>
                    <tr>
                        <td align="right">Prenume Profesor:</td>
                        <td><input type="text" name="Prenume" size="30"  /></td>
                    </tr>
                    <tr>
                        <td align="right">Adresa:</td>
                        <td><input type="text" name="Adresa" size="30"  /></td>
                    </tr>
                </table>
                <input type="submit" value="Adaugă profesorul" />
            </form>
        <%
            }
        %>
        <br/>
        <p align="center">
            <a href="menu.jsp"><b>Home</b></a> <br />
        </p>
        <br/>
        </div>
    </body>
</html>
