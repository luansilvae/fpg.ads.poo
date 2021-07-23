package web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;
import model.User;

public class DbListener implements ServletContextListener {

	private static final String CLASS_NAME = "org.sqlite.JDBC";
	private static final String DB_URL = "jdbc:sqlite:my_finance.db";

	public static String exceptionMessage = null;

	public static Connection getConnection() throws Exception {
		return DriverManager.getConnection(DB_URL);
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		String etapa = "Inicialização";
		Connection con = null;
		Statement stmt = null;
		try {
			etapa = "Registro a classe do driver";
			Class.forName(CLASS_NAME);
			etapa = "Conectar com o banco de dados";
			con = getConnection();
			etapa = "Criar a tabela de usuários";
			stmt = con.createStatement();
			stmt.execute(User.getCreateStatement());
			if (User.getList().isEmpty()) {
				etapa = "Criar primeiros usuários";
				stmt.execute("INSERT INTO usuarios VALUES ("
								+ "'admin',"
								+ "'Administrador do Sistema',"
								+ "'ADMINISTRADOR',"
								+ "1234".hashCode()
								+ ")");
				stmt.execute("INSERT INTO usuarios VALUES ("
								+ "'luan',"
								+ "'Luan Alves Silva',"
								+ "'USUÁRIO',"
								+ "1234".hashCode()
								+ ")");
			}
			etapa = "Desconectar do banco de dados";
		} catch (Exception ex) {
			exceptionMessage = etapa + ": " + ex.getLocalizedMessage();
		} finally {
			try {
				stmt.close();
			} catch (Exception ex2) {
			}
			try {
				con.close();
			} catch (Exception ex2) {
			}
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	}
}
