<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Profesori</title>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Importăm stilurile -->
</head>

<body>
    <div class="container">
        <h2 align="center">Tabela Profesori:</h2>
        
        <br />
        <p align="center">
            <a href="nou_Profesor.jsp"><b>Adaugă un nou profesor</b></a> | <a href="menu.jsp"><b>Home</b></a>
        </p>

        <form action="sterge_Profesor.jsp" method="post">
            <table>
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
                %>
            </table>
            <br />
            <p align="center">
                <%
                // Check if user has permission to delete
                if ("admin".equals(userRole)) {
                %>
                    <input type="submit" value="Șterge liniile marcate">
                <%
                } else {
                    // Show a message for lack of permissions
                %>
                    <span>Nu aveți permisiuni suficiente pentru a șterge profesori.</span>
                <%
                }
                %>
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
    </div>
</body>
</html>
