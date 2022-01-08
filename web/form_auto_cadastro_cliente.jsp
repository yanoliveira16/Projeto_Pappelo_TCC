<%-- 
    Document   : form_inserir_cliente
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.swing.JFrame"%>
<%@page import="modelo.Endereco"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">




  <!-- jQuery -->
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="js/valida_cpf_cnpj.js"></script>
        <script src="js/exemplo_1.js"></script>
        <script src="js/exemplo_2.js"></script>     
        <script src="js/exemplo_3.js"></script>






    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/imask"></script>

</head>
<body>
<div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
<div class="wrap-login100">
    
<form  name="inserir_cliente" action="inserir_cliente.do" method="post">
  
<div  data-validate="Digite os dados">

  
    <p>Nome/Fantasia:</p><input class="input1001" type="text" name="nome_fantasia"  required /><br/>

            <p>Senha:</p><input class="input1001" type="password" name="senha"  required/><br/>
            
           <p>CPF/CNPJ:</p><br/><h8>será seu login</h8> <input style="  font-family: Poppins-Regular;
  font-size: 16px;
  color: black;
  line-height: 1.2;

  display: block;
  width: 100%;
  height: 45px;
  background: #d6d6d6; 
  padding: 0 5px 0 38px;"  class="cpf_cnpj"   class="input1001"  type="text" name="cpf_cnpj"  placeholder="Esse será seu Login" required/>
     
  </div>

            <br/>
           <p>Telefone:</p> <input class="input1001" type="text" name="telefone" class="form-control" onkeypress="$(this).mask('(00) 00000-0000');">
            <p>E-mail:</p><input class="input1001" type="text" name="email"  required/><br/>
            <p>Inscrição Estadual:</p><input class="input1001" type="text" name="inscricao_estadual"  /><br/>
            
            <h2>Endereço:</h2><br/>
            
            <p>Rua:</p><input class="input1001" type="text" name="rua"  required /><br/>
            <p>Cidade:</p><input class="input1001" type="text" name="cidade"  required/><br/>
            <p>Cep:</p><input class="input1001" type="text" name="cep" class="form-control" onkeypress="$(this).mask('00.000-000')"  required/><br/>
            <p>Bairro:</p><input class="input1001" type="text" name="bairro"  required/><br/>
           <p>Numero:</p><input type="text" class="input1001" name="numero"  required/><br/>
            <p>Complemento:</p><input type="text" class="input1001" name="complemento"  /><br/>

<center><input class="login100-form-input" type="submit" value="Cadastrar"></center>

</div>
<%
request.setAttribute("mensagem", "Cadastrado com sucesso!");

%>




       
       
 
</div>
<div class="text-center p-t-90">

</div>
</form>
</div>
</div>
</div>

</html>
            
            
        </form>
 
    </body>
</html>

