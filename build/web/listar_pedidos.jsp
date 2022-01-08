<%-- 
    Document   : listar_venda
    Created on : 20/08/2019, 16:31:21
    Author     : Administrador
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
ArrayList<Pedido> lista = new ArrayList<Pedido>();
try{
   PedidoDAO vDAO = new PedidoDAO();
   lista = vDAO.listar();
}catch(Exception e){
    out.print("Erro:"+e);
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(titulo,id){
                if(confirm("Tem certeza que deseja excluir o venda:"+titulo+"?")){
                    window.open("excluir_venda.do?id="+id,"_self");
                }
            }
        </script>
        <title>Lista de Pedidos</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <% SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");%> 
        <h1>Lista de Pedidos</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Cliente/ID</th>
                <th>Data Pedido</th>
                <th>Cor do Prototipo</th>
                <th>Forma de Pagamento</th>
                <th>Data Pagamento</th>
                <th>Data Entrega</th>
                <th>Opções</th>
            </tr>
            <%
            for(Pedido v:lista){
            %>
            <tr>
                <td><%=v.getId() %></td>           
             
                <td><%=v.getCliente().getNome_fantasia()%></td>
                <td><%=sdf.format(v.getData_pedido()) %></td>
                <td><%=v.getImagem_prototipo() %></td>
                <td><%=v.getForma_pagamento() %></td>
                
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
                    if(v.getData_pagamento() !=null){
                    %>
                    <img src="imagens/pag_x.png"/>
                    <% }else{ %>
                        <a class="login100-form-btn" href="registrar_pagamento_cliente.do?id=<%=v.getId() %>"><img src="imagens/pag.png"/>Confirmar pagamento</a> 
                    <% } %>    
                    <% 
                    if(v.getData_entrega()!=null){
                    %>
                        <img src="imagens/entrega_x.png"/>
                    <% }else{ %>
                        <a class="login100-form-btn" href="registrar_entrega_cliente.do?id=<%=v.getId() %>"><img src="imagens/entrega.png"/>Confirmar entrega</a>
                    <% } %> 
                    <% 
                    if(v.getData_pagamento() !=null){
                    %>
                        <a class="login100-form-btn" href="recibo_pedido_vendedor.jsp?idPedido=<%=v.getId() %>"><img src="imagens/impressora.png"/>Recibo</a>
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
