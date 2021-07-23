<%-- 
    Document   : tabuada
    Created on : Aug 31, 2020, 8:56:50 PM
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
    <title>Tabuada</title>
    
    <style>
      body {
        height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0 auto;
      }
      
      table {
        width: 400px;
      }
      
      td {
        text-align: center;
      }
      
      td.error {
        font-weight: bold;
        color: red;
      }
      
      h4 a {
        background: green;
        text-decoration: none;
        color: #fff;
        padding: 5px 20px;
        transition: opacity 200ms;
      }
      h4 a:hover {
        opacity: 0.9;
      }
    </style>
  </head>
  <body>
    <h1>Tabuada</h1>
    
    <form>
      <label for="quantidade">Multiplicador: </label>
      <input type="number" name="n" id="quantidade"/>
      
      <button type="submit">Calcular</button>
    </form>
    <br>
    
    <table border="1">
      <tr>
        <th>Fator 1</th>
        <th>Fator 2</th>
        <th>Resultado</th>
      </tr>
      <% if(request.getParameter("n") == null){ %>
        <tr><td class="error" colspan="3" >Não há um parâmetro</td></tr>
      <% } else if(requestException != null){%>
        <tr><td class="error" colspan="3">Parâmetro inválido</td></tr>
      <% } %>
      
      <% for(int i =1; i <= 10; i++) {%>
      <tr>
        <td><%= n %></td>
        <td><%= i %></td>
        <th><%= n * i %></th>
      </tr>
      <% } %>
    </table>
    
    <h4><a href="index.jsp">Voltar</a></h4>
  </body>
</html>
