<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>insert</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">Serwsis transakcyjny ZlotoBanku.</h2><h3>Dodaj klienta banku.</h3>
     <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="workerbean" scope="session" class="bank.WorkerBean"/>
      <% workerbean.setConnHandler(connbean); %>

    <form action="worker_cl_add_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%" height="29">Nazwa</td>
          <td width="50%" height="29">
            <input type="text" name="nazwa"/>
          </td>
        </tr><tr>
          <td width="50%">Miejscowosc</t
          <td width="50%">
            <input type="text" name="miejscowosc"/>
          </td>
        </tr><tr>
          <td width="50%">Kod pocztowy</td>
          <td width="50%">
            <input type="text" name="kodPoczt"/>
          </td>
        </tr><tr>
          <td width="50%">Adres</td>
          <td width="50%">
            <input type="text" name="adres"/>
          </td>
        </tr><tr>
          <td width="50%">Typ</td>
          <td width="50%">
            <select size="1" name="typ">    
   <option value="indywidualny">indywidualny</option> 
  <option value="biznesowy">biznesowy</option> 
            </select>
          </td>
        </tr><tr>
          <td width="50%">Info</td>
          <td width="50%">
            <input type="text" name="info"/>
          </td>
        </tr><tr>
          <td width="50%">Haslo</td>
          <td width="50%">
            <input type="text" name="haslo"/>
          </td>
        </tr>
      </table>
      <input type="submit" value="Add Client"/>
    </form>
  </body>
</html>