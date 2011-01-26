<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1250"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>edit_worker</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">
      Serwsis transakcyjny ZlotoBanku.
    </h2><h3>
      Modyfikuj dane.
    </h3>     
     <jsp:useBean id="connbean" class="bank.ConnectionHandler" scope="session"/>
      <jsp:useBean id="workerbean" scope="session" class="bank.WorkerBean"/>
      <% workerbean.setConnHandler(connbean); %>
      <% workerbean.setFunction(); %>
      <jsp:useBean id="worker" class="bank.Worker"/>
      <%Integer worker_id = new Integer(request.getParameter("workerid"));
      worker = workerbean.findWorkerById(worker_id.intValue());%><form action="edit_worker_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%"><tr>
          <td width="50%">Imie</td>
          <td width="50%">
            <input type="hidden" name="worker_id"
                   value="<%= worker.getIdent() %>"/><input type="text" name="imie"
                   value="<%= worker.getImie() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Nazwisko</td>
          <td width="50%">
            <input type="text" name="nazwisko" value="<%= worker.getNazwisko() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Stanowisko</td>
          <td width="50%">
            <input type="text" name="stanowisko"
                   value="<%= worker.getStanowisko() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Pensja</td>
          <td width="50%">
            <input type="text" name="pensja"
                   value="<%= worker.getPensja() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Przelozony</td>
          <td width="50%">
            <input type="text" name="przelozony"
                   value="<%= worker.getPrzelozony() %>"/>
          </td>
        </tr>
      </table>
      <input type="submit" value="Update"/>
    </form>
  </body>
</html>