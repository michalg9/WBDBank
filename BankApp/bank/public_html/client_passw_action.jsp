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

String old = request.getParameter("old");
String nu = request.getParameter("new");
String repeat = request.getParameter("repeat");

if(!nu.equals(repeat)){%>
<jsp:forward page="client_passw.jsp">
  <jsp:param name="message" value="Hasla nie pasuja do siebie" />
</jsp:forward>
<%}

if(clientbean.setClientPass(old, nu)){%>
<jsp:forward page="client_passw.jsp">
   <jsp:param name="message" value="Haslo zostalo zmienione" />
</jsp:forward>
<%}
else{
%>
<jsp:forward page="client_passw.jsp">
   <jsp:param name="message" value="Niepoprawne haslo" />
</jsp:forward>
<%};%>
  </body>
</html>