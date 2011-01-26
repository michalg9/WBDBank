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
    <h2 align="center">Serwsis transakcyjny ZlotoBanku.</h2><h3>Informacje o pracownikach.</h3>
     <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="workerbean" scope="session" class="bank.WorkerBean"/>
      <% workerbean.setConnHandler(connbean); %>
      <% workerbean.setFunction(); %>
     <%ResultSet rset; 
      rset = workerbean.getWorkers(); %>
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <th>
          <h4>
            Id
          </h4>
        </th>
        <th>
          <h4>Przelozony</h4>
        </th>
        <th>
          <h4>Imie</h4>
        </th>
        <th>
          <h4>Nazwisko</h4>
        </th>
        <th>
          <h4>Stanowisko</h4>
        </th>
        <% if (workerbean.getManager())
        out.println("<th> <h4>Pensja</h4> </th>"); %>
        <th>
          &nbsp;
        </th>
      </tr>

    <%
    
    int userId = new Integer(connbean.getL_userid());
    while (rset.next ())
    {
     if (rset.getInt("ident") == userId)
      out.println("<tr BGCOLOR=#F1EEB1>");
    else
      out.println("<tr>");
      
      out.println("<td>" + 
      rset.getInt("ident") + "</td><td> " + 
      rset.getString("przelozony") + "</td><td> " + 
      rset.getString("imie") + "</td><td> " + 
      rset.getString("nazwisko") + "</td><td>" + 
      rset.getString("stanowisko") );
      if (workerbean.getManager())
      {
        out.println("</td><td>" + rset.getString("Pensja"));   
      out.println("</td><td> <a href=\"edit_worker.jsp?workerid=" + rset.getInt(1) +
      "\">Edit</a><br>"); 
        if (rset.getInt("ident") == userId)
          out.println("<a href=\"worker_passw.jsp?message=\"\">Zmiana hasla</a>");
      } 
      else if (rset.getInt("ident") == userId)
      {
        out.println("&nbsp;"); 
      out.println("</td><td> <a href=\"worker_passw.jsp?message=\"\">Zmiana hasla</a>");
      }
      else
        out.println("</td><td>&nbsp;");
        
    out.println("</td></tr>");
    } 
    %>
    
    </table>
    <% 
     if (workerbean.getManager())
      {
        out.println("<a href=\"worker_add.jsp\">Dodaj pracownika</a>");
      }
      %>
  </body>
</html>