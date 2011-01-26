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
     
    <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
     
    <% clientbean.setConnHandler(connbean); %>
    
<%
String inwestycja_nazwa = request.getParameter("inwestycja_nazwa");
Double wplata = new Double (request.getParameter("wplata"));
String rachunek_numer = request.getParameter("rachunek_numer");

clientbean.addFundusz(inwestycja_nazwa, wplata, rachunek_numer);

%><jsp:forward page="client_fundusz.jsp"/>
  </body>
</html>