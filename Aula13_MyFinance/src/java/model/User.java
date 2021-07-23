package model;

import java.util.ArrayList;
import java.sql.*;
import web.DbListener;

public class User {

	private String login;
	private String nome;
	private String papel;

	public User(String login, String nome, String papel) {
		this.login = login;
		this.nome = nome;
		this.papel = papel;
	}

	public String getPapel() {
		return papel;
	}

	public void setPapel(String papel) {
		this.papel = papel;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public static ArrayList<User> getList() throws Exception {
		ArrayList<User> list = new ArrayList<>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Exception methodException = null;
		try {
			con = DbListener.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT * FROM usuarios");
			while (rs.next()) {
				list.add(new User(
								rs.getString("login"),
								rs.getString("nome"),
								rs.getString("papel")
				));
			}
		} catch (Exception ex) {
			methodException = ex;
		} finally {
			try {
				rs.close();
			} catch (Exception ex2) {
			}
			try {
				stmt.close();
			} catch (Exception ex2) {
			}
			try {
				con.close();
			} catch (Exception ex2) {
			}
		}
		if (methodException != null) {
			throw methodException;
		}
		return list;
	}

	public static User getUser(String login, String password) throws Exception {
		User user = null;
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Exception methodException = null;
		try {
			con = DbListener.getConnection();
			stmt = con.prepareStatement("SELECT * FROM usuarios WHERE login = ? and password_hash = ?");
			stmt.setString(1, login);
			stmt.setLong(2, password.hashCode());
			rs = stmt.executeQuery();
			while (rs.next()) {
				user = new User(
								rs.getString("login"),
								rs.getString("nome"),
								rs.getString("papel")
				);
			}
		} catch (Exception ex) {
			methodException = ex;
		} finally {
			try {
				rs.close();
			} catch (Exception ex2) {
			}
			try {
				stmt.close();
			} catch (Exception ex2) {
			}
			try {
				con.close();
			} catch (Exception ex2) {
			}
		}
		if (methodException != null) {
			throw methodException;
		}
		return user;
	}

	public static void changePassword(String login, String newPassword) throws Exception {
		User user = null;
		Connection con = null;
		PreparedStatement stmt = null;

		Exception methodException = null;
		try {
			con = DbListener.getConnection();
			stmt = con.prepareStatement("UPDATE usuarios SET password_hash = ? WHERE login = ?");
			stmt.setLong(1, newPassword.hashCode());
			stmt.setString(2, login);
			stmt.execute();

		} catch (Exception ex) {
			methodException = ex;
		} finally {
			try {
				stmt.close();
			} catch (Exception ex1) {
			}
			try {
				con.close();
			} catch (SQLException ex2) {
			}

		}
		if (methodException != null) {
			throw methodException;
		}
		System.out.println(user);
	}

	public static String getCreateStatement() {
		return "CREATE TABLE IF NOT EXISTS usuarios("
						+ "login VARCHAR(50) UNIQUE NOT NULL,"
						+ "nome VARCHAR(200) NOT NULL,"
						+ "papel VARCHAR(20) NOT NULL,"
						+ "password_hash LONG NOT NULL"
						+ ")";
	}
}
