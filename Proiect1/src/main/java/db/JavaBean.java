package db;
import java.sql.*;

public class JavaBean {
    String error;
    Connection con;
    public String userRole;  // To store the role of the logged-in user

    public JavaBean() {
    }
    
    public String login(String username, String password) throws Exception {
        if ("admin".equals(username) && "admin".equals(password)) {
            userRole = "admin";  // Set user role
            connectForUser(userRole);
            return userRole;
        } else if ("user".equals(username) && "user".equals(password)) {
            userRole = "user";  // Set user role
            connectForUser(userRole);
            return userRole;
        } else {
            error = "Credentiale invalide.";
            return null;
        }
    }
    
    public String getUserRole() {
        return userRole;  // Return the user's role
    }

    public boolean hasPermission(String operation) {
        // Implement permission checks based on user role
        if ("admin".equals(userRole)) {
            return true;  // Admin has all permissions
        } else if ("user".equals(userRole)) {
            // Define what a regular user can do
            return !"delete".equals(operation);  // For example, users cannot delete
        }
        return false;  // Default to no permission
    }

    public void connectForUser(String role) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            if ("admin".equals(role)) {
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facultate?useSSL=false",
                        "root", "Av29864553!!");
            } else if ("user".equals(role)) {
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facultate?useSSL=false",
                        "root", "Av29864553!!");
            }
        } catch (ClassNotFoundException | SQLException e) {
            error = e.getMessage();
            throw e;
        }
    }

    public void connect() throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facultate?useSSL=false",
                    "root", "Av29864553!!");
        } catch (ClassNotFoundException | SQLException e) {
            error = e.getMessage();
            throw e;
        }
    }

    public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "parola");
        } catch (ClassNotFoundException | SQLException e) {
            error = e.getMessage();
            throw e;
        }
    }

    public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "parola");
        } catch (ClassNotFoundException | SQLException e) {
            error = e.getMessage();
            throw e;
        }
    }

    public void disconnect() throws SQLException {
        if (con != null) {
            con.close();
        }
    }

    // Add a new professor
    public void adaugaProfesor(String Nume, String Prenume, String Adresa) throws SQLException, Exception {
        if (con != null) {
            try (Statement stmt = con.createStatement()) {
                stmt.executeUpdate("INSERT INTO profesori(Nume, Prenume, Adresa) VALUES('" + Nume + "', '" + Prenume + "', '" + Adresa + "');");
            } catch (SQLException e) {
                error = "ExceptieSQL: Inserare nereușită.";
                throw e;
            }
        } else {
            throw new Exception("Conexiunea la baza de date este inactivă.");
        }
    }

    // Add a new department
    public void adaugaCatedra(String Nume, String Departament, String PuncteCredit) throws SQLException, Exception {
        if (con != null) {
            try (Statement stmt = con.createStatement()) {
                stmt.executeUpdate("INSERT INTO catedre(Nume, Departament, PuncteCredit) VALUES('" + Nume + "', '" + Departament + "', '" + PuncteCredit + "');");
            } catch (SQLException e) {
                error = "ExceptieSQL: Inserare nereușită.";
                throw e;
            }
        } else {
            throw new Exception("Conexiunea la baza de date este inactivă.");
        }
    }

    // Add a new assignment (repartizare)
    public void adaugaRepartizare(int idcatedra, int idprofesor, String DataRepartizare, String Rol, long Salariu)
    		 throws SQLException, Exception {
    		 if (con != null) {
    		 try {
    		     // creaza un "prepared SQL statement"
    		     Statement stmt;
    		     stmt = con.createStatement();
    		     stmt.executeUpdate("insert into repartizari(idcatedra, idprofesor, DataRepartizare, Rol, Salariu) values('" + idcatedra + "' , '" + idprofesor + "', '" + DataRepartizare + "', '" + Rol + "', '" + Salariu + "');");
    		 } catch (SQLException sqle) {
    		     error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
    		     throw new SQLException(error);
    		 }
    		 } else {
    		     error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
    		     throw new Exception(error);
    		 }
    		}

    // View table data
    public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
        ResultSet rs = null;
        if (con != null) {
            try {
                String queryString = "SELECT * FROM facultate." + tabel;
                Statement stmt = con.createStatement();
                rs = stmt.executeQuery(queryString);
            } catch (SQLException e) {
                error = "SQLException: Interogare nereușită.";
                throw e;
            }
        } else {
            throw new Exception("Conexiunea la baza de date este inactivă.");
        }
        return rs;
    }

     
   
    public ResultSet vedeRepartizari() throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = "SELECT p.Nume NumeProfesor, p.Prenume PrenumeProfesor, p.Adresa, c.Nume NumeCatedra, c.Departament, r.idrepartizare, r.idprofesor, r.idcatedra, r.DataRepartizare, r.Rol, r.Salariu FROM profesori p, catedre c, repartizari r WHERE p.idprofesor = r.idprofesor AND c.idcatedra = r.idcatedra;";
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    }

  
    // Delete entries by primary keys
    public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
        if (con != null) {
            try (PreparedStatement delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + " = ?;")) {
                for (String pk : primaryKeys) {
                    delete.setLong(1, Long.parseLong(pk));
                    delete.execute();
                }
            } catch (SQLException e) {
                error = "ExceptieSQL: Ștergere nereușită.";
                throw e;
            }
        } else {
            throw new Exception("Conexiunea la baza de date este inactivă.");
        }
    }

    // Update table entries
    public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori) throws SQLException, Exception {
        if (con != null) {
            try {
                StringBuilder update = new StringBuilder("UPDATE " + tabela + " SET ");
                for (int i = 0; i < campuri.length; i++) {
                    update.append(campuri[i]).append("='").append(valori[i]).append(i < campuri.length - 1 ? "', " : "' ");
                }
                update.append("WHERE ").append(IDTabela).append("= ").append(ID);
                try (Statement stmt = con.createStatement()) {
                    stmt.executeUpdate(update.toString());
                }
            } catch (SQLException e) {
                error = "ExceptieSQL: Actualizare nereușită.";
                throw e;
            }
        } else {
            throw new Exception("Conexiunea la baza de date este inactivă.");
        }
    }

    // Get specific entry by ID
    public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        if (con != null) {
            try {
                String queryString = "SELECT * FROM " + tabela + " WHERE idprofesor=" + ID;
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                rs = stmt.executeQuery(queryString);
            } catch (SQLException e) {
                error = "SQLException: Interogare nereușită.";
                throw e;
            }
        } else {
            throw new Exception("Conexiunea la baza de date este inactivă.");
        }
        return rs;
    }

    // Get specific entry by dynamic ID column
    public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        if (con != null) {
            try {
                String queryString = "SELECT * FROM " + tabela + " WHERE " + denumireId + "=" + ID;
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                rs = stmt.executeQuery(queryString);
            } catch (SQLException e) {
                error = "SQLException: Interogare nereușită.";
                throw e;
            }
        } else {
            throw new Exception("Conexiunea la baza de date este inactivă.");
        }
        return rs;
    }
    
    public ResultSet intoarceRepartizareId(int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            // Executa interogarea
            String queryString = "SELECT p.Nume NumeProfesor, p.Prenume PrenumeProfesor, p.Adresa, c.Nume NumeCatedra, c.Departament, r.idrepartizare, r.idprofesor, r.idcatedra, r.DataRepartizare, r.Rol, r.Salariu FROM profesori p, catedre c, repartizari r WHERE p.idprofesor = r.idprofesor AND c.idcatedra = r.idcatedra AND r.idrepartizare = '" + ID + "'";
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    }

}


