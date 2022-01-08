/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.ItemVenda;
import modelo.ProdutoDAO;
import modelo.Venda;

/**
 *
 * @author Administrador
 */
public class GerenciarCarrinho extends HttpServlet {

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
            out.println("<title>Servlet GerenciarCarrinho</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            try {
                Venda carrinho = (Venda) session.getAttribute("carrinho");
                ArrayList<ItemVenda> itens = carrinho.getItens();
                String op = request.getParameter("op");
                String red = request.getParameter("red");
                if(op.equals("add")){
                    ItemVenda item = new ItemVenda();
                    int id_produto = Integer.parseInt(request.getParameter("id_produto"));
                    ProdutoDAO pDAO = new ProdutoDAO();
                    item.setProduto(pDAO.carregarPorId(id_produto));
                    item.setQuantidade(1);
                    boolean achou = false;
                    int i=0;
                    for(ItemVenda itemV:itens){
                        if(itemV.getProduto().getId() == id_produto){
                            item.setQuantidade(itemV.getQuantidade()+1);
                            achou = true;
                            break;
                        }
                        i++;
                    }
                    if(!achou){
                        itens.add(item);
                    }else{
                        itens.get(i).setQuantidade(item.getQuantidade());
                    }
                    carrinho.setItens(itens);
                    session.setAttribute("carrinho", carrinho);
                    if(red.equals("catalogo")){
                        response.sendRedirect("catalogo_venda.jsp?op=c");
                    }else if(red.equals("resumo")){
                        response.sendRedirect("resumo_venda.jsp");
                    }
                }else if(op.equals("del")){
                    int index = Integer.parseInt(request.getParameter("item"));
                    ItemVenda item = new ItemVenda();
                    item =  itens.get(index-1);
                    double qtd = item.getQuantidade()-1;
                    
                    if(qtd > 0){
                        itens.get(index-1).setQuantidade(qtd);
                    }else{
                        itens.remove(index-1);
                    } 
                    carrinho.setItens(itens);
                    session.setAttribute("carrinho", carrinho);
                    if(red.equals("catalogo")){
                        response.sendRedirect("catalogo_venda.jsp?op=c");
                    }else if(red.equals("resumo")){
                        response.sendRedirect("resumo_venda.jsp");
                    }
                }else if(op.equals("remove")){
                    int index = Integer.parseInt(request.getParameter("item"));
                    itens.remove(index-1);
                    carrinho.setItens(itens);
                    session.setAttribute("carrinho", carrinho);
                    response.sendRedirect("resumo_venda.jsp");
                }
                
            } catch (Exception e) {
                out.print("Erro:"+e);
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
