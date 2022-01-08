<%-- 
    Document   : newjspresumo_venda
    Created on : 30/10/2019, 14:33:33
    Author     : Administrador
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.Venda"%>
<%
    Venda carrinho = new Venda();
    try{
        carrinho = (Venda) session.getAttribute("carrinho");
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
      <%@include file="banner.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resumo da venda</title>
    </head>
    <body>
        <h1>Resumo da venda</h1>
        Vendedor:<%=carrinho.getUsuario().getNome() %><br/><br/>
        Cliente:<%=carrinho.getCliente().getNome_fantasia()%><br/><br/>
        <h2>Itens no carrinho</h2>
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
             for(ItemVenda iv:carrinho.getItens()){
                 total += (iv.getQuantidade() * iv.getProduto().getValor());
             %>
            <tr>
                <td align="center"><%=i %></td>
                <td ><%=iv.getProduto().getNome() %></td>
                <td align="center"><%=dfu.format(iv.getProduto().getQuantidade())%></td>
                <td align="center"><a class="login100-form-btn" href="gerenciar_carrinho.do?item=<%=i %>&op=del&red=resumo"><img src="imagens/del.png" align="center" hspace="8"/></a> <%=iv.getQuantidade() %> <a class="login100-form-btn" href="gerenciar_carrinho.do?id_produto=<%=iv.getProduto().getId() %>&op=add&red=resumo"><img src="imagens/novo.png" align="center" hspace="8"/></a></td>
                <td align="right"><%=df.format(iv.getProduto().getValor()) %></td>
                <td align="right"><%=df.format(iv.getQuantidade() * iv.getProduto().getValor())%></td>
                <td align="center"><a class="login100-form-btn" href="gerenciar_carrinho.do?item=<%=i %>&op=remove"><img src="imagens/excluir.png"/></a></td>

            </tr>
             </tbody>
             <%
                 i++;
             }
             %>
             <tr>
                 <td colspan="5">TOTAL</td>
                  <td align="right"><%=df.format(total) %></td>
                  <td colspan="5" </td>
             </tr>
        </table>
        <br/><br/>
        <table width="80%" border="0">
            <tr>
                <td><a href="catalogo_venda.jsp?op=c"><input class="login100-form-btn" type="button" value="Voltar para o catálogo" /></a></td>
                <td align="right"><a  href="finalizar_venda.do"><input class="login100-form-btn" type="button" value="Finalizar Compra"/></a></td>
            </tr>
        </table>
 </div>
 </div>
 </div>
    </body>
</html>
