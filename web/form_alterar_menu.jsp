<%-- 
    Document   : form_alterar_menu
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="modelo.MenuDAO"%>
<%@page import="modelo.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Menu mr = new Menu();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        MenuDAO mDAO = new MenuDAO();
        mr = mDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Menu</title>
    </head>
    <body>
          <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Editar Menu</h1>
        <form name="alterar_menu" action="alterar_menu.do" method="post">
            ID:<%=mr.getId() %><br/>
            <input type="hidden" value="<%=mr.getId() %>" name="id"/>
            Título:<input type="text" value="<%=mr.getTitulo() %>" name="titulo" size="30" required /><br/>
            Link:<input type="text" value="<%=mr.getLink() %>" name="link" size="30" required/><br/>
            Ícone:<input type="text" value="<%=mr.getIcone() %>" name="icone" size="30" required/><br/>
            <center> <input class="login100-form-btn" type="submit" value="Salvar"/> </center>
        </form>
            <a class="login100-form-btn" href="listar_menu.jsp?">Voltar</a>
 </div>
 </div>
 </div>
    </body>
</html>
