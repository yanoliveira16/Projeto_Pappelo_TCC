<%-- 
    Document   : form_gerenciar_menu_perfil
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="modelo.Endereco"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(rua,id){
                if(confirm("Tem certeza que deseja excluir o endereco"+rua+"?")){
                    window.open("excluir_endereco.do?id="+id,"_self");
                }
            }
        </script>
        <title>Seus Endereços</title>
    </head>
    <body>
        
        <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">


<div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
<div class="main">
        <%@include file="banner_cliente.jsp" %>
        
    
         <br/><br/>    Nome:<%=c.getNome_fantasia()%><br/>
            <input type="hidden" value="<%=c.getId() %>" name="id"/>
                    </form>
                    <table>
                        <tr>  
                  
                    
                             <th widght="50%"> <h1>Seus Endereços</h1></th> <td><a class="login100-form-btn" href="form_inserir_endereco.jsp"><img src="imagens/novo.png"/>Adcionar novo Endereço</a>
                        </td>
                        </tr>
                    </table>
        <table class="table" border="1" >
            <tr>
                <th>ID</th>
                <th>Rua</th>
                <th>Cidade</th>
                <th>Cep</th>
                <th>Complemento</th>
                <th>Número</th>
                <th>Opções</th>
            </tr>
            <%
            for(Endereco e:c.getEnderecos()){
            %>
            <tr>
                <td><%=e.getId() %></td>
                <td><%=e.getRua() %></td>
                <td><%=e.getCidade() %></td>
                <td><%=e.getCep() %></td>
                <td><%=e.getComplemento() %></td>
                <td><%=e.getNumero() %></td>
                <td><a class="login100-form-btn" href="form_alterar_endereco.jsp?id=<%=e.getId() %>"><img src="imagens/alterar.png"/></a> <a class="login100-form-btn" href="#" onclick="excluir('<%=e.getRua() %>',<%=e.getId() %>)"><img src="imagens/excluir.png"/></a></td>
            </tr>            
            <%    
            } 
            %>  
        </table>
   <center> <a class="login100-form-btn" href="indexCliente.jsp?">Voltar</a> </center>
    </div>
</div>
</div>
</html>
