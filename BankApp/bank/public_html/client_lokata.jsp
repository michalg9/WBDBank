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
    <h2 align="center">Serwsis transakcyjny ZlotoBanku.</h2><h3>Rachunki Klienta.</h3>
     
    <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
     
    <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
     
    <% clientbean.setConnHandler(connbean); %>
     
    <%ResultSet rset; 
      rset = clientbean.getLokaty(); %>
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <th>
          <h4>Id</h4>
        </th>
        <th>
          <h4>Nazwa lokaty</h4>
        </th>
        <th>
          <h4>Data otwarcia</h4>
        </th>
        <th>
          <h4>Srodki</h4>
        </th>
        <th>
          <h4>Okres</h4>
        </th>
        <th>
          <h4>Oprocentowanie</h4>
        </th>
        <th>
          <h4>Opis</h4>
        </th>
        <th>
          <h4>Akcje</h4>
        </th>
      </tr>
       
      <%
    while (rset.next ())
    {
    out.println("<tr>");
      out.println("<td>" + 
      rset.getString("ident") + "</td><td> " + 
      rset.getString("USLUGALOKATA_NAZWA") + "</td><td> " + 
      rset.getString("OTWARTA") + "</td><td> " + 
      rset.getString("WPLATA") + "</td><td>" + 
      rset.getString("OKRES") + "</td><td>" + 
      rset.getString("OPROCENTOWANIE") + "</td><td>" + 
      rset.getString("OPIS") + 
      "</td><td>" +
      "<a href=\"zerwij_lokate.jsp?ident=" + rset.getString("ident") + "\">Zerwij</a><br/>"
       );
    out.println("</tr>");
    }

    %>
    </table>
    <a href="nowa_lokata.jsp" target="MainFrame">Nowa lokata</a><br/>
  </body>
</html>