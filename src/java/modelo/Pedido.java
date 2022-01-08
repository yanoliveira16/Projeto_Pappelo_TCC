/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Administrador
 */
public class Pedido {
    
private int id;
private Date data_pedido;
private Date data_pagamento;
private Date data_entrega;
private String imagem_prototipo;
private String forma_pagamento;
private Cliente cliente;
private ArrayList<ItemPedidoCliente> itens;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getData_pedido() {
        return data_pedido;
    }

    public void setData_pedido(Date data_pedido) {
        this.data_pedido = data_pedido;
    }

    public Date getData_pagamento() {
        return data_pagamento;
    }

    public void setData_pagamento(Date data_pagamento) {
        this.data_pagamento = data_pagamento;
    }

    public Date getData_entrega() {
        return data_entrega;
    }

    public void setData_entrega(Date data_entrega) {
        this.data_entrega = data_entrega;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public ArrayList<ItemPedidoCliente> getItens() {
        return itens;
    }

    public void setItens(ArrayList<ItemPedidoCliente> itens) {
        this.itens = itens;
    }

    public String getImagem_prototipo() {
        return imagem_prototipo;
    }

    public void setImagem_prototipo(String imagem_prototipo) {
        this.imagem_prototipo = imagem_prototipo;
    }

    public String getForma_pagamento() {
        return forma_pagamento;
    }

    public void setForma_pagamento(String forma_pagamento) {
        this.forma_pagamento = forma_pagamento;
    }

}
