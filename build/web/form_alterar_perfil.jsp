<%-- 
    Document   : form_alterar_perfil
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Perfil p = new Perfil();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Perfil</title>
    </head>
    <body>
          <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Editar Perfil</h1>
        <form name="alterar_perfil" action="alterar_perfil.do" method="post">
            ID:<%=p.getId() %><br/>
            <input type="hidden" value="<%=p.getId() %>" name="id"/>
            Nome:<input type="text" value="<%=p.getNome() %>" name="nome" size="30" required /><br/>
            Descrição:<input type="text" value="<%=p.getDescricao() %>" name="descricao" size="30" required/><br/>
            <center> <input class="login100-form-btn" type="submit" value="Salvar"/></center>
        </form>
            <a class="login100-form-btn" href="listar_perfil.jsp?">Voltar</a>
 </div>
 </div>
 </div>
    </body>
</html>
