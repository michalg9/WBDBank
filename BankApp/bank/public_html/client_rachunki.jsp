<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"
         import="java.sql.ResultSet"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>client_rachunki</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">Serwsis transakcyjny ZlotoBanku.</h2><h3>Rachunki Klienta.</h3>
     
    <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
     
    <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
     
    <% clientbean.setConnHandler(connbean); %>
     
    <%ResultSet rset; 
      rset = clientbean.getRachunki(); %>
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <th>
          <h4>Numer</h4>
        </th>
        <th>
          <h4>Usluga</h4>
        </th>
        <th>
          <h4>
            Wlasciciel
          </h4>
        </th>
        <th>
          <h4>
            Srodki
          </h4>
        </th>
        <th>
          <h4>
            Data otwarcia
          </h4>
        </th>
        <th>
          Akcje
        </th>
      </tr>
       
      <%
    while (rset.next ())
    {
    out.println("<tr>");
      out.println("<td>" + 
      rset.getString("numer") + "</td><td> " + 
      rset.getString("USLUGARACHUNEK_NAZWA") + "</td><td> " + 
      rset.getInt("KLIENT_IDENT") + "</td><td> " + 
      rset.getString("srodki") + "</td><td>" + 
      rset.getString("otwarty") + 
      "</td><td>" +
      "<a href=\"rachunek_historia.jsp?numer=" + rset.getString("numer") + "\">Historia</a><br/>" +
       "<a href=\"przelew.jsp?clientid=" + rset.getInt("KLIENT_IDENT") + "&numer=" + rset.getString("numer") + "\">Wykonaj przelew</a><br/>"
      );
    out.println("</tr>");
    }

    %>
    </table>
  </body>
</html>