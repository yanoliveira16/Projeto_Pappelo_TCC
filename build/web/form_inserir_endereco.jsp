<%-- 
    Document   : form_inserir_endereco
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="modelo.Endereco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Endereço</title>
    </head>
    <body>
        
        <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner_cliente.jsp" %>
        <h1>Novo Endereço</h1>
        
        <form name="inserir_endereco" action="inserir_endereco.do" method="post">
            <input type="hidden" name="cliente_id" value="<%=cLogado.getId() %>"/><br/>
            Rua:<input type="text" name="rua" size="30" required /><br/>
            Cidade:<input type="text" name="cidade" size="30" required/><br/>
            CEP:<input type="text" name="cep" size="30" required/>
            Bairro:<input type="text" name="bairro" size="30" required/><br/>
            Número<input type="text" name="numero" size="5" /><br/>
            Complemento:<input type="text" name="complemento" size="30" /><br/>
            <center>  <input class="login100-form-btn" type="submit" value="Salvar"/> </center>
            
              <a class="login100-form-btn" href="indexCliente.jsp">Voltar</a>
            
 </div>
 </div>
 </div>
        </form>
    </body>
</html>
