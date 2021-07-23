/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author Luan
 */
public class Disciplina {

  private String nome;
  private String ementa;
  private int ciclo;
  private float nota;
	
  public Disciplina(String nome, String ementa, int ciclo, float nota) {
    this.nome = nome;
    this.ementa = ementa;
    this.ciclo = ciclo;
		this.nota = nota;
  }

  public String getNome() {
    return nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public String getEmenta() {
    return ementa;
  }

  public void setEmenta(String ementa) {
    this.ementa = ementa;
  }

  public int getCiclo() {
    return ciclo;
  }

  public void setCiclo(int ciclo) {
    this.ciclo = ciclo;
  }

  public float getNota() {
    return nota;
  }

  public void setNota(float nota) {
    this.nota = nota;
  }

 public static String getCreateStatement() {
		return "CREATE TABLE IF NOT EXISTS disciplinas("
						+ "nome VARCHAR(50) UNIQUE NOT NULL,"
						+ "ementa VARCHAR(200) NOT NULL,"
						+ "ciclo int,"
						+ "nota float )";
	}

 	public static ArrayList<Disciplina> getList() throws Exception {
		ArrayList<Disciplina> list = new ArrayList<>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Exception methodEx = null;
		try {
			con = DbListener.getConnection();
			stmt = con.createStatement();
			stmt.execute(Disciplina.getCreateStatement());
			rs = stmt.executeQuery("SELECT * FROM disciplinas");
			while (rs.next()) {
				list.add(new Disciplina(rs.getString("nome"), rs.getString("ementa"), rs.getInt("ciclo"), rs.getFloat("nota")));
			}

		} catch (Exception ex) {
			methodEx = ex;
		} finally {
			try {
				stmt.close();
				con.close();
				rs.close();
			} catch (Exception e) {
			}
		}
		if (methodEx != null) {
			throw methodEx;
		}
		return list;
	}
	
	public static void insert(String nome, String ementa, int ciclo, float nota) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Exception methodEx = null;
        try {
            con = DbListener.getConnection();
            stmt = con.prepareStatement("INSERT INTO disciplinas values(?,?,?,?)");
            stmt.setString(1, nome);
            stmt.setString(2, ementa);
            stmt.setString(3, "" + ciclo );
            stmt.setString(4, "" + nota);
            stmt.execute();
        } catch (Exception ex) {
            methodEx = ex;
        }finally{
            try {stmt.close();con.close();rs.close();}catch (Exception e) { }
        }
        if(methodEx!=null) throw methodEx;
        
    }
    
    
        public static void update(String nomeAntigo, String nome, String ementa, int ciclo, float nota) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Exception methodEx = null;
        try {
            con = DbListener.getConnection();
            stmt = con.prepareStatement("UPDATE disciplinas SET nome=?, ementa=?, ciclo=?, nota=? WHERE nome=?");
            stmt.setString(1, nome);
            stmt.setString(2, ementa);
            stmt.setString(3, "" + ciclo);
            stmt.setString(4, "" + nota);
            stmt.setString(5, "" + nomeAntigo);
            stmt.execute();
        } catch (Exception ex) {
            methodEx = ex;
        }finally{
            try {stmt.close();con.close();rs.close();}catch (Exception e) { }
        }
        if(methodEx!=null) throw methodEx;
        
    }
 
        public static void delete(String nome) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Exception methodEx = null;
        try {
            con = DbListener.getConnection();
            stmt = con.prepareStatement("DELETE FROM disciplinas WHERE nome=?");
            stmt.setString(1, nome);
            stmt.execute();
        } catch (Exception ex) {
            methodEx = ex;
        }finally{
            try {stmt.close();con.close();rs.close();}catch (Exception e) { }
        }
        if(methodEx!=null) throw methodEx;
        
    }
}
