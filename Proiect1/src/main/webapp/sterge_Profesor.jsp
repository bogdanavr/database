<%-- 
    Document   : sterge_Profesor
    Created on : Nov 14, 2016, 1:32:42 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Importăm stilurile -->
        <title>Tabela Profesori</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <div class="container">
            <%
                String[] s = request.getParameterValues("primarykey");
                if (s != null && s.length > 0) {
                	 String userRole = (String) session.getAttribute("userRole"); 
                     jb.connectForUser(userRole);
                    jb.stergeDateTabela(s, "profesori", "idprofesor");
                    jb.disconnect();
            %>
            <p>Datele selectate au fost șterse cu succes.</p>
            <%
                } else {
            %>
            <p>Nicio înregistrare nu a fost selectată pentru ștergere.</p>
            <%
                }
            %>
            <p align="center">
                <a href="menu.jsp"><b>Home</b></a>
                <br/>
            </p>
        </div>
    </body>
</html>
