<%-- 
    Document   : form_inserir_cliente
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>
<%@page import="modelo.Endereco"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%
    Cliente c = new Cliente();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        ClienteDAO cDAO = new ClienteDAO();
        c = cDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
    
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Cliente</title>
    </head>
    <body>
    <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<body>
<div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        
        <h1>Alterar Cliente</h1>
        <form name="alterar_cliente" action="alterar_cliente.do" method="post">
            ID:<%=c.getId() %><input type="hidden" name="id" value="<%=c.getId() %>"/><br/>
            Nome Fantasia:<input type="text" name="nome_fantasia" value="<%=c.getNome_fantasia()%>" size="30" required /><br/>
            Telefone:<input type="text" name="telefone" value="<%=c.getTelefone() %>" size="30" required/><br/>
            Senha:<input type="password" name="senha" value="<%=c.getSenha() %>" size="30" required/><br/>
            CPF/CNPJ:<input type="text" name="cpf_cnpj" value="<%=c.getCpf_cnpj() %>" size="30" required/><br/>
            E-mail:<input type="text" name="email" value="<%=c.getEmail() %>" size="30" required/><br/>
            Inscrição Estadual:<input type="text" name="inscricao_estadual" value="<%=c.getInscricao_estadual()%>" size="30" /><br/>
           
            
            <center><input class="login100-form-btn" type="submit" value="Salvar"/></center>
        </form>
             <a class="login100-form-btn" href="listar_cliente.jsp?">Voltar</a>
 </div>
 </div>
 </div>
    </body>
</html>
