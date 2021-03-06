/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luan
 */
@WebServlet(name = "GreetingServlet", urlPatterns = {"/greeting.html"})
public class GreetingServlet extends HttpServlet {

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
      
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Saudação - JavaServlets</title>");            
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Saudação</h1>");
       
      int hora = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
      
      if(hora < 6) {
        out.println("<span>São "+ (hora)+ "hrs - Vai dormir!!</span>");
      }
      else if(hora < 12) {
        out.println("<span>São "+ (hora)+ "hrs - Bom dia!!</span>");
      }
      else if(hora < 18) {
        out.println("<span>São "+ (hora)+ "hrs - Boa tarde!!</span>");
      }
      else {
        out.println("<span>São "+ (hora)+ "hrs - Boa noite!!</span>");
      }
      
      out.println("<div><br><a href='index.jsp' style='text-decoration:none; color: #00f; font-weight: bold;'>Voltar</a></div>");
      
      out.println("</body>");
      out.println("</html>");
    }
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
