<%-- 
    Document   : listar_menu
    Created on : 20/08/2019, 16:31:21
    Author     : Administrador
--%>

<%@page import="modelo.MenuDAO"%>
<%@page import="modelo.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
ArrayList<Menu> lista = new ArrayList<Menu>();
try{
   MenuDAO mDAO = new MenuDAO();
   lista = mDAO.listar();
}catch(Exception e){
    out.print("Erro:"+e);
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(titulo,id){
                if(confirm("Tem certeza que deseja excluir o menu:"+titulo+"?")){
                    window.open("excluir_menu.do?id="+id,"_self");
                }
            }
        </script>
        <title>Lista de Menus</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Lista de Menus<a  class="login100-form-btn" href="form_inserir_menu.jsp"><img src="imagens/novo.png"/>Inserir novo Menu</a></h1>
        <table class="table" widgh="60%" border="1">
            <tr>
                <th widgh="2%" >ID</th>
                <th widgh="4%">Título</th>
                <th widgh="5%">Link</th>
                <th widgh="8%">Opções</th>
            </tr>
            <%
            for(Menu m:lista){
            %>
            <tr>
                <td><%=m.getId() %></td>
                <td><%=m.getTitulo() %></td>
                <td><%=m.getLink() %></td>
                <td><a class="login100-form-btn" href="form_alterar_menu.jsp?id=<%=m.getId() %>"><img src="imagens/alterar.png"/>Alterar</a> <a class="login100-form-btn" href="#" onclick="excluir('<%=m.getTitulo() %>',<%=m.getId() %>)"><img src="imagens/excluir.png"/>Excluir</a></td>
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
