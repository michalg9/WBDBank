<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"
         import="java.sql.ResultSet"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>client_info</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">Serwsis transakcyjny ZlotoBanku.</h2><h3>Informacje o kliencie.</h3>
     <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
       <jsp:useBean id="currentClient" class="bank.Client"/>
      <% clientbean.setConnHandler(connbean); %>
     <%
      int client_id = new Integer(request.getParameter("clientid"));
      currentClient = clientbean.findClientById(client_id); %>
      <p>Informacje o kliencie: </p>
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <th>
          <h4>
            Id
          </h4>
        </th>
        <th>
          <h4>Nazwa</h4>
        </th>
        <th>
          <h4>Miejscowosc</h4>
        </th>
        <th>
          <h4>Kod pocztowy</h4>
        </th>
        <th>
          <h4>Adres</h4>
        </th>
        <th>
          <h4>Typ</h4>
        </th>
        <th>
          <h4>Info</h4>
        </th>
        <th>
          &nbsp;
        </th>
      </tr>

    <%
    out.println("<tr>");
      out.println("<td>" + 
      currentClient.getIdent() + "</td><td> " + 
      currentClient.getNazwa() + "</td><td> " + 
      currentClient.getMiejscowosc() + "</td><td> " + 
      currentClient.getKodPoczt() + "</td><td>" + 
      currentClient.getAdres() + "</td><td>" + 
      currentClient.getTyp() + "</td><td>" + 
      currentClient.getInfo() + 
      "</td><td> <a href=\"worker_cl_see.jsp?clientid=" +  currentClient.getIdent() +
      "\">Wybierz</a><br>" + 
      "<a href=\"worker_cl_edit.jsp?clientid=" +  currentClient.getIdent() +
      "\">Edytuj dane</a><br>" + 
      "<a href=\"client_passw.jsp?message=\"\">Zmiana hasla</a><br>" +
      "<a href=\"worker_cl_delete.jsp?clientid=" +  currentClient.getIdent() +
      "\">Usun klienta</a><br>" +
      "</td>");
    out.println("</tr>");
    %>
    </table>
    
    <hr />
    <p>Posiadane rachunki:</p>
    
     <%ResultSet rset; 
      rset = clientbean.getRachunkiByClientId(client_id); %>
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <th>
          <h4>Numer</h4>
        </th>
        <th>
          <h4>Usluga</h4>
        </th>
        <th>
          <h4>
            Wlasciciel
          </h4>
        </th>
        <th>
          <h4>
            Srodki
          </h4>
        </th>
        <th>
          <h4>
            Data otwarcia
          </h4>
        </th>
        <th>
          Akcje
        </th>
      </tr>
       
      <%
    while (rset.next ())
    {
    out.println("<tr>");
      out.println("<td>" + 
      rset.getString("numer") + "</td><td> " + 
      rset.getString("USLUGARACHUNEK_NAZWA") + "</td><td> " + 
      rset.getInt("KLIENT_IDENT") + "</td><td> " + 
      rset.getString("srodki") + "</td><td>" + 
      rset.getString("otwarty") + 
      "</td><td>" +
      "<a href=\"rachunek_historia.jsp?numer=" + rset.getString("numer") + "\">Historia</a><br/>" +
       "<a href=\"worker_przelew.jsp?clientid=" + rset.getInt("KLIENT_IDENT") + "&numer=" + rset.getString("numer") + "\">Wykonaj przelew</a><br/>"
      );
    out.println("</tr>");
    }

    %>
    </table>
      <% out.println("<a href=\"worker_nowy_rachunek.jsp?clientid=" + client_id + "\" target=\"MainFrame\">Nowy rachunek</a><br/>");
    %>
    <br/>
    <hr />
    <p>Posiadane lokaty</p>
    
    <%
      rset = clientbean.getLokatyByClientId(client_id); %>
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <th>
          <h4>Id</h4>
        </th>
        <th>
          <h4>Nazwa lokaty</h4>
        </th>
        <th>
          <h4>Data otwarcia</h4>
        </th>
        <th>
          <h4>Srodki</h4>
        </th>
        <th>
          <h4>Okres</h4>
        </th>
        <th>
          <h4>Oprocentowanie</h4>
        </th>
        <th>
          <h4>Opis</h4>
        </th>
        <th>
          <h4>Akcje</h4>
        </th>
      </tr>
       
      <%
    while (rset.next ())
    {
    out.println("<tr>");
      out.println("<td>" + 
      rset.getString("ident") + "</td><td> " + 
      rset.getString("USLUGALOKATA_NAZWA") + "</td><td> " + 
      rset.getString("OTWARTA") + "</td><td> " + 
      rset.getString("WPLATA") + "</td><td>" + 
      rset.getString("OKRES") + "</td><td>" + 
      rset.getString("OPROCENTOWANIE") + "</td><td>" + 
      rset.getString("OPIS") + 
      "</td><td>" +
      "<a href=\"worker_zerwij_lokate.jsp?ident=" + rset.getString("ident") + "&clientid=" + client_id + "\">Zerwij</a><br/>"
       );
    out.println("</tr>");
    }

    %>
    </table>
    <% out.println("<a href=\"worker_nowa_lokata.jsp?clientid=" + client_id + "\" target=\"MainFrame\">Nowa lokata</a><br/>");
    %>
    <br/>
    
    <hr />
    <p>Posiadane kredyty</p>
    
    <%
      rset = clientbean.getKredytyByClientId(client_id); %>
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <th>
          <h4>Nazwa kredytu</h4>
        </th>
        <th>
          <h4>Data zaciagniecia</h4>
        </th>
        <th>
          <h4>Suma</h4>
        </th>
        <th>
          <h4>Oprocentowanie</h4>
        </th>
        <th>
          <h4>Okres</h4>
        </th>
        <th>
        <h4>Splacone raty</h4></th>
        <th>
          <h4>Opis</h4>
        </th>
      </tr>
      <%
    while (rset.next ())
    {
    out.println("<tr>");
      out.println("<td>" + 
      rset.getString("NAZWA") + "</td><td> " + 
      rset.getString("UDZIELONY") + "</td><td> " + 
      rset.getString("SUMA") + "</td><td>" + 
      rset.getString("OPROCENTOWANIE") + "</td><td>" + 
      rset.getString("OKRES") + "</td><td>" + 
      rset.getString("SPLACONE") + "</td><td>" + 
      rset.getString("OPIS") + 
      "</td>"
       );
    out.println("</tr>");
    }

    %>
    </table>
    
     <% out.println("<a href=\"worker_nowy_kredyt.jsp?clientid=" + client_id + "\" target=\"MainFrame\">Nowy kredyt</a><br/>");
    %>
    <br />
    <hr />
    <p>Inwestycje</p>
    
     <% 
      rset = clientbean.getFunduszeByClientId(client_id); %>
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <th>
          <h4>Nazwa funduszu</h4>
        </th>
        <th>
          <h4>Poczatek</h4>
        </th>
        <th>
          <h4>Koniec</h4>
        </th>
        <th>
          <h4>Data wplaty</h4>
        </th>
        <th>
          <h4>Suma</h4>
        </th>
        <th>
          <h4>Prognozowane oprocent.</h4>
        </th>
        <th>
          <h4>Opis</h4>
        </th>
      </tr>
      <%
    while (rset.next ())
    {
    out.println("<tr>");
      out.println("<td>" + 
      rset.getString("NAZWA") + "</td><td> " + 
      rset.getString("POCZATEK") + "</td><td> " + 
      rset.getString("KONIEC") + "</td><td>" + 
      rset.getString("ZALOZONA") + "</td><td>" + 
      rset.getString("WPLATA") + "</td><td>" +
      rset.getString("PROGNOZA") + "</td><td>" + 
      rset.getString("OPIS") + 
      "</td>"
       );
    out.println("</tr>");
    }

    %>
    </table>
    
    <% out.println("<a href=\"worker_nowy_fundusz.jsp?clientid=" + client_id + "\" target=\"MainFrame\">Zapisz się na fundusz inwestycyjny</a><br/>"); %>
    
    <br/>
    
  </body>
</html>