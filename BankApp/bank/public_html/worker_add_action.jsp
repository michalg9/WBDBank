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
      
      <%String imie = request.getParameter("imie");
String nazwisko = request.getParameter("nazwisko");
String stanowisko = request.getParameter("stanowisko");
String passw = request.getParameter("passw");
String przelozony = request.getParameter("przelozony");
String pensja = request.getParameter("pensja");
 
workerbean.addWorker(imie, nazwisko, stanowisko, passw, przelozony, pensja);

%><jsp:forward page="worker_info.jsp"/>
  </body>
</html>