<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>przelew</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">
      Serwsis transakcyjny ZlotoBanku.
    </h2><h3>
      Wykonaj przelew.
    </h3>     
      <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
      <% clientbean.setConnHandler(connbean); %>
      <jsp:useBean id="client" class="bank.Client"/>
       <%Integer client_id = new Integer(request.getParameter("clientid"));
          client = clientbean.findClientById(client_id.intValue());%>
      <form action="worker_przelew_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%">Rachunek wychodzacy</td>
          <td width="50%">
            <input type="hidden" name="client_id"
                   value="<%= client.getIdent() %>"
                   <input type="text" name="Rachunek_numer" readonly="readonly" value="<%= request.getParameter("numer") %>" size="35"/>
          </td>
        </tr><tr>
          <td width="50%">Nazwa</td>
          <td width="50%"> <input type="text" name="nazwa" readonly="readonly" value="<%= client.getNazwa() %>"/></td>
        </tr><tr>
          <td width="50%">Adres</td>
          <td width="50%"> <input type="text" name="adres" readonly="readonly" value="<%= client.getAdres() %>"/></td>
        </tr><tr>
          <td width="50%">Kod Pocztowy</td>
          <td width="50%"> <input type="text" name="kodPoczt" readonly="readonly" value="<%= client.getKodPoczt() %>"/></td>
        </tr><tr>
          <td width="50%">Miejscowosc</td>
          <td width="50%"> <input type="text" name="miejscowosc" readonly="readonly" value="<%= client.getMiejscowosc() %>"/></td>
        </tr><tr>
          <td width="50%">Rachunek docelowy</td>
          <td width="50%">
            <input type="text" name="RachunekPrzeciwst" size="35"/>
          </td>
        </tr><tr>
          <td width="50%">Nazwa docelowa</td>
          <td width="50%">
            <input type="text" name="nazwaDoc"/>
          </td>
        </tr><tr>
          <td width="50%">Adres docelowy</td>
          <td width="50%">
            <input type="text" name="adresDoc"/>
          </td>
        </tr><tr>
          <td width="50%">Kod Pocztowy docelowy</td>
          <td width="50%">
            <input type="text" name="kodPocztDoc"/>
          </td>
        </tr><tr>
          <td width="50%">Miejscowosc docelowa</td>
          <td width="50%">
            <input type="text" name="miejscowoscDoc"/>
          </td>
        </tr><tr>
          <td width="50%">Tytul przelewu</td>
          <td width="50%">
            <input type="text" name="tytul"/>
          </td>
        </tr><tr>
          <td width="50%">Wartosc przelewu</td>
          <td width="50%">
            <input type="text" name="wartosc"/>
          </td>
        </tr>
      </table>
      <input type="submit" value="Update"/>
    </form>
  </body>
</html>