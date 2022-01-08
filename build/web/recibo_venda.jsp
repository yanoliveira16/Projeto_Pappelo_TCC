<%-- 
    Document   : newjspresumo_venda
    Created on : 30/10/2019, 14:33:33
    Author     : Administrador
--%>
<%@page import="java.text.SimpleDateFormat"%>
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
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recibo da venda</title>
    </head>
    <body>
        
        <div class="main">
         <%@include file="banner.jsp"%>
        <h1>Recibo</h1>
        Vendedor:<%=carrinho.getUsuario().getNome() %><br/><br/>
        Cliente:<%=carrinho.getCliente().getNome_fantasia()%><br/><br/>
        <h2>Itens no carrinho</h2>
        <table border="0">
            <tr>
                <th align="center">Item</th>
                <th align="center">Produto</th>
                <th align="center">QDT</th>
                <th align="center">Valor</th>
                <th align="center">Sub Total</th>
            </tr>
            <% 
             int i=1;
             double total = 0;
             for(ItemVenda iv:carrinho.getItens()){
                 total += (iv.getQuantidade() * iv.getProduto().getValor());
             %>
            <tr>
                <td align="center"><%=i %></td>
                <td ><%=iv.getProduto().getNome() %></td>
                <td align="center"><%=iv.getQuantidade() %></td>
                <td align="right"><%=iv.getProduto().getValor() %></td>
                <td align="right"><%=(iv.getQuantidade() * iv.getProduto().getValor()) %></td>
            </tr>
             <%
                 i++;
             }
             %>
             <tr>
                 <td colspan="4">TOTAL</td>
                 <td align="right"><%=total %></td>
             </tr>
        </table>
        </div>     
    </body>
</html>
