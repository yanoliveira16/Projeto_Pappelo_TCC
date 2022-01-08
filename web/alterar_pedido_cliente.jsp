<%-- 
    Document   : newjspresumo_venda
    Created on : 30/10/2019, 14:33:33
    Author     : Administrador
--%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="modelo.ItemPedidoCliente"%>
<%
    Pedido carrinho = new Pedido();
    try{
        int idPedido = Integer.parseInt(request.getParameter("idPedido"));
        PedidoDAO pDAO = new PedidoDAO();
        carrinho = pDAO.carregarPorId(idPedido);
        carrinho.setCliente((Cliente) session.getAttribute("cliente"));
        session.setAttribute("carrinho", carrinho);
        response.sendRedirect("catalogo_cliente.jsp?op=c");
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>
