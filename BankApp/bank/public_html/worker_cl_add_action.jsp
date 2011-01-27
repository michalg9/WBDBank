<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>insert_action</title>
  </head>
  <body>
         <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="workerbean" scope="session" class="bank.WorkerBean"/>
      <% workerbean.setConnHandler(connbean); %>
      
      <%String nazwa = request.getParameter("nazwa");
String miejscowosc = request.getParameter("miejscowosc");
String kodPoczt = request.getParameter("kodPoczt");
String adres = request.getParameter("adres");
String typ = request.getParameter("typ");
String info = request.getParameter("info");
 String haslo = request.getParameter("haslo");
 
workerbean.addClient(nazwa, miejscowosc, kodPoczt, adres, typ, info, haslo);

%><jsp:forward page="worker_info.jsp"/>
  </body>
</html>