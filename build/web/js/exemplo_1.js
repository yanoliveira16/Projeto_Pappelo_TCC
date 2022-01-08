// Testando a validação usando jQuery
$(function(){

    // ## EXEMPLO 1
    // Aciona a validação a cada tecla pressionada
    var temporizador = false;
    $('.cpf_cnpj').keypress(function(){
    
        // O input que estamos utilizando
        var input = $(this);
        
        // Limpa o timeout antigo
        if ( temporizador ) {
            clearTimeout( temporizador );
        }
        
        // Cria um timeout novo de 500ms
        temporizador = setTimeout(function(){
            // Remove as classes de válido e inválido
            input.removeClass('valido');
            input.removeClass('invalido');
        
            // O CPF ou CNPJ
            var cpf_cnpj = input.val();
            
            // Valida
            var valida = valida_cpf_cnpj( cpf_cnpj );
            
            // Testa a validação
            if ( valida ) {
                input.addClass('valido');
            } else {
                input.addClass('invalido');
            }
        }, 500);
    
    });
});
