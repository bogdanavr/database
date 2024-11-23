<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Repartizari</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="styles.css">    
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Repartizari:</h1>
        <br/>
        <p align="center"><a href="nou_Repartizare.jsp"><b>Adauga o noua repartizare.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String NumeProfesor, PrenumeProfesor, Adresa, NumeCatedra, Departament, Rol, DataRepartizare;
            int Salariu;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceRepartizareId(aux);
            rs.first();
            int id1 = rs.getInt("idprofesor");
            int id2 = rs.getInt("idcatedra");

            NumeProfesor = rs.getString("NumeProfesor");
            PrenumeProfesor = rs.getString("PrenumeProfesor");
            Adresa = rs.getString("Adresa");
            NumeCatedra = rs.getString("NumeCatedra");
            Departament = rs.getString("Departament");
            DataRepartizare = rs.getString("DataRepartizare");
            Rol = rs.getString("Rol");
            Salariu = rs.getInt("Salariu");

            ResultSet rs1 = jb.vedeTabela("profesori");
            ResultSet rs2 = jb.vedeTabela("catedre");
            int idprofesor, idcatedra;
        %>
        <form action="m2_Repartizare.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdRepartizare:</td>
                    <td> <input type="text" name="idrepartizare" size="30" value="<%= aux %>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">IdProfesor:</td>
                    <td> 
                        <SELECT NAME="idprofesor">
                            <%
                                while (rs1.next()) {
                                    idprofesor = rs1.getInt("idprofesor");
                                    NumeProfesor = rs1.getString("Nume");
                                    PrenumeProfesor = rs1.getString("Prenume");
                                    Adresa = rs1.getString("Adresa");
                                    if (idprofesor != id1) {
                            %>
                            <OPTION VALUE="<%= idprofesor %>"><%= idprofesor %>, <%= NumeProfesor %>, <%= PrenumeProfesor %>, <%= Adresa %></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION VALUE="<%= idprofesor %>"><%= idprofesor %>, <%= NumeProfesor %>, <%= PrenumeProfesor %>, <%= Adresa %></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>
                    </td>
                </tr>
                <tr>
                    <td align="right">IdCatedra:</td>
                    <td> 
                        <SELECT NAME="idcatedra">
                            <%
                                while (rs2.next()) {
                                    idcatedra = rs2.getInt("idcatedra");
                                    NumeCatedra = rs2.getString("Nume");
                                    Departament = rs2.getString("Departament");
                                    if (idcatedra != id2) {
                            %>
                            <OPTION VALUE="<%= idcatedra %>"><%= idcatedra %>, <%= NumeCatedra %>, <%= Departament %></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION  VALUE="<%= idcatedra %>"><%= idcatedra %>, <%= NumeCatedra %>, <%= Departament %></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>
                    </td>
                </tr>
                <tr>
                    <td align="right">DataRepartizare:</td>
                    <td> <input type="text" name="DataRepartizare" size="30" value="<%= DataRepartizare %>"/></td>
                </tr>
                <tr>
                    <td align="right">Rol:</td>
                    <td> <input type="text" name="Rol" size="30" value="<%= Rol %>"/></td>
                </tr>
                <tr>
                    <td align="right">Salariu:</td>
                    <td> <input type="text" name="Salariu" size="30" value="<%= Salariu %>"/></td>
                </tr>
            </table>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
             <a href="modifica_Repartizare.jsp"><b>Catre Modificare Repartizari</b></a> <br />
            <br/>
        </p>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>
