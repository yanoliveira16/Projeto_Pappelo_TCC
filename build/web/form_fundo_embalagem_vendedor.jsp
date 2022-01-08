<%-- 
    Document   : form_inserir_cliente
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>


<%@page import="modelo.Endereco"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="modelo.Venda"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
Venda vr = new Venda();
try{
      int id = Integer.parseInt(request.getParameter("id"));
        VendaDAO vDAO = new VendaDAO();
        vr = vDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>

<!DOCTYPE html>
<html>
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Decoração</title>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
           <link rel="stylesheet" type="text/css" href="css/util.css">
       <link rel="stylesheet" type="text/css" href="css/main.css">
       <link rel="stylesheet" type="text/css" href="css/css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    
     
        <div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
     <div class="main">
        
        
         
         
         
        <%@include file="banner.jsp" %>
        <center>     
        <h2>Por favor escolha a cor da embalagem desejada:</h2>
        
        
        
        <style>
div.box {
	width: 150px;
        height: 100px;
	display: inline-block;
        align-items: center;
        margin-left: 150px;
        padding-bottom:10px;
}
div box2{
    padding-bottom: 40px;
    margin-top: 50px;
}
</style>
      
       
 <div> 
     <form name="insere_cor_forma_vendedor" action="insere_cor_forma_vendedor.do" method="post">        
           <br/><br/> 
           
     <input type="hidden" value="<%=vr.getId()%>" name="id"/>
  
  
<div class="box">
     <img  style=" width:80%;" src="imagens/vermelho_preto.gif"/><br>
    <span> <input type="radio" name="imagem_prototipo" value="vermelho_preto" checked/><br>  </span>
</div>
     
     
<div class="box">
         <img  style=" width:80%" src="imagens/verde.jpg"/><br>
    <span>  <input  type="radio" name="imagem_prototipo" value="azul"/><br>  </span>
</div>
     
     <div class="box">
      <img style=" width:80%;" src="imagens/azul.jpg"/><br>
    <span>   <input type="radio" name="imagem_prototipo" value="verde"/><br>  </span>
</div>
     
   


     
     
 
 
           
     
        <h2>Escolha um meio de pagamento:</h2>
        
        <div class="box2">
          <i class="fa fa-fw fa-credit-card"></i>  Cartão:<input type="radio"  name="forma_pagamento" value="cartao" checked /> <br/>
            <i class="fa fa-fw fa-barcode"></i>  Boleto:<input type="radio" name="forma_pagamento" value="boleto"/> <br/>
</div>
         

               
     
    
     
     <input class="login100-form-input" type="submit" value="salvar" />
        </form>
     
     
     
     
     
     
       </center>
     
                 </div>

     </div>
        </div>    


        
        
        
        
        

        
    
</html>
