<%-- 
    Document   : newjspresumo_venda
    Created on : 30/10/2019, 14:33:33
    Author     : Administrador
--%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.Venda"%>
<%
    Venda carrinho = new Venda();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        VendaDAO vDAO = new VendaDAO();
        carrinho = vDAO.carregarPorId(id);
        carrinho.setUsuario((Usuario) session.getAttribute("usuario"));
        session.setAttribute("carrinho", carrinho);
        response.sendRedirect("catalogo_venda.jsp?op=c");
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>
