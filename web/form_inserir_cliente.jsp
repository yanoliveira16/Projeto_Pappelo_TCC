<%-- 
    Document   : form_inserir_cliente
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="modelo.Endereco"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Cliente</title>
    </head>
    <body>
           <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Novo Cliente</h1>
        
        <form name="inserir_cliente" action="inserir_cliente.do" method="post">
            Nome/Fantasia:<input type="text" name="nome_fantasia" size="30" required /><br/>
            Telefone:<input type="text" name="telefone" size="30" required/><br/>
            Senha:<input type="password" name="senha" size="30" required/><br/>
            CPF/CNPJ:<input type="text" name="cpf_cnpj" size="30" required/><br/>
            E-mail:<input type="text" name="email" size="30" required/><br/>
            Inscrição Estadual:<input type="text" name="inscricao_estadual" size="30" /><br/>
            
            <h2>Endereço:</h2><br/>
            
            Rua:<input type="text" name="rua" size="30" required /><br/>
            Cidade:<input type="text" name="cidade" size="30" required/><br/>
            Cep:<input type="text" name="cep" size="30" required/><br/>
            Bairro:<input type="text" name="bairro" size="30" required/><br/>
            Numero:<input type="text" name="numero" size="30" required/><br/>
            Complemento:<input type="text" name="complemento" size="30" /><br/>
            
            <center> <input class="login100-form-btn" type="submit" value="Salvar"/></center>
        </form>
         <a class="login100-form-btn" href="listar_cliente.jsp?">Voltar</a>
 </div>
 </div>
 </div>
    </body>
</html>
