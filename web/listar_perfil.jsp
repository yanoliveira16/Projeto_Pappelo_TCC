<%-- 
    Document   : listar_perfil
    Created on : 20/08/2019, 16:31:21
    Author     : Administrador
--%>

<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
ArrayList<Perfil> lista = new ArrayList<Perfil>();
try{
   PerfilDAO pDAO = new PerfilDAO();
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
                if(confirm("Para excluir um perfil é necessario excluir o(s) menu(s) vinculado(s) a ele antes! \n\
                            Tem certeza que deseja excluir o perfil: "+ nome +" ?")){
                    window.open("excluir_perfil.do?id="+id,"_self");
                }
            }
        </script>
        <title>Lista de Perfis</title>
    </head>
    <body>
       <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Lista de Perfis <a class="login100-form-btn" href="form_inserir_perfil.jsp"><img src="imagens/novo.png"/>Inserir novo Perfil</a></h1>
        
        <table class="table" widgh="100%" border="1">
            <tr>
                <th widgh="2%" >ID</th>
                <th widgh="5%" >Nome</th>
                <th widgh="30%" >Opções</th>
            </tr>
            <%
            for(Perfil p:lista){
            %>
            <tr>
                <td><%=p.getId() %></td>
                <td><%=p.getNome() %></td>
                <td><a class="login100-form-btn" class="login100-form-btn" href="form_alterar_perfil.jsp?id=<%=p.getId() %>"><img src="imagens/alterar.png"/>Alterar</a> <a class="login100-form-btn" class="login100-form-btn" href="#" onclick="excluir('<%=p.getNome() %>',<%=p.getId() %>)"><img src="imagens/excluir.png"/>Excluir</a> <a class="login100-form-btn" class="login100-form-btn" href="form_gerenciar_menu_perfil.jsp?id=<%=p.getId() %>"><img src="imagens/menu.png"/>Gerenciar menus</a></td>
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
