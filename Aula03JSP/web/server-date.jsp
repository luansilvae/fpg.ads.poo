<%-- 
    Document   : newjsp
    Created on : Aug 31, 2020, 7:52:44 PM
    Author     : Luan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Server Date - JSP</title>
  </head>
  <body>
    <h1>Data do servidor</h1>
    
    <h1><% java.util.Date now = new java.util.Date();
      out.println("Agora no servidor " + now);  
    %>
    </h1>
      
      <h3>Agora no servidor: <%= now  %></h3>
      
      <h4><a href="index.jsp">Voltar</a></h4>
  </body>
</html>
