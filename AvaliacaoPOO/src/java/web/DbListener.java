/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;

import model.Disciplina;

/**
 * Web application lifecycle listener.
 *
 * @author Luan
 */
public class DbListener implements ServletContextListener {

	private static final String CLASS_NAME = "org.sqlite.JDBC";
	private static final String DB_URL = "jdbc:sqlite:p2_disciplinas.db";

	public static String exceptionMessage = null;

	Connection con = null;
	Statement stmt = null;
	Exception methodEx = null;
	ResultSet rs = null;

	public static Connection getConnection() throws Exception {
		return DriverManager.getConnection(DB_URL);
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		String etapa = "inicializando";

		try {
			etapa = "registrando a classe do drive";
			Class.forName(CLASS_NAME);
			etapa = "conectando com o banco de dados";
			con = getConnection();
			stmt = con.createStatement();
			etapa = "criar tabela";
			stmt.execute(Disciplina.getCreateStatement());

			if (Disciplina.getList().isEmpty()) {
				stmt.execute("INSERT INTO disciplinas values ("
								+ "'Inglês IV',"
								+ "'Consolidação da compreensão e produção oral e escrita por meio da integração das habilidades lingüístico-comunicativas desenvolvidas na disciplina Inglês 3.',"
								+ "4,"
								+ "0"
								+ ")"
				);
				stmt.execute("INSERT INTO disciplinas values ("
								+ "'POO',"
								+ "'Conceitos e evolução da tecnologia de orientação a objetos. Limitações e diferenças entre o paradigma da programação estruturada em relação à orientação a objetos.',"
								+ "4,"
								+ "0"
								+ ")"
				);
				stmt.execute("INSERT INTO disciplinas values ("
								+ "'Engenharia de Software 2',"
								+ "'Conceitos, evolução e importância de arquitetura de software. Padrões de Arquitetura. Padrões de Distribuição. Camadas no desenvolvimento de software. Tipos de Arquitetura de Software.',"
								+ "4,"
								+ "0"
								+ ")"
				);
				stmt.execute("INSERT INTO disciplinas values ("
								+ "'Banco de Dados',"
								+ "'Conceitos de Base de Dados. Modelos conceituais de informações. Modelos de Dados: Relacional,  Redes e Hierárquicos. Modelagem de dados - conceitual, lógica e física.',"
								+ "4,"
								+ "0"
								+ ")"
				);
				stmt.execute("INSERT INTO disciplinas values ("
								+ "'Linguagem de Programação IV',"
								+ "'Comandos de linguagens usadas na construção e estruturação de sites para a Web, com páginas dinâmi­cas e interativas.',"
								+ "4,"
								+ "0"
								+ ")"
				);
				stmt.execute("INSERT INTO disciplinas values ("
								+ "'Sistemas Operacionais 2',"
								+ "'Apresentação de um sistema operacional específico utilizado em ambiente corporativo. Requisitos de hardware para instalação do sistema.',"
								+ "4,"
								+ "0"
								+ ")"
				);
				stmt.execute("INSERT INTO disciplinas values ("
								+ "'Metodologia da Pesquisa Científico-Tecnológica',"
								+ "'O Papel da ciência e da tecnologia. Tipos de conhecimento. Método e técnica. O processo de leitura e de análise textual.',"
								+ "4,"
								+ "0"
								+ ")"
				);
			}

		} catch (Exception ex) {
			exceptionMessage = etapa + ": " + ex.getLocalizedMessage();
		} finally {
			try {
				stmt.close();
				con.close();
			} catch (Exception e) {
			}
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	}
}
