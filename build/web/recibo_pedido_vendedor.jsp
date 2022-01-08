<%-- 
    Document   : newjspresumo_venda
    Created on : 30/10/2019, 14:33:33
    Author     : Administrador
--%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Endereco"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ItemPedidoCliente"%>
<%@page import="modelo.Pedido"%>


<%
    Pedido carrinho = new Pedido();
    try{
        int idPedido = Integer.parseInt(request.getParameter("idPedido"));
        PedidoDAO vDAO = new PedidoDAO();
        carrinho = vDAO.carregarPorId(idPedido);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
    


%>

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recibo do Pedido</title>
    </head>
    <body>
        <h1>Recibo</h1>
        
        Cliente:<%=carrinho.getCliente().getId() %>  <%=carrinho.getCliente().getNome_fantasia() %>  <br/><br/>
        <% SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");%> 
        <h2>Seu Recibo</h2>
       <table class="table" >
            <tr>
                <th align="center" >Item</th>
                <th align="center">Produto</th>
                <th align="center">QDT</th>
                <th align="center">Valor</th> 
                <th align="center" >Data do Pedido</th>
                <th align="center">Data de Entrega</th>
                <th align="center">Data de Pagamento</th>
                <th align="center">Cor do Prototipo</th>
                <th align="center">Forma de Pagamento</th>
                <th align="center">Sub Total</th>
            </tr>
            <% 
             int i=1;
             double total = 0;
              
           
            
             for(ItemPedidoCliente iv:carrinho.getItens()){
                 total += (iv.getQuantidade() * iv.getProduto().getValor());
             %>
            <tr>
                <td align="center" ><%=i %></td>
                <td ><%=iv.getProduto().getNome() %></td>
                <td align="center"><%=iv.getQuantidade() %></td>
                <td align="center"><%=iv.getProduto().getValor() %></td>
                <td align="center"><%=sdf.format(carrinho.getData_pedido()) %></td>
                 <% 
                    if(carrinho.getData_pagamento()!=null){ 
                    %>
                    <td><%=sdf.format(carrinho.getData_pagamento()) %></td>
                 <% } %>
                  <% 
                    if(carrinho.getData_entrega()!=null){                        
                    %>
                <td><%=sdf.format(carrinho.getData_entrega()) %></td>
                 <% } %>
             
                
                <td align="center"><%=carrinho.getImagem_prototipo() %></td>
                <td align="center"><%=carrinho.getForma_pagamento() %></td>
                <td align="center"><%=df.format(iv.getQuantidade() * iv.getProduto().getValor()) %></td>
            </tr>
             <%
                 i++;
             }
             %>
             <tr>
                 <td colspan="9" aling="right"></td>
                 <td colspan="10" aling="center"> Total <%=df.format(total) %></td>
             </tr>
              
        </table>
            
            
            
             
</div>
</div>
</div>
    </body>
</html>
