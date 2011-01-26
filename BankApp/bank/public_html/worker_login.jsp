<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>worket_login</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">
      Serwsis transakcyjny ZlotoBanku.
    </h2><h3>
      Panel administracyjny
    </h3><%String loginerrormsg = null;
    loginerrormsg = (String) session.getAttribute("loginerrormsg");
    if (loginerrormsg != null) {
%>
    <h4>
      <%=loginerrormsg%>
    </h4>
    <%
    }
    %><form action="worker_login_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%">User ID:</td>
          <td width="50%">
            <input type="text" name="userid"/>
          </td>
        </tr><tr>
          <td width="50%">Password:</td>
          <td width="50%">
            <input type="text" name="password"/>
          </td>
        </tr><tr>
          <td width="50%">Host:</td>
          <td width="50%">
            <input type="text" name="host"/>
          </td>
        </tr>
      </table>
      <input type="submit" value="Submit"/>
    </form>
  </body>
</html>