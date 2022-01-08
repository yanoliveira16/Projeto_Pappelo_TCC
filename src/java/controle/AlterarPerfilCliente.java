/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JDialog;
import javax.swing.JOptionPane;
import modelo.Cliente;
import modelo.ClienteDAO;

/**
 *
 * @author Administrador
 */
public class AlterarPerfilCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            
            try {
                Cliente cLogado = (Cliente) session.getAttribute("cliente");;
                String nome_fantasia = request.getParameter("nome_fantasia");
                String telefone = request.getParameter("telefone");
                String senha = request.getParameter("senha");
                String email = request.getParameter("email");
                String cpf_cnpj= request.getParameter("cpf_cnpj");
                String inscricao_estadual= request.getParameter("inscricao_estadual");
                int id = Integer.parseInt(request.getParameter("id"));
                
                if (!nome_fantasia.isEmpty() && !telefone.isEmpty()) {
                    Cliente c = new Cliente();
                    ClienteDAO cDAO = new ClienteDAO();
                    c.setId(id);
                    c.setNome_fantasia(nome_fantasia);
                    c.setTelefone(telefone);
                    c.setEmail(email);
                    c.setSenha(senha);
                    c.setCpf_cnpj(cpf_cnpj);
                    c.setInscricao_estadual(inscricao_estadual);
                   
                    
                    try{
                    cDAO.alterar(c); 
                    response.sendRedirect("indexCliente.jsp");
                    }catch(Exception e) {
                    out.print("Erro:" + e);
                        
                    }
             
                    out.print("Algum campo obrigatório não foi preenchido!");
                }
            } catch (Exception e) {
                out.print("Erro:" + e);
            }
            
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
