<%-- 
    Document   : form_inserir_produto
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Produto</title>
    </head>
    <body>
   <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Novo Produto</h1>
        <form name="inserir_produto" action="inserir_produto.do" method="post">
            Nome:<input type="text" name="nome" size="30" required /><br/>
            Descrição:<input type="text" name="descricao" size="30" required/><br/>
            Quantidade:<input type="text" name="quantidade" size="5" required/>
            Valor:<input type="text" name="valor" size="5" required/><br/>
            <center>  <input class="login100-form-btn" type="submit" value="Salvar"/></center>
        </form>
         <a class="login100-form-btn" href="listar_produto.jsp?">Voltar</a>
 </div>
 </div>
 </div>
    </body>
</html>
