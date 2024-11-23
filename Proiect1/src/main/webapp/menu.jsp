<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Profesori, Catedre și Repartizări</title>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Importăm stilurile -->
</head>
<body>
    <div class="container">
        <h2>Vizualizări + Adăugări + Ștergeri</h2>
        
        <!-- Main Links -->
        <nav class="main-menu">
            <ul>
                <li><a href="tabela_Profesori.jsp"><strong>Profesori</strong></a></li>
                <li><a href="tabela_Catedre.jsp"><strong>Catedre</strong></a></li>
                <li><a href="tabela_Repartizari.jsp"><strong>Repartizări</strong></a></li>
            </ul>
        </nav>
        
        <hr>
        
        <!-- Edit Section -->
        <div>
            <%
            // Verifică dacă utilizatorul are permisiunea de a șterge
            String userRole = (String) session.getAttribute("userRole"); // Asigură-te că ai setat acest atribut anterior
            
            if ("admin".equals(userRole)) {
            %>
            <nav class="main-menu">
                <ul>
                    <li><a href="modifica_Profesor.jsp"><strong>Modifică Profesori</strong></a></li>
                    <li><a href="modifica_Catedra.jsp"><strong>Modifică Catedre</strong></a></li>
                    <li><a href="modifica_Repartizare.jsp"><strong>Modifică Repartizări</strong></a></li>
                </ul>
            </nav>
            <%
            } else {
                // Afișează mesaj pentru utilizatorii care nu au permisiuni
                out.println("<p>Nu ai permisiunea de a modifica datele.</p>");
            }
            %>
        </div>
        
        <hr>
    </div>
</body>
</html>
