<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>login</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">
      Serwsis transakcyjny ZlotoBanku.
    </h2><h3>
      Zmiana hasla
    </h3>
    <form action="worker_passw_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%">Stare haslo:</td>
          <td width="50%">
            <input type="text" name="old"/>
          </td>
        </tr><tr>
          <td width="50%">Nowe haslo:</td>
          <td width="50%">
            <input type="text" name="new"/>
          </td>
        </tr><tr>
          <td width="50%">Powtorz haslo:</td>
          <td width="50%">
            <input type="text" name="repeat"/>
          </td>
        </tr>
      </table>
      <input type="submit" value="Zmien"/>
    </form>
    <%= request.getParameter("message") %>
  </body>
</html>