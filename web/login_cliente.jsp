<%-- 
    Document   : login_cliente
    Created on : 18/11/2019, 15:19:17
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/css.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    
    
    
    
       <script>
var CpfCnpjMaskBehavior = function (val) {
			return val.replace(/\D/g, '').length <= 11 ? '000.000.000-009' : '00.000.000/0000-00';
		},
    cpfCnpjpOptions = {
    	onKeyPress: function(val, e, field, options) {
      	field.mask(CpfCnpjMaskBehavior.apply({}, arguments), options);
      }
    };

$(function() {
	$(':input[name=cpf_cnpj]').mask(CpfCnpjMaskBehavior, cpfCnpjpOptions);
})
    
  </script>
  
    <script>
  
    function validaCPF(cpf)
  {
    var numeros, digitos, soma, i, resultado, digitos_iguais;
    digitos_iguais = 1;
    if (cpf.length < 11)
          return false;
    for (i = 0; i < cpf.length - 1; i++)
          if (cpf.charAt(i) != cpf.charAt(i + 1))
                {
                digitos_iguais = 0;
                break;
                }
    if (!digitos_iguais)
          {
          numeros = cpf.substring(0,9);
          digitos = cpf.substring(9);
          soma = 0;
          for (i = 10; i > 1; i--)
                soma += numeros.charAt(10 - i) * i;
          resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
          if (resultado != digitos.charAt(0))
                return false;
          numeros = cpf.substring(0,10);
          soma = 0;
          for (i = 11; i > 1; i--)
                soma += numeros.charAt(11 - i) * i;
          resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
          if (resultado != digitos.charAt(1))
                return false;
          return true;
          }
    else
        return false;
  }
    </script>
    <center> <a class="hidden1"  href="login.jsp">Acesso Restrito </a></center>
</head>
<body>
<div class="limiter">
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
<div class="wrap-login100">
<form  class="login100-form validate-form" name="login" action="valida_login_cliente.do" method="post">

     <div >
<img  class="bannerLogin" src="imagens/banner_papello.png" alt="Papello Embalagens"/>
    </div>  
    <span class="login100-form-title p-b-34 p-t-27">
Entrar
</span>
  
<div class="wrap-input100 validate-input" data-validate="Digite seu login">
 <input class="input100" id="cpf" class="form-control"  type="text" name="cpf_cnpj"  minlength="14" maxlength="14" placeholder="CPF/CNPJ" required >
<span class="focus-input100" data-placeholder="&#xf207;"></span>
</div>
<div class="wrap-input100 validate-input" data-validate="Insira sua senha">
<input class="input100" type="password" name="senha" placeholder="Senha">
<span class="focus-input100" data-placeholder="&#xf191;"></span>
</div>
        <center><input class="login100-form-input" type="submit" value="Entrar"></center>
                   
            
<div class="container-login100-form-btn">

   

<div class="text-center p-t-90">
    <br><center><p>Ainda não é cadastrado?</p></center> <a class="login100-form-btn" href="form_auto_cadastro_cliente.jsp">     Cadastre-se </a><br/>
</div>
</div>
</form>
</div>
</div>
</div>

</html>
            
            
        </form>

    </body>
</html>
