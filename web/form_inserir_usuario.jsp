<%-- 
    Document   : form_inserir_usuario
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Usuário</title>
    </head>
    <body>
      <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Novo Usuário</h1>
        <form name="inserir_usuario" action="inserir_usuario.do" method="post">
            Nome:<input type="text" name="nome" size="30" required /><br/>
            Login:<input type="text" name="login" size="30" required/><br/>
            Senha:<input type="password" name="senha" size="30" required/><br/>
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
                    %>
                    <option value="<%=p.getId() %>"><%=p.getNome() %></option>               
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
