<%-- 
    Document   : newjspresumo_venda
    Created on : 30/10/2019, 14:33:33
    Author     : Administrador
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ItemPedidoCliente"%>
<%@page import="modelo.Pedido"%>
<%
    Pedido carrinho = new Pedido();
    try{
        carrinho = (Pedido) session.getAttribute("carrinho");
    }catch(Exception e){
        out.print("Erro:"+e);
    }
    

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner_cliente.jsp" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link rel="stylesheet" type="text/css" href="css/util.css">
       <link rel="stylesheet" type="text/css" href="css/main.css">

       <link rel="stylesheet" type="text/css" href="css/css.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
        <div class="main">
        <title>Resumo do Pedido</title>
    </head>
    <body>
        <h1>Resumo do Pedido</h1>
        ID:<%=carrinho.getCliente().getId()%> 
        Cliente:<%=carrinho.getCliente().getNome_fantasia()%><br/><br/>
        <h2>Itens no carrinho</h2>
      
       <div class="container">
    <table class="table" class="bordered striped centered highlight responsive-table" border="1" >
        <thead>
               <tr>
                <th align="center" width="10%">Item</th>
                <th align="center" width="25%">Produto</th>
                <th align="center" width="10%">Quantidade de copos</th>
                <th align="center" width="15%">QDT</th>
                <th align="center" width="20%">Valor</th>
                <th align="center" width="20%">Sub Total</th>
                <th align="center" width="10%">Remover</th>
            </tr>
            </thead>
            <tbody>
            <% 
             int i=1;
             double total = 0;
             for(ItemPedidoCliente ivc:carrinho.getItens()){
                 total += (ivc.getQuantidade() * ivc.getProduto().getValor());
               
             %>
            <tr>
                <td align="center"><%=i %></td>
                <td ><%=ivc.getProduto().getNome() %></td>
                <td align="center"><%=dfu.format(ivc.getProduto().getQuantidade())%></td>
                <td align="center"><a href="gerenciar_carrinho_cliente.do?item=<%=i %>&op=del&red=resumo"><img src="imagens/del.png" align="center" hspace="8"/></a> <%=ivc.getQuantidade() %> <a href="gerenciar_carrinho_cliente.do?id_produto=<%=ivc.getProduto().getId() %>&op=add&red=resumo"><img src="imagens/novo.png" align="center" hspace="8"/></a></td>
                <td align="right"><%=df.format(ivc.getProduto().getValor()) %></td>
                <td align="right"><%=df.format(ivc.getQuantidade() * ivc.getProduto().getValor())%></td>
                <td align="center"><a href="gerenciar_carrinho_cliente.do?item=<%=i %>&op=remove"><img src="imagens/excluir.png"/></a></td>
            </tr>
            </tbody>
             <%
                 i++;
             }
             %>
             <tr>
                 <td colspan="5">TOTAL</td>
                 <td align="right"><%=df.format(total) %></td>
                 <td colspan="5"</td>
             </tr>
        </table>
        <br/><br/>
        <table width="80%" border="0">
            <tr>
                <td><a href="catalogo_cliente.jsp?op=c"><input class="login100-form-btn" type="button" value="Voltar para o catálogo" /></a></td>
                <td align="right"><a href="finalizar_pedido.do"><input class="login100-form-btn" type="button" value="Finalizar Pedido"/></a></td>
            </tr>
        </table>
        </div>
        </div>       
        </div>       
        </div>       
    
    
    
  
    
    </body>
</html>
