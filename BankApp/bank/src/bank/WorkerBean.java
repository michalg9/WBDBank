package bank;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import oracle.jdbc.pool.OracleDataSource;

import java.sql.Statement;
import java.sql.ResultSet;

import java.text.DecimalFormat;

import java.text.DecimalFormatSymbols;

import javax.servlet.http.HttpSession;

import oracle.jdbc.OracleTypes;


public class WorkerBean {
    public WorkerBean() throws SQLException {
      ConnectionHandler connHandler = new ConnectionHandler();
      Connection conn = connHandler.conn;
      
    }
    
  ConnectionHandler connHandler;
  Connection conn;
  
    Statement stmt;
    ResultSet rset;
    String query;
    String sqlString;
    
    boolean isManager;
    
    public void setFunction() throws SQLException {
      try {
          connHandler.getDBConnection();
          stmt =
      connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          query = "SELECT STANOWISKO FROM Pracownik where ident = " + connHandler.getL_userid();
          System.out.println("\nExecuting query: " + query);
          rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          logException(e);
      }
      
        while (rset.next())
            {
              if (rset.getString("Stanowisko").equalsIgnoreCase("Manager"))
              {
                isManager = true;
              }
              else
                isManager = false;
            }
    }
    
  public ResultSet getCurrentWorker() throws SQLException {
      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          query = "SELECT * FROM Pracownik where ident = " + connHandler.getL_userid();
          System.out.println("\nExecuting query: " + query);
          rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          logException(e);
      }
      return rset;
  }
  
  public ResultSet getWorkers() throws SQLException {
      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          query = "SELECT * FROM Pracownik ORDER BY ident";
          System.out.println("\nExecuting query: " + query);
          rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          logException(e);
      }
      return rset;
  }
    
  
  public Worker findWorkerById(int id) throws SQLException {
      Worker selectedWorker = new Worker();
      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          query = "SELECT * FROM Pracownik WHERE ident = " + id;
          System.out.println("\nExecuting: " + query);
          rset = stmt.executeQuery(query);

          while (rset.next()) {
              selectedWorker.setIdent(new Integer(rset.getInt("ident")));
              selectedWorker.setPrzelozony(new Integer(rset.getInt("przelozony")));
              selectedWorker.setImie(rset.getString("imie"));
              selectedWorker.setNazwisko(rset.getString("nazwisko"));
              selectedWorker.setStanowisko(rset.getString("stanowisko"));
              selectedWorker.setPassw(rset.getString("passw"));
              selectedWorker.setPensja(rset.getString("pensja"));
          }
      } catch (SQLException e) {
          logException(e);
      } finally {
          closeAll();
      }


      return selectedWorker;

  }
  
  
      public String updateWorker(int ident, String imie,
                                 String nazwisko, String stanowisko,
                                 String pensja, String przelozony
                                 ) throws SQLException {

        Worker oldWorker = findWorkerById(ident);
        try {
            connHandler.getDBConnection();
            stmt =
connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

            StringBuffer columns = new StringBuffer(255);
            if (imie != null &&
                !imie.equals(oldWorker.getImie())) {
                columns.append("imie = '" + imie + "'");
            }
            if (nazwisko != null &&
                !nazwisko.equals(oldWorker.getNazwisko())) {
                if (columns.length() > 0) {
                    columns.append(", ");
                }
                columns.append("nazwisko = '" + nazwisko + "'");
            }
            if (stanowisko != null && !stanowisko.equals(oldWorker.getStanowisko())) {
                if (columns.length() > 0) {
                    columns.append(", ");
                }
                columns.append("stanowisko = '" + stanowisko + "'");
            }
            if (pensja != null &&
                !pensja.equals(oldWorker.getPensja ())) {
                if (columns.length() > 0) {
                    columns.append(", ");
                }
                columns.append("pensja = '" + pensja + "'");
            }
            if (przelozony != null &&
                 !pensja.equals(oldWorker.getPensja ())) {
                if (columns.length() > 0) {
                    columns.append(", ");
                }
                columns.append("przelozony  = '" + przelozony  + "'");
            }
           
            if (columns.length() > 0) {
                sqlString =
                        "UPDATE Pracownik SET " + columns.toString() + " WHERE ident = " +
                        ident;
                System.out.println("\nExecuting: " + sqlString);
                stmt.execute(sqlString);
            } else {
                System.out.println("Nothing to do to update Pracownik Id: " +
                                   ident);
            }
            return "success";
        } catch (SQLException e) {
            logException(e);
            return "failure";
        } finally {
            closeAll();
        }
    }

  public ResultSet getManagers() throws SQLException {
      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          query = "SELECT * FROM Pracownik WHERE stanowisko = 'Manager'";
          System.out.println("\nExecuting query: " + query);
          rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          logException(e);
      }
      return rset;
  }
  
   
     public String addWorker(String imie, String nazwisko,
                              String stanowisko, String passw, String przelozony,
                              String pensja) throws SQLException {

        try {
            connHandler.getDBConnection();
            stmt =
connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          System.out.println("\nPrzelozony: " + przelozony);
            if (przelozony.equalsIgnoreCase("null"))
              sqlString =
                      "INSERT INTO Pracownik VALUES (PRACOWNIK_SEQ.nextval, null, '" + imie + "','" + nazwisko + "','" +
                      stanowisko + "','" +  passw + "', " +
                      pensja + ")";
            else
              sqlString =
                      "INSERT INTO Pracownik VALUES (PRACOWNIK_SEQ.nextval, '" +
                      przelozony + "','" + imie + "','" + nazwisko + "','" +
                      stanowisko + "','" +  passw + "', " +
                      pensja + ")";
            System.out.println("\nInserting: " + sqlString);
            stmt.execute(sqlString);
            return "success";
        } catch (SQLException e) {
            logException(e);
            return "failure";
        } finally {
            closeAll();
        }


    }
  public void logException(SQLException ex) {
      while (ex != null) {
          ex.printStackTrace();
          ex = ex.getNextException();
      }
  }
  
  public void setConnHandler(ConnectionHandler connHandler) {
      this.connHandler = connHandler;
  }

    public boolean getManager() {
        return isManager;
    }
    
  public boolean setWorkerPass(String oldpass, String newpass) 
    throws SQLException {

      try {
          connHandler.getDBConnection();
          stmt = connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          sqlString = "SELECT passw FROM Pracownik" +
                      " WHERE  ident = " + connHandler.l_userid;
          System.out.println("\nselect: " + sqlString);
          rset = stmt.executeQuery(sqlString);
          rset.next();
          String old = rset.getString("passw");
          System.out.println(old);
          if(!old.equals(oldpass))
              return false;
          
          sqlString = "UPDATE Pracownik SET passw = '" + newpass + 
              "' WHERE  ident = " + connHandler.l_userid;
          System.out.println("\nupdating: " + sqlString);
          stmt.execute(sqlString);

          return true;
      } catch (SQLException e) {
          logException(e);
          return false;
      } finally {
          closeAll();
      }
    }
  
  public void closeAll() {
      if (rset != null) {
          try {
              rset.close();
          } catch (Exception ex) {
          }
          rset = null;
      }
      if (stmt != null) {
          try {
              stmt.close();
          } catch (Exception ex) {
          }
          stmt = null;
      }
      if (conn != null) {
          try {
              conn.close();
          } catch (Exception ex) {
          }
          conn = null;
      }


  }
}
