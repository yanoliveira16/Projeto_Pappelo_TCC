<%-- 
    Document   : form_gerenciar_menu_perfil
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Menu"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<body>
<div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner_cliente.jsp" %>
        
        <%
    Cliente cp = new Cliente();
    try{
        ClienteDAO cDAO = new ClienteDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        cp = cDAO.carregarPorId(cLogado.getId());

    }catch(Exception e){
        out.print("Erro:"+e);
    }
    



%>

         <br/><br/>  Nome: <%=cLogado.getNome_fantasia()%><br/> 
            <input type="hidden" value="<%=cLogado.getId() %>" name="id"/>
                    
        <h1>Seu Perfil</h1>
<html>
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(nome_fantasia,id){
                if(confirm("Tem certeza que deseja excluir o endereco"+nome_fantasia+"?")){
                    window.open("excluir_endereco.do?id="+id,"_self");
                }
            }
        </script>
        
 

<script>
  function alert(){
    confirm("Será necessario relogar para as ver as mudanças");
  }
</script>



        
        
        <title>Seu Perfil</title>
    </head>
    
             <table class="table" class="bordered striped centered highlight responsive-table" border="1" width="100%" aling="center">
                 <thead> 
                 <tr>
                <th>Nome/Fantasia</th>
                <th>Telefone</th>
                <th>CPF/CNPJ</th>
                <th>Email</th>
                <th>Inscrição estadual</th>
                <th>Opçoes</th>
                 </thead>
                 <tbody>
            </tr>

            <td align="center"><%=cp.getNome_fantasia()%></td>
            <td align="center"><%=cp.getTelefone()%></td>
            <td align="center"><%=cp.getCpf_cnpj() %></td>
            <td align="center"><%=cp.getEmail() %></td>
            <td align="center"><%=cp.getInscricao_estadual()%></td>
            
            <td aling="center" width="40%"> <a class="login100-form-btn" href="form_gerenciar_endereco_cliente.jsp?id=<%=cLogado.getId() %>"><img src="imagens/menu.png"> Gerenciar seus Endereços </a> 
            <a class="login100-form-btn" href="form_alterar_dados.jsp?id=<%=cp.getId() %>"><img src="imagens/alterar.png"/> Alterar seu dados </a></td>
            </tbody>
              </table>    
         
 
        
            
            
          
</head>
<body>




</body>
         
         
         
         
               

 </div>
</div>
</div>
</html>
