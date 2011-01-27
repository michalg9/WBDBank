<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>update_action</title>
  </head>
  <body>
    <%@ page import="java.sql.ResultSet"%>
       <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
      <% clientbean.setConnHandler(connbean); %>
      <%Integer client_id = new Integer(request.getParameter("client_id"));
String nazwa = request.getParameter("nazwa");
String miejscowosc = request.getParameter("miejscowosc");
String kodpoczt = request.getParameter("kodpoczt");
String adres = request.getParameter("adres");
String typ = request.getParameter("typ");
String info = request.getParameter("info");
clientbean.updateClient(client_id.intValue(), nazwa, miejscowosc, kodpoczt, adres, typ, info );

%>
<jsp:forward page="worker_cl_info.jsp"/>
  </body>
</html>