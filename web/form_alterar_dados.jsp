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
    Cliente cp = new Cliente();
    try{
        ClienteDAO cDAO = new ClienteDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        cp = cDAO.carregarPorId(id);

    }catch(Exception e){
        out.print("Erro:"+e);
    }
    
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Dados</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
        <div class="main">
        <%@include file="banner_cliente.jsp" %>
        <h1>Altere seus dados</h1>
          <table class="table" border="1">
        <form name="alterar_perfil_cliente" action="alterar_perfil_cliente.do" method="post">
           <input type="hidden" name="id" value="<%=cp.getId() %>"/><br/>

            <tr>
                <th>Nome/Fantasia</th>
                <th>CPF/CNPJ</th>
                <th>Telefone</th>
                <th>Email</th>
                <th>Senha</th>
                <th>Inscrição Estadual</th>
                <th>Opções</th>
            </tr>
            
            <td><input type="text" name="nome_fantasia" value="<%=cp.getNome_fantasia()%>" size="30" /><br/></td>
            <td><input type="text" name="cpf_cnpj" value="<%=cp.getCpf_cnpj() %>" size="30" /><br/></td>
            <td><input type="text" name="telefone" value="<%=cp.getTelefone() %>" size="30" /><br/></td>
            <td><input type="text" name="email" value="<%=cp.getEmail() %>" size="30" required/><br/></td>
            <td><input type="password" name="senha" value="<%=cp.getSenha()%>" size="30" /></td>
            <td><input type="text" name="inscricao_estadual" value="<%=cp.getInscricao_estadual()%>" size="30" /><br/></td>
            <td><input class="login100-form-input" type="submit" value="Salvar"/></td>
          </table>
            
        </form>
             <a class="login100-form-btn" href="perfil_cliente.jsp?">Voltar</a>
        </div>
</div>
</div>
    </body>
</html>
