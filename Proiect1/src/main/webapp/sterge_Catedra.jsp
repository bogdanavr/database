<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Tabela Catedre - Ștergere</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
        String[] selectedIds = request.getParameterValues("primarykey");
        
        if (selectedIds != null && selectedIds.length > 0) {
            try {
                jb.connect();
                jb.stergeDateTabela(selectedIds, "catedre", "idcatedra");
                jb.disconnect();
                out.println("<p align='center' style='color:green;'>Înregistrările selectate au fost șterse cu succes!</p>");
            } catch (Exception e) {
                out.println("<p align='center' style='color:red;'>Eroare la ștergerea înregistrărilor: " + e.getMessage() + "</p>");
            }
        } else {
            out.println("<p align='center' style='color:red;'>Nicio înregistrare selectată pentru ștergere.</p>");
        }
    %>
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>
