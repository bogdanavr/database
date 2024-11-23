<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga repartizare</title>
                <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Importăm stilurile -->
        
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            int idprofesor, idcatedra;
            String id1, id2, NumeProfesor, PrenumeProfesor, Adresa, NumeCatedra, Departament, DataRepartizare, Rol;
            int Salariu;
            id1 = request.getParameter("idprofesor");
            id2 = request.getParameter("idcatedra");
            DataRepartizare = request.getParameter("DataRepartizare");
            Rol = request.getParameter("Rol");
            String salariuParam = request.getParameter("Salariu");
            if (id1 != null) {
                jb.connect();
                jb.adaugaRepartizare(Integer.parseInt(id1), Integer.parseInt(id2), DataRepartizare, Rol, Integer.parseInt(salariuParam));
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("profesori");
        ResultSet rs2 = jb.vedeTabela("catedre");
        %>
        <h1 align="center"> Suntem in tabela repartizari.</h1>
        <form action="nou_Repartizare.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdProfesor:</td>
                    <td> 
                        Selectati profesorul:
                        <SELECT NAME="idprofesor">
                            <%
                                while(rs1.next()){
                                    idprofesor = rs1.getInt("idprofesor");
                                    NumeProfesor = rs1.getString("Nume");
                                    PrenumeProfesor = rs1.getString("Prenume");
                                    Adresa = rs1.getString("Adresa");
                            %>
                                <OPTION VALUE="<%= idprofesor %>"><%= idprofesor %>, <%= NumeProfesor %>, <%= PrenumeProfesor %>, <%= Adresa %></OPTION>
                            <%
                                }
                            %>
                        </SELECT>
                    </td>
                </tr>
                <tr>
                    <td align="right">IdCatedra:</td>
                    <td> 
                        Selectati catedra:
                        <SELECT NAME="idcatedra">
                            <%
                                while(rs2.next()){
                                    idcatedra = rs2.getInt("idcatedra");
                                    NumeCatedra = rs2.getString("Nume");
                                    Departament = rs2.getString("Departament");
                            %>
                                <OPTION VALUE="<%= idcatedra %>"><%= idcatedra %>, <%= NumeCatedra %>, <%= Departament %></OPTION>
                            <%
                                }
                            %>
                        </SELECT>
                    </td>
                </tr>
                <tr>
                    <td align="right">Data Repartizare:</td>
                    <td> <input type="text" name="DataRepartizare" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Rol:</td>
                    <td> <input type="text" name="Rol" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Salariu:</td>
                    <td> <input type="text" name="Salariu" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga repartizarea" />
        </form>
        <%
            }
        %>
        <br/>
        <p align="center"><a href="index.html"><b>Home</b></a></p>
        <br/>
    </body>
</html>
