<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"
         import="java.sql.ResultSet"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>rachunek_historia</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">Serwsis transakcyjny ZlotoBanku.</h2><h3>Historia rachunku.</h3>
     
    <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
     
    <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
     
    <% clientbean.setConnHandler(connbean); %>
     
     <%ResultSet rset; 
      rset = clientbean.getHistoria(request.getParameter("numer")); %>
    
   <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <th width="28">
          <h4>
            Id
          </h4>
        </th>
        <th width="98">
          <h4>
            Wartosc
          </h4>
        </th>
        <th width="92">
          <h4>
            Kierunek
          </h4>
        </th>
        <th width="55">
          <h4>
            Tytul
          </h4>
        </th>
        <th width="196">
          <h4>
            Rachunek docelowy
          </h4>
        </th>
        <th width="65">
          <h4>
            Nazwa
          </h4>
        </th>
        <th width="65">
          <h4>
            Adres
          </h4>
        </th>
        <th width="65">
          <h4>
            Miejscowosc
          </h4>
        </th>
        <th width="65">
          <h4>
            Data
          </h4>
        </th>
        <th width="65">
          <h4>
            Akcje
          </h4>
        </th>
      </tr>
       
      <%
    while (rset.next ())
    {
    out.println("<tr>");
      out.println("<td>" + 
      rset.getInt("ident") + "</td><td> " + 
      rset.getString("wartosc") + "</td><td> " + 
      rset.getString("kierunek") + "</td><td> " + 
      rset.getString("tytul") + "</td><td> " + 
      rset.getString("RachunekPrzeciwst") + "</td><td>" + 
      rset.getString("nazwa") + "</td><td>" + 
      rset.getString("adres") + "</td><td>" + 
      rset.getString("miejscowosc") + "</td><td>" + 
      rset.getString("wykonana") +
      "</td><td>" +
      "<a href=\"transakcja_potwierdzenie.jsp?numer=" + rset.getString("ident") + "\">Wydruk potwierdzenia</a><br/>"
      );
    out.println("</tr>");
    }

    %>
    </table>
  </body>
</html>