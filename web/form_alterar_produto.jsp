<%-- 
    Document   : form_alterar_produto
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Produto p = new Produto();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO pDAO = new ProdutoDAO();
        p = pDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Produto</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Editar Produto</h1>
        <form name="alterar_produto" action="alterar_produto.do" method="post">
            ID:<%=p.getId() %><br/>
            <input type="hidden" value="<%=p.getId() %>" name="id"/>
            Nome:<input type="text" value="<%=p.getNome() %>" name="nome" size="30" required /><br/>
            Descrição:<input type="text" value="<%=p.getDescricao() %>" name="descricao" size="30" required/><br/>
            Quantidade:<input type="text"  value="<%=p.getQuantidade() %>" name="quantidade" size="5" required/>
            Valor:<input type="text"  value="<%=p.getValor() %>"name="valor" size="5" required/><br/>
            <center> <input class="login100-form-btn" type="submit" value="Salvar"/> </center>
        </form>
             <a class="login100-form-btn" href="listar_produto.jsp?">Voltar</a>
 </div>
 </div>
 </div>
    </body>
</html>
