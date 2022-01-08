<%-- 
    Document   : catalogo_cliente
    Created on : 18/11/2019, 15:55:45
    Author     : Administrador
--%>

<%@page import="modelo.ItemPedidoCliente"%>
<%@page import="modelo.Pedido"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
        <div class="main">
          
        
        <%@include file="banner_cliente.jsp" %>
        <%    
            Pedido carrinhos = new Pedido();
            ArrayList<Produto> produtos = new ArrayList<Produto>();
            try {
                String op = request.getParameter("op");
                ProdutoDAO pDAO = new ProdutoDAO();
                produtos = pDAO.listar();
                
                if(op.equals("np")){
                    carrinhos.setCliente(cLogado);
                    carrinhos.setItens(new ArrayList<ItemPedidoCliente>());
                    session.setAttribute("carrinho", carrinhos);
                }else{
                    carrinhos = (Pedido) session.getAttribute("carrinho");
                }
            } catch (Exception e) {
                out.print("Erro:"+e);
            }
        %>
        <br/><br/>
         <div class="bannermenu"
        <b>Carrinho<b/> <a href="resumo_venda_cliente.jsp"><img src="imagens/carrinho.png" align="center" />(<%=carrinhos.getItens().size() %>)</a>
         </div>
          <center><h1>Catálogo de produtos</h1></center>
        </p>
        <hr/>
          <center> 
       
      <% for(Produto p:produtos){ %>
        <div id="divC">
            <img class="produto" src="imagens/copo_300ml_zero.jpg"/><br/>
            <%=dfu.format(p.getQuantidade())%>  un.
            <%=p.getNome() %><br/>
            <%=df.format(p.getValor()) %><br/>
            <a class="login100-form-btn" href="gerenciar_carrinho_cliente.do?op=add&id_produto=<%=p.getId() %>&red=catalogo"><img src="imagens/novo.png"/></a>
        </div>
        <% } %>
                </center>

          </div>
        </div>
        </div>
    </body>
</html>
