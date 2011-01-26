<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>insert</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">Serwsis transakcyjny ZlotoBanku.</h2><h3>Dodaj pracownika.</h3>
     <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="workerbean" scope="session" class="bank.WorkerBean"/>
      <% workerbean.setConnHandler(connbean); %>

      
      <%@ page import="java.sql.ResultSet"%>
      <%ResultSet rset = workerbean.getManagers();
%>
    <form action="worker_add_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%">Imie</td>
          <td width="50%">
            <input type="text" name="imie"/>
          </td>
        </tr><tr>
          <td width="50%">Nazwiskotd>
          <td width="50%">
            <input type="text" name="nazwisko"/>
          </td>
        </tr><tr>
          <td width="50%">Stanowisko</td>
          <td width="50%">
            <select size="1" name="stanowisko">
              <option value="Manager">
                Manager
              </option>
              <option value="Pracownik">
                Pracownik
              </option>
            </select>
          </td>
        </tr><tr>
          <td width="50%">Haslo</td>
          <td width="50%">
            <input type="text" name="passw"/>
          </td>
        </tr><tr>
          <td width="50%">Przelozony</td>
          <td width="50%">
            <select size="1" name="przelozony">
              <%while (rset.next ())
   {
    out.println("<option value=" + rset.getString("ident") + ">" + 
    rset.getString("imie") + " " + rset.getString("nazwisko") + "</option> "  );
   }
   
  workerbean.closeAll();
%>
  <option value="null">Brak</option>
            </select>
          </td>
        </tr><tr>
          <td width="50%">Pensja</td>
          <td width="50%">
            <input type="text" name="pensja"/>
          </td>
        </tr>
      </table>
      <input type="submit" value="Add Employee"/>
    </form>
  </body>
</html>