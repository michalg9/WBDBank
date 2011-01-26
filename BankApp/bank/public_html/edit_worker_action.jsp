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
      <jsp:useBean id="workerbean" class="bank.WorkerBean" scope="session"/>
      <% workerbean.setConnHandler(connbean); %>
      <%Integer worker_id = new Integer(request.getParameter("worker_id"));
String imie = request.getParameter("imie");
String nazwisko = request.getParameter("nazwisko");
String stanowisko = request.getParameter("stanowisko");
String pensja = request.getParameter("pensja");
String przelozony = request.getParameter("przelozony");
workerbean.updateWorker(worker_id.intValue(), imie, nazwisko, stanowisko, pensja, przelozony);

%>
<jsp:forward page="worker_info.jsp"/>
  </body>
</html>