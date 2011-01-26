package bank;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;

import javax.servlet.http.HttpSession;

import oracle.jdbc.pool.OracleDataSource;

public class ConnectionHandler {
    public ConnectionHandler() {
    }

    //  String jdbcUrl = null;
    //  String userid = null;
    //  String password = null;

    //String jdbcUrl = "jdbc:oracle:thin:dbuser/dbuser@localhost:1521/XE";
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521/XE";
    String userid = "dbuser";
    String password = "dbuser";

    String l_userid;
    String l_password;

    Connection conn;

    public void getDBConnection() throws SQLException {
        if(conn == null)
        {
          OracleDataSource ds;
          ds = new OracleDataSource();
          ds.setURL(jdbcUrl);
          conn = ds.getConnection(userid, password);
        }
        else
          System.out.println("\nPolaczenie z baza juz istnieje.");
    }

    public boolean authenticateUser(String jdbcUrl, String l_userid,
                                    String l_password,
                                    HttpSession session) throws SQLException {
        this.jdbcUrl = jdbcUrl;
        this.l_userid = l_userid;
        this.l_password = l_password;
        try {
            OracleDataSource ds;
            ds = new OracleDataSource();
            ds.setURL(jdbcUrl);
            conn = ds.getConnection(userid, password);
          System.out.println("Autentykacja:" + l_userid + "--" + l_password);
            if (checkClient(l_userid, l_password))
                return true;
            else {
                System.out.println("Invalid user credentials");
                session.setAttribute("loginerrormsg",
                                     "Invalid Login. Try Again...");
                this.jdbcUrl = null;
                this.l_userid = null;
                this.l_password = null;
                return false;
            }
        } catch (SQLException ex) {
            System.out.println("wyjatek przy logowaniu");
            System.out.println("Invalid user credentials");
            session.setAttribute("loginerrormsg",
                                 "Invalid Login. Try Again...");
            this.jdbcUrl = null;
            this.l_userid = null;
            this.l_password = null;
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ex) {
                  System.out.println("wyjatek przy zamykaniu conn w autentykacji");
                }
                conn = null;
            }
        }
    }

  public boolean authenticateWorker(String jdbcUrl, String l_userid,
                                  String l_password,
                                  HttpSession session) throws SQLException {
      this.jdbcUrl = jdbcUrl;
      this.l_userid = l_userid;
      this.l_password = l_password;
      try {
          OracleDataSource ds;
          ds = new OracleDataSource();
          ds.setURL(jdbcUrl);
          conn = ds.getConnection(userid, password);
        System.out.println("Autentykacja pracownika:" + l_userid + "--" + l_password);
          if (checkWorker(l_userid, l_password))
              return true;
          else {
              System.out.println("Invalid user credentials");
              session.setAttribute("loginerrormsg",
                                   "Invalid Login. Try Again...");
              this.jdbcUrl = null;
              this.l_userid = null;
              this.l_password = null;
              return false;
          }
      } catch (SQLException ex) {
          System.out.println("wyjatek przy logowaniu");
          System.out.println("Invalid user credentials");
          session.setAttribute("loginerrormsg",
                               "Invalid Login. Try Again...");
          this.jdbcUrl = null;
          this.l_userid = null;
          this.l_password = null;
          return false;
      } finally {
          if (conn != null) {
              try {
                  conn.close();
              } catch (Exception ex) {
                System.out.println("wyjatek przy zamykaniu conn w autentykacji");
              }
              conn = null;
          }
      }
  }
    public boolean checkClient(String l_userid,
                            String l_password) throws SQLException {

        try {
            //getDBConnection();
            Statement stmt =
                conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                     ResultSet.CONCUR_READ_ONLY);
            String query =
                "SELECT passw FROM Klient WHERE ident = " + l_userid;

            System.out.println("\nExecuting query: " + query);
            ResultSet rset = stmt.executeQuery(query);

            rset.absolute(1);
            System.out.println(rset.getString("passw") + "..." + l_password);
            if (l_password.contentEquals(rset.getString("passw"))) {
                return true;
            } else {
                System.out.println("\nBlad logowania");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("\nWyjatek");
            return false;
        }
    }

  public boolean checkWorker(String l_userid,
                          String l_password) throws SQLException {

      try {
          //getDBConnection();
          Statement stmt =
              conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                   ResultSet.CONCUR_READ_ONLY);
          String query =
              "SELECT passw FROM Pracownik WHERE ident = " + l_userid;

          System.out.println("\nExecuting query: " + query);
          ResultSet rset = stmt.executeQuery(query);

          rset.absolute(1);
          System.out.println(rset.getString("passw") + "..." + l_password);
          if (l_password.contentEquals(rset.getString("passw"))) {
              return true;
          } else {
              System.out.println("\nBlad logowania");
              return false;
          }
      } catch (SQLException e) {
          System.out.println("\nWyjatek");
          return false;
      }
  }
    public void setJdbcUrl(String jdbcUrl) {
        this.jdbcUrl = jdbcUrl;
    }

    public String getJdbcUrl() {
        return jdbcUrl;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUserid() {
        return userid;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public String getL_userid() {
        return l_userid;
    }
}
