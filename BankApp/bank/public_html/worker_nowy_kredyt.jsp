<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"
         import="java.sql.ResultSet"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>nowa_lokata</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">Serwsis transakcyjny ZlotoBanku.</h2><h3>Nowy kredyt.</h3>
     
    <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
     
    <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
     
    <% clientbean.setConnHandler(connbean); %>
     
    <%ResultSet rset; 
      rset = clientbean.getUslugaKredyt();
      ResultSet rset2; 
      int client_id = new Integer(request.getParameter("clientid"));
      rset2 = clientbean.getRachunkiCursor(client_id);%>
   <form action="worker_nowy_kredyt_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%">Rodzaj kredytu</td>
          <td width="50%">
           <% out.println("<input type=\"hidden\" name=\"clientid\""+
                            "value=\"" +   client_id + "\"/>");%>
          
          <select size="1" name="UslugaKredyt_id">
              <%while (rset.next ())
   {
    out.println("<option value=" + rset.getString("ident") + ">" + 
    rset.getString("NAZWA") + ": oprocentowanie " + rset.getString("oprocentowanie") + "</option> "  );
   }
  
%>
            </select>
          </td>
        </tr><tr>
          <td width="50%">Suma</td>
          <td width="50%">
            <input type="text" name="wplata"/>
          </td>
        </tr><tr>
          <td width="50%">na rachunek</td>
          <td width="50%">
            <select size="1" name="rachunek_numer">
             <%while (rset2.next ())
   {
    out.println("<option value=" + rset2.getString("numer") + ">" + 
    "numer: " + rset2.getString("numer") + " srodki: " + rset2.getString("srodki") + " typ: " + rset2.getString("UslugaRachunek_nazwa") + "</option> "  );
   }
   
  clientbean.closeAll();
%>
            </select>
          </td>
        </tr>
      </table>
      <input type="submit" value="Zaciagnij kredyt"/>
    </form>
  </body>
</html>