<%-- 
    Document   : ver_meus_pedidos
    Created on : 07/11/2019, 15:29:30
    Author     : Administrador
--%>

<%@page import="modelo.Endereco"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
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
        <div class="main">
    
        <%@include file="banner_cliente.jsp"%>
        
        <%
ArrayList<Pedido> lista = new ArrayList<Pedido>();
try{
   PedidoDAO vDAO = new PedidoDAO();
   lista = vDAO.listarMeusPedidos(cLogado.getId());
}catch(Exception e){
    out.print("Erro:"+e);
}

Endereco ez = new Endereco();

%>

<% SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");%> 
          

<center> <h1>Lista de Pedidos</h1></center>
        <table class="table" border="1">
            <tr>
                <th>ID</th>
                <th>Cliente</th>
                <th>Data Pedido</th>
                <th>Cor do Prototipo</th>
                <th>Forma de Pagamento</th>
                <th>Data Pagamento</th>
                <th>Data Entrega</th>
                <th> <Opções</th>
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
                    if(v.getData_pagamento()==null){
                    %>
                      <a class="login100-form-btn" href="alterar_pedido_cliente.jsp?idPedido=<%=v.getId()%>"> <img src="imagens/alterar.png"/>  Alterar seu pedido </a> 
  
                    <% } %> 
                        
                     <% 
                    if(v.getImagem_prototipo() ==null && v.getForma_pagamento() ==null) {
                    %>
                        <form action="form_fundo_embalagem.jsp?idPedido=<%=v.getId()%>" method="get">
                        <a class="login100-form-btn" href="form_fundo_embalagem.jsp?idPedido=<%=v.getId()%>"><img src="imagens/menu.png"/> Adcionar cor e forma de pagamento ao pedido </a>
                        </form>
                        <% } %>    

                        <a class="login100-form-btn" href="recibo_pedido.jsp?idPedido=<%=v.getId() %>"><img src="imagens/impressora.png"/> Recibo Pedido </a>
                       
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


