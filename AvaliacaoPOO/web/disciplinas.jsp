<%-- 
    Document   : disciplina
    Created on : Oct 3, 2020, 6:02:40 PM
    Author     : Luan
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <%
		DecimalFormat df = new DecimalFormat("#0.0");
		
		String exceptionMsg = null;

		if (request.getParameter("cancelar") != null) {
			response.sendRedirect(request.getRequestURI());
		}
		
		if (request.getParameter("formInsert") != null) {
			try {
				String nome = request.getParameter("nome");
				String ementa = request.getParameter("ementa");
				int ciclo = Integer.parseInt(request.getParameter("ciclo"));
				Float nota = Float.parseFloat(request.getParameter("nota"));

				if (nota >= 0 && nota <= 10) {
					Disciplina.insert(nome, ementa, ciclo, nota);
					response.sendRedirect(request.getRequestURI());
				} else {
					exceptionMsg = "Nota inválida";
				}

			} catch (Exception e) {
				exceptionMsg = e.getLocalizedMessage();
			}
		}

		if (request.getParameter("formUpdate") != null) {
			try {
				String nome = request.getParameter("nome");
				String nomeAntigo = request.getParameter("nomeAntigo");
				String ementa = request.getParameter("ementa");
				int ciclo = Integer.parseInt(request.getParameter("ciclo"));
				Float nota = Float.parseFloat(request.getParameter("nota"));

				if (nota >= 0 && nota <= 10) {
					Disciplina.update(nomeAntigo, nome, ementa, ciclo, nota);
					response.sendRedirect(request.getRequestURI());
				} else {
					exceptionMsg = "Nota inválida";
				}

			} catch (Exception e) {
				exceptionMsg = e.getLocalizedMessage();
			}
		}

		if (request.getParameter("formDelete") != null) {
			try {
				String nome = request.getParameter("nome");
				
				Disciplina.delete(nome);
				response.sendRedirect(request.getRequestURI());
			} catch (Exception e) {
				exceptionMsg = e.getLocalizedMessage();
			}
		}
		
  %>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Disciplinas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="styles/global.css" rel="stylesheet" />
    <link href="styles/index.css" rel="stylesheet" />
    <link href="styles/menu.css" rel="stylesheet" />
    <link href="styles/disciplinas.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  </head>
  <body>
		<%@include file="WEB-INF/jspf/menu.jspf" %>
		<h1>Lista de Disciplinas</h1>
		
		<% if (exceptionMsg != null) {%>
			<div class="error-message"><%= exceptionMsg%> </div>
		<%}%>

		<%if (request.getParameter("prepareInsert") != null) {%>

		<h2 class="add-disciplina-text">Adicionar disciplina</h2>

		<form class="insert-form" method="get">
			<label for="nome">Nome </label>
			<input type="text" name="nome" id="nome" /> <br/>

			<label for="ementa">Ementa </label>
			<textarea type="text" name="ementa" id="ementa" ></textarea> <br/>

			<label for="telefone">Ciclo </label>
			<input type="text" name="ciclo" id="ciclo" /> <br/>

			<label for="telefone">Nota </label>
			<input type="text" name="nota" id="nota" /> <br/>

			<button type="submit" name="formInsert" id="formInsert">Adicionar</button>
			<button type="submit" name="cancelar" id="cancelar">Cancelar</button>
		</form>

		<%} else if (request.getParameter("prepareUpdate") != null) { 

				String nome = request.getParameter("nome");
				String ementa = request.getParameter("ementa");
				int ciclo = Integer.parseInt(request.getParameter("ciclo"));
				Float nota = Float.parseFloat(request.getParameter("nota")); %>
			

				<h2 class="add-disciplina-text">Alterar disciplina</h2>

				<form class="insert-form">
					<input type="hidden" name="nomeAntigo" value="<%= nome%>"/>
					<label for="nome">Nome </label>
					<input type="text" name="nome" id="nome" value="<%= nome%>"/> <br/>

					<label for="ementa">Ementa </label>
					<textarea type="text" name="ementa" id="ementa" rows="5"><%= ementa%></textarea> <br/>

					<label for="telefone">Ciclo </label>
					<input type="text" name="ciclo" id="ciclo" value="<%= ciclo%>"/> <br/>

					<label for="telefone">Nota </label>
					<input type="text" name="nota" id="nota" value="<%= nota%>" /> <br/>

					<button type="submit" name="formUpdate" id="formInsert">Alterar</button>
					<button type="submit" name="cancelar" id="cancelar">Cancelar</button>
				</form>

		<%} else if (request.getParameter("prepareDelete") != null) { 
					String nome = request.getParameter("nome"); %>
					
					<form class="confirm-delete">
						<input type="hidden" name="nome" value="<%= nome%>"/>
						<span class="confirm-text">Tem certeza que quer deletar a disciplina <b><%= nome%></b>?</span>

						<div class="buttons-delete">
							<button type="submit" name="formDelete" class="confirm">Deletar</button>
							<button type="submit" name="cancelar" class="cancel" >Cancelar </button>
						</div>
					</form>
		<%} else {%>
			<form method="post" class="form-insert">
				<button type="submit" id="btn-insert" class="btn-insert" name="prepareInsert" >+</button> 
				<span>Nova disciplina</span>
			</form>
		<%}%>
		
    <main>
			<%
			if (Disciplina.getList().size() > 0) { 
				for (int i = 0; i < Disciplina.getList().size(); i++) {%>
					<article>
						<div class="title">
							<h2><%= Disciplina.getList().get(i).getNome()%></h2>
							<span class="ciclo">Ciclo: <%= Disciplina.getList().get(i).getCiclo()%></span>
						</div>

						<p class="ementa"><%= Disciplina.getList().get(i).getEmenta()%></p>
						<div class="actions">
							<span class="label-nota">Nota: 
								<% if (Disciplina.getList().get(i).getNota() >= 6) {%>
								<span class="aprovado"><%= df.format(Disciplina.getList().get(i).getNota())%></span>
								<%} else {%>
								<span class="reprovado"><%= df.format(Disciplina.getList().get(i).getNota())%></span>
								<%}%>
							</span>	
							<form class="buttons">
								<input type="hidden" name="nome" value="<%= Disciplina.getList().get(i).getNome()%>"/>
								<input type="hidden" name="ementa" value="<%= Disciplina.getList().get(i).getEmenta()%>"/>
								<input type="hidden" name="ciclo" value="<%= Disciplina.getList().get(i).getCiclo()%>"/>
								<input type="hidden" name="nota" value="<%= Disciplina.getList().get(i).getNota()%>"/>
								<button class="alterar" name="prepareUpdate">Alterar</button>
								<button class="deletar" name="prepareDelete">Deletar</button>
							</form>
						</div>
					</article>
				<%}%>

			<%} else {
						out.println("<h2>Nunhuma disciplina cadastrada.</h2>");
				}%>
    </main>
  </body>
</html>
