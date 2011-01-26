<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>client_login_action</title>
  </head>
  <body>
    <%@ page import="java.sql.ResultSet"%>
    <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
    <%boolean userIsValid = false;
      String host = request.getParameter("host");
      String userid = request.getParameter("userid");
      String password = request.getParameter("password");
      String jdbcUrl = "jdbc:oracle:thin:@" + host;
      userIsValid = connbean.authenticateUser(jdbcUrl, userid, password, session);%>
      <%if (userIsValid){
    %>
        <jsp:forward page="/client_start.jsp"/>
      <%} else {
%>  
        <jsp:forward page="/client_login.jsp"/>
      <%}%>
  </body>
</html>