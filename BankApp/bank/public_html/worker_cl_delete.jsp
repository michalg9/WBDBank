<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>delete_action</title>
  </head>
  <body>
      <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="workerbean" class="bank.WorkerBean" scope="session"/>
      <% workerbean.setConnHandler(connbean); %>
    <%Integer client_id =  new Integer(request.getParameter("clientid"));
  workerbean.deleteClientById(client_id.intValue());
  
%>
<jsp:forward page="worker_cl_info.jsp"/>
  </body>
</html>