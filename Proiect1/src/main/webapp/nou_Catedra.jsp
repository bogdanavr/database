<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Importăm stilurile -->
    <title>Adaugă Catedră</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <div class="container">
        <h1 align="center">Adaugă o nouă catedră</h1>
        <%
            // Retrieve form data and add a new catedra if form was submitted
            String Nume = request.getParameter("Nume");
            String Departament = request.getParameter("Departament");
            String PuncteCredit = request.getParameter("PuncteCredit");

            if (Nume != null && Departament != null && PuncteCredit != null) {
                try {
                    jb.connect();
                    jb.adaugaCatedra(Nume, Departament, PuncteCredit);
                    jb.disconnect();
                    out.println("<p align='center' style='color:green;'>Catedra a fost adăugată cu succes!</p>");
                } catch (Exception e) {
                    out.println("<p align='center' style='color:red;'>Eroare la adăugarea catedrei: " + e.getMessage() + "</p>");
                }
            } else {
        %>
        <!-- Display the form for adding a new Catedra -->
        <form action="nou_Catedra.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Nume:</td>
                    <td><input type="text" name="Nume" size="30"  /></td>
                </tr>
                <tr>
                    <td align="right">Departament:</td>
                    <td><input type="text" name="Departament" size="30"  /></td>
                </tr>
                <tr>
                    <td align="right">Puncte Credit:</td>
                    <td><input type="text" name="PuncteCredit" size="30"  /></td>
                </tr>
            </table>
            <br/>
            <input type="submit" value="Adaugă Catedra" />
        </form>
        <%
            }
        %>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </div>
</body>
</html>
