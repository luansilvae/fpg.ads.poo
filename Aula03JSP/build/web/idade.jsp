<%-- 
    Document   : idade
    Created on : Aug 31, 2020, 7:59:30 PM
    Author     : Luan
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Minha idade</title>
  </head>
  <body>
    <h1>Nome e idade</h1>
    <%
      String nome = "Luan Alves Silva";
      int anoNascimento = 1999;
      int anoAtual = Calendar.getInstance().get(Calendar.YEAR);
      
      int idade = anoAtual - anoNascimento;
    %>
    
    <h2>Meu nome: <%= nome %></h2>
   
   <h2>Minha idade: <%= idade %></h2>
   
   <h4><a href="index.jsp">Voltar</a></h4>
  </body>
</html>
