<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>zerwij_lokate_action</title>
  </head>
  <body>
    <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
     
    <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
     
    <% clientbean.setConnHandler(connbean); %>
    <%Integer ident =  new Integer(request.getParameter("ident"));
    String rachunek_numer = request.getParameter("rachunek_numer");
  clientbean.deleteLokataById(ident, rachunek_numer);
%>
<jsp:forward page="client_lokata.jsp"/>
  </body>
</html>