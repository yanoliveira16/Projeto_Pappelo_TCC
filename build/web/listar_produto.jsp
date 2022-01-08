<%-- 
    Document   : listar_produto
    Created on : 20/08/2019, 16:31:21
    Author     : Administrador
--%>

<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
ArrayList<Produto> lista = new ArrayList<Produto>();
try{
   ProdutoDAO pDAO = new ProdutoDAO();
   lista = pDAO.listar();
}catch(Exception e){
    out.print("Erro:"+e);
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(nome,id){
                if(confirm("Tem certeza que deseja excluir o produto:"+nome+"?")){
                    window.open("excluir_produto.do?id="+id,"_self");
                }
            }
        </script>
        <title>Lista de Produtos</title>
    </head>
    <body>
      <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Lista de Produtos<a  class="login100-form-btn" href="form_inserir_produto.jsp"><img src="imagens/novo.png"/>Inserir novo Produto</a></h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>QTD</th>
                <th>Valor</th>
                <th>Opções</th>
            </tr>
            <%
            for(Produto p:lista){
            %>
            <tr>
                <td><%=p.getId() %></td>
                <td><%=p.getNome() %></td>
                <td><%=dfu.format(p.getQuantidade()) %></td>
                <td><%=df.format(p.getValor()) %></td>
                <td><a class="login100-form-btn" href="form_alterar_produto.jsp?id=<%=p.getId() %>"><img src="imagens/alterar.png"/>Alterar</a> <a class="login100-form-btn" href="#" onclick="excluir('<%=p.getNome() %>',<%=p.getId() %>)"><img src="imagens/excluir.png"/>Excluir</a></td>
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
