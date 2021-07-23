<%-- 
    Document   : index
    Created on : Sep 21, 2020, 7:26:29 PM
    Author     : Luan
--%>

<%@page import="java.util.Date"%>
<%@page import="br.fatec.ads.poo.Horarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Horario atual</title>
  </head>
  <body>
  <%
   Date hora = new Date();
   Horarios horaAtual = new Horarios(hora.getHours(), hora.getMinutes(), hora.getSeconds());
   Horarios horaIntervalo = new Horarios(20, 50, 00);
  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aula 05</title>
    </head>
    <body>
        <h1>Horario</h1>
        <h2>Hora atual:</h2>
        <h3><%= horaAtual.retornaHorario()%></h3>
        <h2>Horario do intervalo:</h2>
        <h3><%= horaIntervalo.retornaHorario()%></h3>
    </body>
</html>
