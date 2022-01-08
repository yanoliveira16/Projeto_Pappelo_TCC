<%-- 
    Document   : form_alterar_usuario
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = new Usuario();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        UsuarioDAO uDAO = new UsuarioDAO();
        u = uDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuário</title>
    </head>
    <body>
          <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Editar Usuário</h1>
        <form name="alterar_usuario" action="alterar_usuario.do" method="post">
            ID:<%=u.getId() %><br/>
            <input type="hidden" name="id" value="<%=u.getId() %>"/>
            Nome:<input type="text" value="<%=u.getNome() %>" name="nome" size="30" required /><br/>
            Login:<input type="text" value="<%=u.getLogin() %>" name="login" size="30" required/><br/>
            Senha:<input type="password" value="<%=u.getSenha() %>" name="senha" size="30" required/><br/>
            Perfil:<select name="perfil" size="1" required>
                <option value=""> Selecione... </option>
                <%
                    ArrayList<Perfil> lista = new ArrayList<Perfil>();
                    PerfilDAO pDAO = new PerfilDAO();
                    try{
                       lista = pDAO.listar();
                    }catch(Exception e){
                        out.print("Erro:"+e);
                    }
                
                    for(Perfil p:lista){
                        String selecao = "";
                        if(p.getId() == u.getPerfil().getId()){
                            selecao = "selected";
                        }
                    %>
                    <option value="<%=p.getId() %>" <%=selecao %>><%=p.getNome() %></option>               
                <%
                    }
                %>
            </select><br/>
            <center>  <input class="login100-form-btn" type="submit" value="Salvar"/></center>
        </form>
             <a class="login100-form-btn" href="listar_usuario.jsp?">Voltar</a>
 </div>
 </div>
 </div>
    </body>
</html>
