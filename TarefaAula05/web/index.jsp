<%-- 
    Document   : index
    Created on : Sep 22, 2020, 4:18:23 PM
    Author     : Luan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.fatec.ads.poo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

  ArrayList<User> userList = (ArrayList) application.getAttribute("userList");

  if (userList == null) {
    userList = new ArrayList();

    application.setAttribute("userList", userList);
  }

  if (request.getParameter("add") != null) {
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String telefone = request.getParameter("telefone");

    userList.add(new User(nome, email, telefone));
    response.sendRedirect(request.getRequestURI());
  }

  if (request.getParameter("remove") != null) {
    int i = Integer.parseInt(request.getParameter("i"));

    userList.remove(i);
    response.sendRedirect(request.getRequestURI());
  }
%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="styles/style.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <title>Contatos</title>
  </head>
  <body>

    <main>
      <h1>Adicionar contatos</h1>

      <form method="get">
        <label for="nome">Nome: </label>
        <input type="text" required name="nome" id="nome" /> <br/>

        <label for="email">Email: </label>
        <input type="email" required name="email" id="email" /> <br/>

        <label for="telefone">Telefone: </label>
        <input type="text" required name="telefone" id="telefone" /> <br/>

        <button type="submit" name="add" id="add">Adicionar</button>

      </form>
    </main>
    <div class="container">
      <section id="contatos">
        <%
        if (userList.size() > 0) {%>
        <table style="border-radius: 4px;">
          <tr class="head">
            <th>Contato</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>-</th>
          </tr>

          <%
          for (int i = 0; i < userList.size(); i++) {%>

          <% User user = userList.get(i);%>
          <tr>
            <td><%= i + 1%></td>
            <td><%= user.getNome()%></td>
            <td><%= user.getEmail()%></td>
            <td><%= user.getTelefone()%></td>
            <td>
              <form>
                <button type="submit" name="remove">Remover</button>
                <input type="hidden" name="i" value="<%= i%>"/>
              </form>
            </td>
          </tr>
          <%}%>
        </table>

        <%} else {
            out.println("<h2>Sem contatos :(</h2>");
          }
        %>
      </section>
    </div>
  </body>
</html>
