<%-- 
    Document   : listar_cliente
    Created on : 20/08/2019, 16:31:21
    Author     : Administrador
--%>

<%@page import="modelo.Endereco"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    
ArrayList<Cliente> lista = new ArrayList<Cliente>();
try{
   ClienteDAO cDAO = new ClienteDAO();
   lista = cDAO.listar();
 
}catch(Exception e){
    out.print("Erro:"+e);
}

Endereco ey = new Endereco();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(nome,id){
                if(confirm("Atenção, para exclusão do cliente é necessário apagar primeiro o endereço!\n\
                            Tem certeza que deseja excluir o cliente " + nome + " ?")){
                    window.open("excluir_cliente.do?id="+id,"_self");
                }
            }
        </script>
        <title>Lista de Clientes</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<body>
<div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        
        <h1>Lista de Clientes<a  class="login100-form-btn" href="form_inserir_cliente.jsp"><img src="imagens/novo.png"/>Inserir Novo Cliente</a></h1>
        <table class="table"  border="1" >
     
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Email</th>
                <th>Opções</th>
            </tr>
        
         
                 
            <%
            for(Cliente c:lista){
            %>
            
            <tr>
                <td><%=c.getId() %></td>
                <td><%=c.getNome_fantasia()%></td>
                <td><%=c.getTelefone()%></td>
                <td><%=c.getEmail()%></td>
                
                
                   
                <td><a class="login100-form-btn" href="form_alterar_cliente.jsp?id=<%=c.getId() %>">     <img src="imagens/alterar.png"/>Alterar dados </a> <a class="login100-form-btn" class="login100-form-btn" href="#" onclick="excluir('<%=c.getNome_fantasia()%>',<%=c.getId() %>)"><img src="imagens/excluir.png"/> Excluir</a> <a class="login100-form-btn" href="catalogo_venda.jsp?id=<%=c.getId() %>&op=n"><img src="imagens/carteira.png"/>Fazer uma venda </a>                  <a class="login100-form-btn" href="form_gerenciar_endereco_cliente_vendedor.jsp?id=<%=c.getId() %>"><img src="imagens/menu.png"/> Gerenciar endereços</a>
 </td>
               
            </tr>            
        
            <%    
            } 
            %>   
        </table>
        </div>
        </div>
        </div>
        
    </body>
</html>
