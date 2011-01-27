<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>edit_client</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">
      Serwsis transakcyjny ZlotoBanku.
    </h2><h3>
      Modyfikuj swoje dane.
    </h3>     
      <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
      <% clientbean.setConnHandler(connbean); %>
      <jsp:useBean id="client" class="bank.Client"/>
      <%Integer client_id = new Integer(request.getParameter("clientid"));
client = clientbean.findClientById(client_id.intValue());%><form action="worker_cl_edit_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%">Nazwa</td>
          <td width="50%">
            <input type="hidden" name="client_id"
                   value="<%= client.getIdent() %>"/>
                   <input type="text" name="nazwa" value="<%= client.getNazwa() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Miejscowosc</td>
          <td width="50%">
            <input type="text" name="miejscowosc"
                   value="<%= client.getMiejscowosc() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Kod Pocztowy</td>
          <td width="50%">
            <input type="text" name="kodpoczt" value="<%= client.getKodPoczt() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Adres</td>
          <td width="50%">
            <input type="text" name="adres"
                   value="<%= client.getAdres() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Typ</td>
          <td width="50%">
            <input type="text" name="typ"
                   value="<%= client.getTyp() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Info</td>
          <td width="50%">
            <input type="text" name="info"
                   value="<%= client.getInfo() %>"/>
          </td>
        </tr>
      </table>
      <input type="submit" value="Update"/>
    </form>
  </body>
</html>