<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"
         import="java.sql.ResultSet"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>client_info</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">Serwsis transakcyjny ZlotoBanku.</h2><h3>Informacje o kliencie.</h3>
     <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="workerbean" class="bank.WorkerBean" scope="session"/>
      <% workerbean.setConnHandler(connbean); %>
      
       <form action="worker_cl_info.jsp">
      <h4>Filtruj klienta po:</h4>
      Nazwa: <input type="text" name="fnazwa"/><br />
      Miejscowosc: <input type="text" name="fmiejscowosc"/><br />
      Kod pocztowy: <input type="text" name="fkodpoczt"/><br />
      Adres: <input type="text" name="fadres"/><br />
      <input type="submit" value="Filter"/><br />
    </form>
    <%ResultSet rset; 
    String nazwa = request.getParameter("fnazwa"); 
    String miejscowosc = request.getParameter("fmiejscowosc"); 
    String kodpoczt = request.getParameter("fkodpoczt"); 
    String adres = request.getParameter("fadres"); 
    if (nazwa == null && miejscowosc == null && kodpoczt == null && adres == null)  
      rset = workerbean.getAllClients();
    else   
      rset = workerbean.getClientsByName(nazwa, miejscowosc, kodpoczt, adres); 
      %>
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <th>
          <h4>
            Id
          </h4>
        </th>
        <th>
          <h4>Nazwa</h4>
        </th>
        <th>
          <h4>Miejscowosc</h4>
        </th>
        <th>
          <h4>Kod pocztowy</h4>
        </th>
        <th>
          <h4>Adres</h4>
        </th>
        <th>
          <h4>Typ</h4>
        </th>
        <th>
          <h4>Info</h4>
        </th>
        <th>
          &nbsp;
        </th>
      </tr>

    <%
    while (rset.next ())
    {
    out.println("<tr>");
      out.println("<td>" + 
      rset.getInt("ident") + "</td><td> " + 
      rset.getString("nazwa") + "</td><td> " + 
      rset.getString("miejscowosc") + "</td><td> " + 
      rset.getString("kodpoczt") + "</td><td>" + 
      rset.getString("adres") + "</td><td>" + 
      rset.getString("typ") + "</td><td>" + 
      rset.getString("info") + 
      "</td><td> <a href=\"worker_cl_see.jsp?clientid=" + rset.getInt(1) +
      "\">Wybierz</a><br>" + 
      "<a href=\"worker_cl_edit.jsp?clientid=" + rset.getInt(1) +
      "\">Edytuj dane</a><br>" + 
      "<a href=\"client_passw.jsp?message=\"\">Zmiana hasla</a></td>");
    out.println("</tr>");
    }

    %>
    
    </table>
    
    
        <% 
        out.println("<a href=\"worker_cl_add.jsp\">Dodaj klienta</a>");
            %>
      
  </body>
</html>