<%@page import="model.User"%>
<%@page import="web.DbListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String exceptionMessage = null;

	if (request.getParameter("changePassword") != null) {
		try {
			String login = (String) session.getAttribute("session.login");

			String password = request.getParameter("password");
			String newPassword = request.getParameter("newPassword");
			String confirmPassword = request.getParameter("confirmPassword");

			if (User.getUser(login, password) == null) {
				exceptionMessage = "Senha inválida";
			} else if (!newPassword.equals(confirmPassword)) {
				exceptionMessage = "As senhas novas não conferem";
			} else {
				User.changePassword(login, newPassword);
			}
		} catch (Exception ex) {
			exceptionMessage = ex.getMessage();
		}
	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Início - MyFinance</title>
	</head>
	<body>
		<%@include file="WEB-INF/jspf/header.jspf" %>

		<h2>Perfil do usuário</h2>
		<%if (session.getAttribute("session.login") == null) {%>
		<div>Você não tem permissão para acessar esta página</div>
		<%} else {%>

		<h3>LOGIN</h3>
		<div><%= session.getAttribute("session.login")%></div>
		<h3>NOME</h3>
		<div><%= session.getAttribute("session.nome")%></div>
		<h3>PAPEL</h3>
		<div><%= session.getAttribute("session.papel")%></div>
		<hr/>

		<h4>Alterar senha</h4>
		<% if (exceptionMessage != null) {%>
		<div style="color: red;"><%= exceptionMessage%></div>
		<%}%>

		<form method="post">
			Senha atual: <input type="password" name="password" />
			Nova senha: <input type="password" name="newPassword" />
			Confirme a nova senha: <input type="password" name="confirmPassword" />
			<input type="submit" name="changePassword" value="alterar" />
		</form>
		<%}%>
	</body>
</html>