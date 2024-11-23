<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java"
    import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">    
<title>Tabela Repartizari</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <%
    String[] s = request.getParameterValues("primarykey");
    if (s != null) {
        jb.connect();
        jb.stergeDateTabela(s, "repartizari", "idrepartizare");
        jb.disconnect();
    %>
        <p>Datele au fost sterse din tabela Repartizari.</p>
    <%
    } else {
    %>
        <p>Nicio inregistrare selectata pentru stergere.</p>
    <%
    }
    %>
    <p align="center">
        <a href="index.html"><b>Home</b></a> <br />
    </p>
</body>
</html>
