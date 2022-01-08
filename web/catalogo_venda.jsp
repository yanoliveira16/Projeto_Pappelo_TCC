<%-- 
    Document   : cartalogo_venda
    Created on : 29/10/2019, 16:13:55
    Author     : Administrador
--%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Venda"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catálogo</title>
    </head>
    <body>

        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <%    
            Venda carrinho = new Venda();
            ArrayList<Produto> produtos = new ArrayList<Produto>();
            try {
                String op = request.getParameter("op");
                ProdutoDAO pDAO = new ProdutoDAO();
                produtos = pDAO.listar();
                
                if(op.equals("n")){
                    int id = Integer.parseInt(request.getParameter("id"));
                    ClienteDAO cDAO = new ClienteDAO();
                    Cliente c = cDAO.carregarPorId(id);
                    carrinho.setCliente(c);
                    carrinho.setUsuario(uLogado);
                    carrinho.setItens(new ArrayList<ItemVenda>());
                    session.setAttribute("carrinho", carrinho);
                }else{
                    carrinho = (Venda) session.getAttribute("carrinho");
                }
            } catch (Exception e) {
                out.print("Erro:"+e);
            }
        %>
        <br/><br/>
         <div class="bannermenu"

        <b>Cliente:</b><%=carrinho.getCliente().getNome_fantasia()%>   <a  href="resumo_venda.jsp"><img src="imagens/carrinho.png" align="center" />(<%=carrinho.getItens().size() %>)</a>
    </div>
        <hr/>
        <center><h1>Catálogo de produtos</h1></center>
        <% for(Produto p:produtos){ %>
        <div style="float: left; margin-right: 30px;">
                <img class="produto" src="imagens/copo_300ml_zero.jpg"/><br/>
             <%=dfu.format(p.getQuantidade())%>  un.
            <%=p.getNome() %><br/>
            R$ <%=p.getValor() %><br/>
            <a class="login100-form-btn" href="gerenciar_carrinho.do?op=add&id_produto=<%=p.getId() %>&red=catalogo"><img src="imagens/novo.png"/></a>
       </div>
        <% } %>
         
        </div>
        </div>
        </div>
    </body>
</html>
