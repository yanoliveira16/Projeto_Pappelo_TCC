/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
/**
 *
 * @author Administrador
 */
public class PedidoDAO extends DataBaseDAO{
    public void inserir(Pedido p) throws Exception{
        String sql = "INSERT INTO Pedido (data_pedido,cliente_id) VALUES(now(),?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstm.setInt(1, p.getCliente().getId());
        pstm.execute();
        ResultSet rs = pstm.getGeneratedKeys();
        if(rs.next()){
            System.out.println("ID:"+rs.getInt(1));
            p.setId(rs.getInt(1));
        }
        for(ItemPedidoCliente iv:p.getItens()){
            String sql_item = "INSERT INTO item_pedido_cliente (id_pedido,id_produto,quantidade,valor) VALUES(?,?,?,?)";
            PreparedStatement pstm_item = conn.prepareStatement(sql_item);
            pstm_item.setInt(1, p.getId());
            pstm_item.setInt(2, iv.getProduto().getId());
            pstm_item.setDouble(3, iv.getQuantidade());
            pstm_item.setDouble(4, iv.getProduto().getValor());
            pstm_item.execute();
        }
        
        this.desconectar();
    }
    
    public void inserirImagemForma(Pedido p) throws Exception{
        String sql = "UPDATE Pedido SET imagem_prototipo=?, forma_pagamento=? WHERE idPedido=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
       
        pstm.setString(1, p.getImagem_prototipo());
        pstm.setString(2, p.getForma_pagamento());
         pstm.setInt(3, p.getId());
        pstm.execute();
        this.desconectar();
    }
    
    
    
    
    
    public ArrayList<Pedido> listar() throws Exception{
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        String sql = "SELECT * FROM pedido";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Pedido v = new Pedido();
            v.setId(rs.getInt("idPedido"));
            v.setData_pedido(rs.getDate("data_pedido"));
            v.setData_pagamento(rs.getDate("data_pagamento"));
            v.setData_entrega(rs.getDate("data_entrega"));
            v.setForma_pagamento(rs.getString("forma_pagamento"));
            v.setImagem_prototipo(rs.getString("imagem_prototipo"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));
            lista.add(v);
        }
        this.desconectar();
        return lista;
    }
    
    
    public ArrayList<Pedido> listarMeusPedidos(int cliente_id) throws Exception{
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        String sql = "SELECT * FROM pedido WHERE cliente_id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, cliente_id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Pedido v = new Pedido();
            v.setId(rs.getInt("idPedido"));
            v.setData_pedido(rs.getDate("data_pedido"));
            v.setData_pagamento(rs.getDate("data_pagamento"));
            v.setData_entrega(rs.getDate("data_entrega"));
            v.setForma_pagamento(rs.getString("forma_pagamento"));
            v.setImagem_prototipo(rs.getString("imagem_prototipo"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));
            lista.add(v);
        }
        this.desconectar();
        return lista;
    }
    
    
    

    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM menu WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
 
     public void registrarPag(int id) throws Exception{
        String sql = "UPDATE pedido SET data_pagamento = now() WHERE idPedido=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    public void registrarEntrega(int id) throws Exception{
        String sql = "UPDATE pedido SET data_entrega = now() WHERE idPedido=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    
    
    
    
    public Pedido carregarPorId(int idPedido) throws Exception{
        Pedido v = new Pedido();
        String sql = "SELECT * FROM pedido WHERE idPedido=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idPedido);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            v.setId(rs.getInt("idPedido"));
            v.setData_pedido(rs.getDate("data_pedido"));
            v.setData_pagamento(rs.getDate("data_pagamento"));
            v.setData_entrega(rs.getDate("data_entrega"));
            v.setImagem_prototipo(rs.getString("imagem_prototipo"));
            v.setForma_pagamento(rs.getString("forma_pagamento"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));
            v.setItens(this.carregarItensPedido(idPedido));
        }
        this.desconectar();
        return v;
    }
    
     public Pedido carregarPorIdPedido(int cliente_id) throws Exception{
        Pedido v = new Pedido();
        String sql = "SELECT * FROM pedido WHERE cliente_id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, cliente_id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            v.setId(rs.getInt("idPedido"));
            v.setData_pedido(rs.getDate("data_pedido"));
            v.setData_pagamento(rs.getDate("data_pagamento"));
            v.setData_entrega(rs.getDate("data_entrega"));
            
        }
        this.desconectar();
        return v;
    }
    
    public ArrayList<ItemPedidoCliente> carregarItensPedido(int id_pedido) throws Exception{
        ArrayList<ItemPedidoCliente> lista = new ArrayList<ItemPedidoCliente>();
        String sql = "SELECT * FROM item_pedido_cliente WHERE id_pedido=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_pedido);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            ItemPedidoCliente iv = new ItemPedidoCliente();
            iv.setId(rs.getInt("id"));
            iv.setQuantidade(rs.getDouble("quantidade"));
            iv.setValor(rs.getDouble("valor"));
            ProdutoDAO pDAO = new ProdutoDAO();
            iv.setProduto(pDAO.carregarPorId(rs.getInt("id_produto")));
            lista.add(iv);
        }
        this.desconectar();
        return lista;
    }
    
    public void alterar(Pedido v) throws Exception{
        String sql = "UPDATE pedido SET data_pedido = now(),cliente_id=? WHERE idPedido=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, v.getId());
        pstm.execute();
        
        String sql_limpa_itens = "DELETE FROM item_pedido_cliente WHERE id_pedido=?";
        PreparedStatement pstm_limpa_itens = conn.prepareStatement(sql_limpa_itens);
        pstm_limpa_itens.setInt(1, v.getId());
        pstm_limpa_itens.execute();
        
        for(ItemPedidoCliente iv:v.getItens()){
            String sql_item = "INSERT INTO item_pedido_cliente (id_pedido,id_produto,quantidade,valor) VALUES(?,?,?,?)";
            PreparedStatement pstm_item = conn.prepareStatement(sql_item);
            pstm_item.setInt(1, v.getId());
            pstm_item.setInt(2, iv.getProduto().getId());
            pstm_item.setDouble(3, iv.getQuantidade());
            pstm_item.setDouble(4, iv.getProduto().getValor());
            pstm_item.execute();
        }
        
        this.desconectar();
    }
}
