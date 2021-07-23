<%-- 
    Document   : index
    Created on : Sep 29, 2020, 7:37:28 PM
    Author     : Luan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="styles/global.css" rel="stylesheet" />
    <link href="styles/index.css" rel="stylesheet" />
    <link href="styles/menu.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <title>Home - Avaliação POO</title>
  </head>
  <body>
		<%@include file="WEB-INF/jspf/menu.jspf" %>
		
    <main>
      <p><span>Nome:</span> Luan Alves Silva</p>
      <p><span>Número de matricula (RA):</span> 1290481913056</p>
      <p><span>Número de disciplinas no semestre:</span> <%=Disciplina.getList().size()%></p>
    </main>
  </body>
</html>
