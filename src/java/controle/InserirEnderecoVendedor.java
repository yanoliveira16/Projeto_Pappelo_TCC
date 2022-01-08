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
import modelo.Cliente;
import modelo.Endereco;
import modelo.ClienteDAO;

/**
 *
 * @author Administrador
 */
public class InserirEnderecoVendedor extends HttpServlet {

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
            out.println("<title>Servlet InserirEndereco</title>");            
            out.println("</head>");
            out.println("<body>");
           
            try {
                String rua = request.getParameter("rua");
                String cidade = request.getParameter("cidade");
                String cep = request.getParameter("cep");
                String bairro = request.getParameter("bairro");
                String numero = request.getParameter("numero");
                String complemento = request.getParameter("complemento");
                int cliente_id = Integer.parseInt(request.getParameter("cliente_id"));
                out.print("cliente_id:"+request.getParameter("cliente_id"));
                
                
                if (!rua.isEmpty() && !cidade.isEmpty()&& !cep.isEmpty()&& 
                        !bairro.isEmpty()&& !complemento.isEmpty()) {
                    Endereco e = new Endereco();
                    ClienteDAO cDAO = new ClienteDAO();
                    e.setRua(rua);
                    e.setCidade(cidade);
                    e.setCep(cep);
                    e.setBairro(bairro);
                    e.setNumero(numero);
                    e.setComplemento(complemento);
                    Cliente c = new Cliente();
                    c.setId(cliente_id);
                    e.setCliente(c);
                    cDAO.inserir(e);
                    response.sendRedirect("listar_cliente.jsp");
                } else {
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
