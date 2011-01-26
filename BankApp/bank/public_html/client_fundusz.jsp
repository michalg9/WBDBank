<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"
         import="java.sql.ResultSet"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>client_lokata</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">Serwsis transakcyjny ZlotoBanku.</h2><h3>Kredyty Klienta.</h3>
     
    <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
     
    <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
     
    <% clientbean.setConnHandler(connbean); %>
     
    <%ResultSet rset; 
      rset = clientbean.getFundusze(); %>
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <th>
          <h4>Nazwa funduszu</h4>
        </th>
        <th>
          <h4>Poczatek</h4>
        </th>
        <th>
          <h4>Koniec</h4>
        </th>
        <th>
          <h4>Data wplaty</h4>
        </th>
        <th>
          <h4>Suma</h4>
        </th>
        <th>
          <h4>Prognozowane oprocent.</h4>
        </th>
        <th>
          <h4>Opis</h4>
        </th>
      </tr>
      <%
    while (rset.next ())
    {
    out.println("<tr>");
      out.println("<td>" + 
      rset.getString("NAZWA") + "</td><td> " + 
      rset.getString("POCZATEK") + "</td><td> " + 
      rset.getString("KONIEC") + "</td><td>" + 
      rset.getString("ZALOZONA") + "</td><td>" + 
      rset.getString("WPLATA") + "</td><td>" +
      rset.getString("PROGNOZA") + "</td><td>" + 
      rset.getString("OPIS") + 
      "</td>"
       );
    out.println("</tr>");
    }

    %>
    </table><br/>
    <a href="nowy_fundusz.jsp" target="MainFrame">Zapisz się na fundusz inwestycyjny</a><br/>
  </body>
</html>