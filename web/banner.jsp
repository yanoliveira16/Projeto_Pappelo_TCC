<%-- 
    Document   : banner
    Created on : 01/10/2019, 16:17:23
    Author     : Administrador
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Usuario"%>

<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="css/util2.css">
<link rel="stylesheet" type="text/css" href="css/main2.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/css2.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
<%
Usuario uLogado = new Usuario();
try{
   
     %><div class="bannermenu"<%
    uLogado = (Usuario) session.getAttribute("usuario");
    out.print("<a href='indexVendedor.jsp'> </a> ");
    out.print(uLogado.getNome()+"<a href='logof.jsp'>(Sair)</a>");
    %></div><%
}catch(Exception e){
    response.sendRedirect("login.jsp");
}

DecimalFormat df = new DecimalFormat();
df.applyPattern("R$ #,##0.00");

DecimalFormat dfu = new DecimalFormat();
dfu.applyPattern("0000");

%>
<div class="main">

    

<div class="sidenav">
 <img class="banner" src="imagens/banner_papello.png" alt="Papello Embalagens"/><br>
    <a href="indexVendedor.jsp" title="Home"><i class="fa fa-fw fa-home"></i> Home </a> 
    <%
    for(Menu m:uLogado.getPerfil().getMenus()){
      out.print("<a href='"+m.getLink()+"'> "+m.getTitulo()+" </a> |");  
    }
    
    
    %>
 




</div>
</div>