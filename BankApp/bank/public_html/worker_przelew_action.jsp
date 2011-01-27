<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>update_action</title>
  </head>
  <body>
    <%@ page import="java.sql.ResultSet"%>
       <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="clientbean" class="bank.ClientBean" scope="session"/>
      <% clientbean.setConnHandler(connbean); %>
      <%

//dane klienta wysylajacego     
Integer client_id = new Integer(request.getParameter("client_id"));
String Rachunek_numer = request.getParameter("Rachunek_numer");
String nazwa = request.getParameter("nazwa");
String adres = request.getParameter("adres");
String kodPoczt = request.getParameter("kodpoczt");
String miejscowosc = request.getParameter("miejscowosc");

String RachunekPrzeciwst = request.getParameter("RachunekPrzeciwst");
//dane klienta docelowego
String nazwaDoc = request.getParameter("nazwaDoc");
String adresDoc = request.getParameter("adresDoc");
String kodPocztDoc = request.getParameter("kodpocztDoc");
String miejscowoscDoc = request.getParameter("miejscowoscDoc");

String tytul = request.getParameter("tytul");
Double wartosc = new Double(request.getParameter("wartosc"));
clientbean.wykonajPrzelew(Rachunek_numer, wartosc,   
                            tytul, RachunekPrzeciwst,
                            nazwa, adres,
                            miejscowosc, kodPoczt,
                            nazwaDoc, adresDoc,
                            miejscowoscDoc, kodPocztDoc
                            );

pageContext.forward("worker_cl_see.jsp?clientid=" + client_id);

%>

  </body>
</html>