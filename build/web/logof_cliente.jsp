<%-- 
    Document   : logof
    Created on : 01/10/2019, 16:41:42
    Author     : Administrador
--%>

<%
session.removeAttribute("cliente");
response.sendRedirect("login_cliente.jsp");
%>
