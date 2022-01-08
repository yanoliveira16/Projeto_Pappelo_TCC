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
public class VendaDAO extends DataBaseDAO{
    public void inserir(Venda v) throws Exception{
        String sql = "INSERT INTO venda (data_venda,id_usuario,cliente_id) VALUES(now(),?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstm.setInt(1, v.getUsuario().getId());
        pstm.setInt(2, v.getCliente().getId());
        pstm.execute();
        ResultSet rs = pstm.getGeneratedKeys();
        if(rs.next()){
            System.out.println("ID:"+rs.getInt(1));
            v.setId(rs.getInt(1));
        }
        for(ItemVenda iv:v.getItens()){
            String sql_item = "INSERT INTO item_venda (id_venda,id_produto,quantidade,valor) VALUES(?,?,?,?)";
            PreparedStatement pstm_item = conn.prepareStatement(sql_item);
            pstm_item.setInt(1, v.getId());
            pstm_item.setInt(2, iv.getProduto().getId());
            pstm_item.setDouble(3, iv.getQuantidade());
            pstm_item.setDouble(4, iv.getProduto().getValor());
            pstm_item.execute();
        }
        
        this.desconectar();
    }
    public ArrayList<Venda> listar() throws Exception{
        ArrayList<Venda> lista = new ArrayList<Venda>();
        String sql = "SELECT * FROM venda";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            v.setData_venda(rs.getDate("data_venda"));
            v.setData_pagamento(rs.getDate("data_pagamento"));
            v.setData_entrega(rs.getDate("data_entrega"));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setUsuario(uDAO.carregarPorId(rs.getInt("id_usuario")));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));
            lista.add(v);
        }
        this.desconectar();
        return lista;
    
    }
    public void excluirVenda(int id_venda) throws Exception{
        String sql = "DELETE FROM item_venda WHERE id_venda=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_venda);
        pstm.execute();
        this.desconectar();
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
        String sql = "UPDATE venda SET data_pagamento = now() WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    public void registrarEntrega(int id) throws Exception{
        String sql = "UPDATE venda SET data_entrega = now() WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    public Venda carregarPorId(int id) throws Exception{
        Venda v = new Venda();
        String sql = "SELECT * FROM venda WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            v.setId(rs.getInt("id"));
            v.setData_venda(rs.getDate("data_venda"));
            v.setData_pagamento(rs.getDate("data_pagamento"));
            v.setData_entrega(rs.getDate("data_entrega"));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setUsuario(uDAO.carregarPorId(rs.getInt("id_usuario")));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));
            v.setItens(this.carregarItensVenda(id));
        }
        this.desconectar();
        return v;
    }
    
    public ArrayList<ItemVenda> carregarItensVenda(int id_venda) throws Exception{
        ArrayList<ItemVenda> lista = new ArrayList<ItemVenda>();
        String sql = "SELECT * FROM item_venda WHERE id_venda=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_venda);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            ItemVenda iv = new ItemVenda();
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
    
    public void alterar(Venda v) throws Exception{
        String sql = "UPDATE venda SET data_venda = now(),id_usuario=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, v.getUsuario().getId());
        pstm.setInt(2, v.getId());
        pstm.execute();
        
        String sql_limpa_itens = "DELETE FROM item_venda WHERE id_venda=?";
        PreparedStatement pstm_limpa_itens = conn.prepareStatement(sql_limpa_itens);
        pstm_limpa_itens.setInt(1, v.getId());
        pstm_limpa_itens.execute();
        
        for(ItemVenda iv:v.getItens()){
            String sql_item = "INSERT INTO item_venda (id_venda,id_produto,quantidade,valor) VALUES(?,?,?,?)";
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
