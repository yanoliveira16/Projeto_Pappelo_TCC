<%-- 
    Document   : banner
    Created on : 01/10/2019, 16:17:23
    Author     : Administrador
--%>

<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Pedido"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/css.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
<%



Cliente cLogado = new Cliente();
try{
    cLogado = (Cliente) session.getAttribute("cliente");
    
    
    %><div class="bannermenu"<%
        out.print("<a href='indexCliente.jsp'></a>");
    out.print(cLogado.getNome_fantasia()+   "<a href='logof_cliente.jsp'> (Sair)  </a>");
    %></div><%
}catch(Exception e){
    response.sendRedirect("login_cliente.jsp");
}


 
    Cliente cpr = new Cliente();
    try{
        ClienteDAO cDAO = new ClienteDAO();
        cpr = cDAO.carregarPorId(cLogado.getId());

    }catch(Exception e){
        out.print("Erro:"+e);
    }
    
DecimalFormat df = new DecimalFormat();
df.applyPattern("R$ #,##0.00");

DecimalFormat dfu = new DecimalFormat();
dfu.applyPattern("0000");



%>
        
<div class="main">
 


<div class="sidenav">
<img class="banner" src="imagens/banner_papello.png" alt="Papello Embalagens"/><br>
 
  <a href="indexCliente.jsp" title="Home"><i class="fa fa-fw fa-home"></i> Home </a> 
  <a href="catalogo_cliente.jsp?id=<%=cLogado.getId()%>&op=np"><i class="fa fa-fw fa-cart-plus"></i> Fazer Um pedido </a> 
  <a href="ver_meus_pedidos.jsp?id=<%=cLogado.getId()%>"><i class="fa fa fas fa-list"></i> Meus Pedidos</a> 
  <a href="perfil_cliente.jsp?id=<%=cLogado.getId()%>" ><i class="fa fa-fw fa-user-o"></i> Meu perfil</a>






</div>
</div>




    
 

