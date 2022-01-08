<%-- 
    Document   : listar_usuario
    Created on : 20/08/2019, 16:31:21
    Author     : Administrador
--%>

<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
ArrayList<Usuario> lista = new ArrayList<Usuario>();
try{
   UsuarioDAO uDAO = new UsuarioDAO();
   lista = uDAO.listar();
}catch(Exception e){
    out.print("Erro:"+e);
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(nome,id){
                if(confirm("Para excluir um usuario é necessario excluir o(s) perfil(s) vinculado(s) a ele antes! \n\
                            Tem certeza que deseja excluir o usuario "+ nome +" ?")){
                    window.open("excluir_usuario.do?id="+id,"_self");
                }
            }
        </script>
        <title>Lista de Usuários</title>
    </head>
    <body>
       <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Lista de Usuários <a class="login100-form-btn" href="form_inserir_usuario.jsp"><img src="imagens/novo.png"/>Inserir novo Usuario</a></h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Perfil</th>
                <th>Opções</th>
            </tr>
            <%
            for(Usuario u:lista){
            %>
            <tr>
                <td><%=u.getId() %></td>
                <td><%=u.getNome() %></td>
                <td><%=u.getPerfil().getNome() %></td>
                <td><a class="login100-form-btn" href="form_alterar_usuario.jsp?id=<%=u.getId() %>"><img src="imagens/alterar.png"/>Alterar</a> <a class="login100-form-btn" href="#" onclick="excluir('<%=u.getNome() %>',<%=u.getId() %>)"><img src="imagens/excluir.png"/>Excluir</a></td>
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
