<%-- 
    Document   : listar_venda
    Created on : 20/08/2019, 16:31:21
    Author     : Administrador
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="modelo.Venda"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
ArrayList<Venda> lista = new ArrayList<Venda>();
try{
   VendaDAO vDAO = new VendaDAO();
   lista = vDAO.listar();
}catch(Exception e){
    out.print("Erro:"+e);
    
    
}
%>

<% SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(id){
                if(confirm("Tem certeza que deseja excluir o venda:"+id+"?")){
                    window.open("excluir_venda.do?id="+id,"_self");
                }
            }
        </script>
        <title>Lista de Vendas</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Lista de Vendas <a  class="login100-form-btn" href="listar_cliente.jsp"><img src="imagens/novo.png"/>Fazer nova venda</a></h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Cliente</th>
                <th>Vendedor</th>
                <th>Data Venda</th>
                <th>Data Pagamento</th>
                <th>Data Entrega</th>
                <th>Opções</th>
            </tr>
            <%
            for(Venda v:lista){
            %>
            <tr>
                <td><%=v.getId() %></td>
                <td><%=v.getCliente().getNome_fantasia()%></td>
                <td><%=v.getUsuario().getNome() %></td>
                <td><%=sdf.format(v.getData_venda()) %></td>
                <% 
                    if(v.getData_pagamento()!=null){ 
                    %>
                    <td><%=sdf.format(v.getData_pagamento()) %></td>
                 <% } %>
                  <% 
                    if(v.getData_entrega()!=null){                        
                    %>
                <td><%=sdf.format(v.getData_entrega()) %></td>
                 <% } %>
 
                <td>
                    <% 
                    if(v.getData_pagamento()==null){
                    %>
                        <a class="login100-form-btn" href="alterar_venda.jsp?id=<%=v.getId() %>"><img src="imagens/alterar.png"/></a> 
                    <% } %> 
                    <% 
                    if(v.getData_pagamento() !=null){
                    %>
                    <img  src="imagens/pag_x.png"/>
                    <% }else{ %>
                        <a class="login100-form-btn" href="registrar_pagamento.do?id=<%=v.getId() %>"><img src="imagens/pag.png"/></a> 
                    <% } %>    
                    <% 
                    if(v.getData_entrega()!=null){
                    %>
                        <img src="imagens/entrega_x.png"/>
                    <% }else{ %>
                        <a class="login100-form-btn" href="registrar_entrega.do?id=<%=v.getId() %>"><img src="imagens/entrega.png"/></a>
                    <% } %> 
                    <% 
                    if(v.getData_pagamento() !=null){
                    %>
                        <a class="login100-form-btn"  href="recibo_venda.jsp?id=<%=v.getId() %>"><img src="imagens/impressora.png"/>Recibo </a>
                    <% } %>
                     
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
