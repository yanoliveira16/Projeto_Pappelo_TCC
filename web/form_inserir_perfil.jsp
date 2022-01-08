<%-- 
    Document   : form_inserir_perfil
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Perfil</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Novo Perfil</h1>
        <form name="inserir_perfil" action="inserir_perfil.do" method="post">
            Nome:<input type="text" name="nome" size="30" required /><br/>
            Descrição:<input type="text" name="descricao" size="30" required/><br/>
            <input type="submit" value="Salvar"/>
        </form>
         <a class="login100-form-btn" href="listar_perfil.jsp?">Voltar</a>
 </div>
 </div>
 </div>
    </body>
</html>
