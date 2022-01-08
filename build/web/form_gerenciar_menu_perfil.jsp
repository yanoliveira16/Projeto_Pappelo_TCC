<%-- 
    Document   : form_gerenciar_menu_perfil
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Menu"%>
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
        <title>Gerenciar Menu Perfil</title>
    </head>
    <body>
           <link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">



 <div class="main">
        <%@include file="banner.jsp" %>
        <h1>Gerenciar Menu Perfil</h1>
        <form name="menu_perfil" action="gerenciar_menu_perfil.do" method="post">
            ID:<%=p.getId() %>  Nome:<%=p.getNome() %><br/>
            <input type="hidden" value="<%=p.getId() %>" name="id_perfil"/>
            <input type="hidden" value="vincular" name="op"/>
            <select name="id_menu" size="1" required>
                <option value=""> Selecione... </option>
                <%
                    ArrayList<Menu> lista = new ArrayList<Menu>();
                    PerfilDAO pDAO = new PerfilDAO();
                    try{
                       lista = pDAO.menusNaoVinculados(p.getId());
                    }catch(Exception e){
                        out.print("Erro:"+e);
                    }
                
                    for(Menu m:lista){
                    %>
                    <option value="<%=m.getId() %>"><%=m.getTitulo() %></option>               
                <%
                    }
                %>
            </select>
            <input class="login100-form-btn" type="submit" value="+"/> 
        </form>
       <h1>Menus Vinculados</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Remover</th>
            </tr>
            <%
            for(Menu m:p.getMenus()){
            %>
            <tr>
                <td><%=m.getId() %></td>
                <td><%=m.getTitulo() %></td>
                <td align="center"><a class="login100-form-btn" href="gerenciar_menu_perfil.do?id_menu=<%=m.getId() %>&id_perfil=<%=p.getId() %>&op=remover"><img src="imagens/excluir.png"/></a></td>
            </tr>            
            <%    
            } 
            %>   
        </table>
         <a class="login100-form-btn" href="listar_perfil.jsp?">Voltar</a>
 </div>
 </div>
 </div>
    </body>
</html>
