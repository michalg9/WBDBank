package bank;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;


import java.sql.Statement;
import java.sql.ResultSet;

import java.text.DecimalFormat;

import java.text.DecimalFormatSymbols;

import oracle.jdbc.OracleTypes;


public class ClientBean {

    public ClientBean() {
      ConnectionHandler connHandler = new ConnectionHandler();
      
      Connection conn = connHandler.conn;
    }

    //    String jdbcUrl = "jdbc:oracle:thin:hr/hr@localhost:1521/XE";
    //    String userid = "hr";
    //    String password = "hr";

  ConnectionHandler connHandler;
  Connection conn;
  
    Statement stmt;
    ResultSet rset;
    String query;
    String sqlString;


    public ResultSet getClient() throws SQLException {
        try {
            connHandler.getDBConnection();
            stmt =
connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            query = "SELECT * FROM Klient WHERE  ident = " + connHandler.l_userid;
            System.out.println("\nExecuting query: " + query);
            rset = stmt.executeQuery(query);
        } catch (SQLException e) {
            logException(e);
        }
        return rset;
    }
    
  public ResultSet getLokaty() throws SQLException {
      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          query = "SELECT l.ident, l.uslugalokata_nazwa, l.otwarta, l.wplata, ul.okres, ul.oprocentowanie, ul.opis " +
              "FROM Lokata l, UslugaLokata ul " +
              "WHERE  l.uslugalokata_nazwa = ul.nazwa AND " +
              "l.KLIENT_IDENT = " + connHandler.l_userid;
          
          System.out.println("\nExecuting query: " + query);
          rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          logException(e);
      }
      return rset;
  }
  
  public ResultSet getKredyty() throws SQLException {
      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          query = "SELECT uk.nazwa, k.udzielony, k.suma, " +
                  "uk.oprocentowanie, uk.okres, k.splacone, uk.opis " +
              "FROM Kredyt k, UslugaKredyt uk " +
              "WHERE  k.uslugakredyt_ident = uk.ident AND " +
              "k.KLIENT_IDENT = " + connHandler.l_userid;
          
          System.out.println("\nExecuting query: " + query);
          rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          logException(e);
      }
      return rset;
  }

  public ResultSet getFundusze() throws SQLException {
      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          query = "SELECT i.nazwa, i.prognoza, i.poczatek, i.koniec, i.opis, " +
                  "f.wplata, f.zalozona " +
              "FROM Fundusz f, Inwestycja i " +
              "WHERE  f.inwestycja_nazwa = i.nazwa AND " +
              "f.KLIENT_IDENT = " + connHandler.l_userid;
          
          System.out.println("\nExecuting query: " + query);
          rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          logException(e);
      }
      return rset;
  }
    public ResultSet getLokataById(int ident) throws SQLException {
        try {
            connHandler.getDBConnection();
            stmt =
connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
//            query =
//                    "SELECT * FROM Lokata WHERE ident = " + ident;
          query = "SELECT l.ident, l.uslugalokata_nazwa, l.otwarta, l.wplata, ul.okres, ul.oprocentowanie, ul.opis " +
              "FROM Lokata l, UslugaLokata ul " +
              "WHERE  l.uslugalokata_nazwa = ul.nazwa AND " +
              "l.ident = " + ident;
            System.out.println("\nExecuting query: " + query);
            rset = stmt.executeQuery(query);
        } catch (SQLException e) {
            logException(e);
        }
        return rset;

    }

  public ResultSet getHistoria(String numer) throws SQLException {
      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          query =
                  "SELECT * FROM Transakcja WHERE Rachunek_numer = '" + numer +
                  "' ORDER BY wykonana";

          System.out.println("\nExecuting query: " + query);
          rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          logException(e);
      }
      return rset;

  }

    public Client findClientById(int id) throws SQLException {
        Client selectedClient = new Client();
        try {
            connHandler.getDBConnection();
            stmt =
connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            query = "SELECT * FROM Klient WHERE ident = " + id;
            System.out.println("\nExecuting: " + query);
            rset = stmt.executeQuery(query);

            while (rset.next()) {
                selectedClient.setIdent(new Integer(rset.getInt("ident")));
                selectedClient.setNazwa(rset.getString("nazwa"));
                selectedClient.setMiejscowosc(rset.getString("miejscowosc"));
                selectedClient.setKodPoczt(rset.getString("kodpoczt"));
                selectedClient.setAdres(rset.getString("adres"));
                selectedClient.setTyp(rset.getString("typ"));
                selectedClient.setInfo(rset.getString("info"));
            }
        } catch (SQLException e) {
            logException(e);
        } finally {
            closeAll();
        }


        return selectedClient;

    }

    public String updateClient(int ident, String nazwa,
                                 String miejscowosc, String kodpoczt,
                                 String adres, String typ,
                                 String info) throws SQLException {

        Client oldClient = findClientById(ident);
        try {
            connHandler.getDBConnection();
            stmt =
connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

            StringBuffer columns = new StringBuffer(255);
            if (nazwa != null &&
                !nazwa.equals(oldClient.getNazwa())) {
                columns.append("nazwa = '" + nazwa + "'");
            }
            if (miejscowosc != null &&
                !miejscowosc.equals(oldClient.getMiejscowosc())) {
                if (columns.length() > 0) {
                    columns.append(", ");
                }
                columns.append("miejscowosc = '" + miejscowosc + "'");
            }
            if (kodpoczt != null && !kodpoczt.equals(oldClient.getKodPoczt())) {
                if (columns.length() > 0) {
                    columns.append(", ");
                }
                columns.append("kodPoczt = '" + kodpoczt + "'");
            }
            if (adres != null &&
                !adres.equals(oldClient.getAdres())) {
                if (columns.length() > 0) {
                    columns.append(", ");
                }
                columns.append("adres = '" + adres + "'");
            }
            if (typ != null &&
                !typ.equals(oldClient.getTyp())) {
                if (columns.length() > 0) {
                    columns.append(", ");
                }
                columns.append("typ = '" + typ + "'");
            }
            if (info != null && !info.equals(oldClient.getInfo())) {
                if (columns.length() > 0) {
                    columns.append(", ");
                }
                columns.append("info = '" + info + "'");
            }

            if (columns.length() > 0) {
                sqlString =
                        "UPDATE Klient SET " + columns.toString() + " WHERE ident = " +
                        ident;
                System.out.println("\nExecuting: " + sqlString);
                stmt.execute(sqlString);
            } else {
                System.out.println("Nothing to do to update Klient Id: " +
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

    public String addLokata(String uslugaLokata_nazwa, double wplata, String rachunek_numer) 
      throws SQLException {

        try {
            connHandler.getDBConnection();
            stmt =
connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            sqlString =
                    "INSERT INTO Lokata VALUES (LOKATA_SEQ.nextval, " +
                    connHandler.getL_userid() + ",'" + uslugaLokata_nazwa + "', CURRENT_DATE, " + wplata + ")";
            System.out.println("\nInserting: " + sqlString);
            stmt.execute(sqlString);
            
            
          DecimalFormat df = new DecimalFormat();
          DecimalFormatSymbols dfs = df.getDecimalFormatSymbols();
          // make sure it's a '.'
          dfs.setDecimalSeparator(',');
          df.setDecimalFormatSymbols(dfs);
          sqlString =
                  "INSERT INTO Transakcja VALUES (TRANSAKCJA_SEQ.nextval, '" +  rachunek_numer + "', " + wplata + ",'" + "out" + "', 'brak','" + 
                  "Lokata nr ' || LOKATA_SEQ.currval , 'brak', 'brak', 'brak' , CURRENT_DATE)";
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

  public String addFundusz(String inwestycja_nazwa, double wplata, String rachunek_numer) 
    throws SQLException {

      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          sqlString =
                  "INSERT INTO Fundusz VALUES (FUNDUSZ_SEQ.nextval, '" + inwestycja_nazwa + "'," +
                  connHandler.getL_userid() + ", " + wplata + ", CURRENT_DATE)";
          System.out.println("\nInserting: " + sqlString);
          stmt.execute(sqlString);
          
          
        DecimalFormat df = new DecimalFormat();
        DecimalFormatSymbols dfs = df.getDecimalFormatSymbols();
        // make sure it's a '.'
        dfs.setDecimalSeparator(',');
        df.setDecimalFormatSymbols(dfs);
        sqlString =
                "INSERT INTO Transakcja VALUES (TRANSAKCJA_SEQ.nextval, '" +  rachunek_numer + "', " + wplata + ",'" + "out" + "', 'brak','" + 
                "Fundusz nr ' || FUNDUSZ_SEQ.currval , 'brak', 'brak', 'brak' , CURRENT_DATE)";
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

    public String deleteLokataById(int id, String rachunek_numer) throws SQLException {
        try {
          connHandler.getDBConnection();
          stmt =
          connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          sqlString =
                  "INSERT INTO Transakcja VALUES (TRANSAKCJA_SEQ.nextval, '" +  rachunek_numer + "', " + 
                  "(SELECT wplata FROM Lokata WHERE Ident = " + id + ") , 'in', 'brak','" + 
                  "Zerwanie lokaty nr " + id + "' , 'brak', 'brak', 'brak' , CURRENT_DATE)";
          System.out.println("\nInserting: " + sqlString);
          stmt.execute(sqlString);
            
          
            sqlString = "DELETE FROM Lokata WHERE ident = " + id;
            System.out.println("\nExecuting: " + sqlString);

            stmt.execute(sqlString);
            
            return "Success";
        } catch (SQLException e) {
            logException(e);
            return "failure";
        } finally {
            closeAll();
        }
    }


  public String wykonajPrzelew(String Rachunek_numer, double wartosc,   
                            String tytul, String RachunekPrzeciwst,
                            String nazwa, String adres,
                            String miejscowosc, String kodPoczt,
                            String nazwaDoc, String adresDoc,
                            String miejscowoscDoc, String kodPocztDoc
                            ) throws SQLException {

  DecimalFormat df = new DecimalFormat();
  DecimalFormatSymbols dfs = df.getDecimalFormatSymbols();
  // make sure it's a '.'
  dfs.setDecimalSeparator(',');
  df.setDecimalFormatSymbols(dfs);

  
      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement();
          sqlString =
                  "INSERT INTO Transakcja VALUES (TRANSAKCJA_SEQ.nextval, '" +
                  Rachunek_numer + "','" + df.format(wartosc) + "','" + "out" + "','" +
                  tytul + "','" + RachunekPrzeciwst + "','" + nazwaDoc + "', '" +
                  adresDoc + "','" + miejscowoscDoc + "' , CURRENT_DATE)";
          System.out.println("\nInserting: " + sqlString);
          stmt.execute(sqlString);
          
        sqlString =
                "INSERT INTO Transakcja VALUES (TRANSAKCJA_SEQ.nextval, '" +
                RachunekPrzeciwst + "','" + df.format(wartosc) + "','" + "in" + "','" +
                tytul + "','" + Rachunek_numer + "','" + nazwa + "', '" +
                adres + "','" + miejscowosc + "' , CURRENT_DATE)";
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

    //Funkcja sluzaca do wypenienia dynamicznego
    //listy z zawodami przy wstawianiu
    //nowego pracownika
    public ResultSet getUslugaLokata() throws SQLException {
        try {
            connHandler.getDBConnection();
            String lokataquery = "begin ? := get_uslugalokata; end;";
            CallableStatement callStmt = connHandler.conn.prepareCall(lokataquery);
            callStmt.registerOutParameter(1, OracleTypes.CURSOR);
            callStmt.execute();
            rset = (ResultSet)callStmt.getObject(1);
        } catch (SQLException ex) {
            logException(ex);
        }
        return rset;

    } 
    
  public ResultSet getInwestycja() throws SQLException {
      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          query = "SELECT nazwa, prognoza " +
              "FROM Inwestycja ";
          
          System.out.println("\nExecuting query: " + query);
          rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          logException(e);
      }
      return rset;
  }
    
  //Funkcja sluzaca do wypenienia dynamicznego
  //listy z zawodami przy wstawianiu
  //nowego pracownika
  public ResultSet getRachunkiCursor(int ident) throws SQLException {
      try {
          connHandler.getDBConnection();
          String lokataquery = "begin ? := get_rachunki(" + ident + "); end;";
          System.out.println(lokataquery);
          CallableStatement callStmt = connHandler.conn.prepareCall(lokataquery);
          callStmt.registerOutParameter(1, OracleTypes.CURSOR);
          callStmt.execute();
          rset = (ResultSet)callStmt.getObject(1);
      } catch (SQLException ex) {
          logException(ex);
      }
      return rset;

  } 
  
  public ResultSet getRachunki() throws SQLException {
      try {
          connHandler.getDBConnection();
          stmt =
  connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          query = "SELECT * FROM Rachunek WHERE  klient_ident = " + connHandler.l_userid;
          System.out.println("\nExecuting query: " + query);
          rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          logException(e);
      }
      return rset;
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

    public void setConnHandler(ConnectionHandler connHandler) {
        this.connHandler = connHandler;
    }

    public boolean setClientPass(String oldpass, String newpass) 
      throws SQLException {

        try {
            connHandler.getDBConnection();
            stmt = connHandler.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            sqlString = "SELECT passw FROM Klient" +
                        " WHERE  ident = " + connHandler.l_userid;
            System.out.println("\nselect: " + sqlString);
            rset = stmt.executeQuery(sqlString);
            rset.next();
            String old = rset.getString("passw");
            System.out.println(old);
            if(!old.equals(oldpass))
                return false;
            
            sqlString = "UPDATE Klient SET passw = '" + newpass + 
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
}
