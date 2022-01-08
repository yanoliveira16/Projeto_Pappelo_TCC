<%-- 
    Document   : form_alterar_endereco
    Created on : 13/11/2019, 15:11:12
    Author     : Administrador
--%>

<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Endereco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Endereco ee = new Endereco();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        ClienteDAO cDAO = new ClienteDAO();
        ee = cDAO.carregarPorIdEndereco(id);
    }catch(Exception er){
        out.print("Erro:"+er);
    }
    
%>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
           <link rel="stylesheet" type="text/css" href="css/util.css">
       <link rel="stylesheet" type="text/css" href="css/main.css">
       <link rel="stylesheet" type="text/css" href="css/css.css">
        
    </head>
    
     
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">

       

 <div class="main">
        <%@include file="banner.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Endereço</title>
    </head>
    <body>
        
        
        
        
        
        
        
        <h1>Alterar Seu Endereço</h1>
        
            <table class="table" border="1">
       
                
                <form name="alterar_endereco_vendedor" action="alterar_endereco_vendedor.do" method="post">
            <th>ID CLIENTE:<%=ee.getCliente().getId() %><input type="hidden" name="cliente_id" value="<%=ee.getCliente().getId() %>"/><br/></th>
            <th>ID ENDEREÇO:<%=ee.getId() %><input type="hidden" name="id" value="<%=ee.getId() %>"/><br/></th>
           <th> Rua:<input type="text" value="<%=ee.getRua() %>" name="rua" size="30" required /><br/></th>
           <th> Cidade:<input type="text" value="<%=ee.getCidade() %>" name="cidade" size="30" required/><br/></th>
           <th> Cep:<input type="text" value="<%=ee.getCep() %>" name="cep" size="30" required/><br/></th>
           <th> Bairro:<input type="text" value="<%=ee.getBairro() %>" name="bairro" size="30" required/><br/></th>
            <th>Numero:<input type="text" value="<%=ee.getNumero() %>" name="numero" size="30" /><br/></td></th>
            <th>Complemento:<input type="text" value="<%=ee.getComplemento()%>" name="complemento" size="30" /><br/></th>
            <th><input class="login100-form-input" type="submit" value="Salvar"/></th>
          </table>
            
        </form>
             <center> <a class="login100-form-btn" href="listar_cliente.jsp?">Voltar</a> </center>         
            
 </div>
</div>
        </div>
    </body>
</html>
