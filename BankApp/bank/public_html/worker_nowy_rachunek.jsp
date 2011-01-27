<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"
         import="java.sql.ResultSet"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>nowy_rachunek</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">Serwsis transakcyjny ZlotoBanku.</h2><h3>Nowa lokata.</h3>
     
    <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
     
    <jsp:useBean id="workerbean" class="bank.WorkerBean" scope="session"/>
     
    <% workerbean.setConnHandler(connbean); %>
     
    <%ResultSet rset; 
      rset = workerbean.getUslugaRachunek();
      ResultSet rset2; 
      int client_id = new Integer(request.getParameter("clientid"));
%>
   <form action="worker_nowy_rachunek_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%">Typ rachunku</td>
          <td width="50%">
          
          <% out.println("<input type=\"hidden\" name=\"clientid\""+
                            "value=\"" +   client_id + "\"/>");%>
           <select size="1" name="uslugaRachunek_nazwa">
              <%while (rset.next ())
   {
    out.println("<option value=" + rset.getString("NAZWA") + ">" + 
    rset.getString("NAZWA") + ": oprocentowanie " + rset.getString("OPROCENTOWANIE") + "</option> "  );
   }
  
%>
            </select>
          </td>
        </tr><tr>
          <td width="50%">Wplata</td>
          <td width="50%">
            <input type="text" name="wplata"/>
          </td>
        </tr><tr>
          <td width="50%">Numer nowego rachunku</td>
          <td width="50%">
           <input type="text" name="numer" size="30"/>

            </select>
          </td>
        </tr>
      </table>
      <input type="submit" value="Dodaj rachunek"/>
    </form>
  </body>
</html>