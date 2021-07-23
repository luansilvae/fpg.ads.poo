<%-- 
    Document   : numeros
    Created on : Aug 31, 2020, 7:57:44 PM
    Author     : Luan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
  int n;
  Exception requestException = null;
  try{
    n = Integer.parseInt(request.getParameter("n"));
  }catch(Exception ex) {
    n = 0;
    requestException = ex;
  }
%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Números aleatórios</title>
  </head>
  <body>
    <h1>Números aleatórios</h1>
    
    <form>
      <label for="quantidade">Quantidade:</label>
      <input type="number" name="n" id="quantidade"/>
      
      <button type="submit">Gerar</button>
    </form>
    
    <br>
    
    <table border="1">
      <tr>
        <th>Índice</th>
        <th>Número</th>
      </tr>
      <% if(request.getParameter("n") == null){ %>
        <tr><td colspan="2">Não há um parâmetro</td></tr>
      <% } else if(requestException != null){%>
        <tr><td colspan="2">Parâmetro inválido</td></tr>
      <% } %>
      
      <% for(int i =1; i <= n; i++) {%>
      <tr>
        <th><%= i %></th>
        <td><%= ((int) (100*Math.random()))%></td>
      </tr>
      <% } %>
    </table>
    <h4><a href="index.jsp">Voltar</a></h4>
  </body>
</html>
