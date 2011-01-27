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
     
    <jsp:useBean id="workerbean" class="bank.WorkerBean" scope="session"/>
     
    <% workerbean.setConnHandler(connbean); %>
    
<%
int client_id = new Integer( request.getParameter("clientid"));
String uslugaRachunek_nazwa = request.getParameter("uslugaRachunek_nazwa");
Double wplata = new Double (request.getParameter("wplata"));
String numer = request.getParameter("numer");
 
workerbean.addRachunek(client_id, uslugaRachunek_nazwa, wplata, numer);

pageContext.forward("worker_cl_see.jsp?clientid=" + client_id);

%>
  </body>
</html>