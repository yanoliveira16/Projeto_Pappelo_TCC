/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class UsuarioDAO extends DataBaseDAO {

    public void inserir(Usuario u) throws Exception {
        String sql = "INSERT INTO usuario (nome,login,senha,situacao,id_perfil) VALUES(?,?,?,'OK',?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, u.getNome());
        pstm.setString(2, u.getLogin());
        pstm.setString(3, u.getSenha());
        pstm.setInt(4, u.getPerfil().getId());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Usuario> listar() throws Exception {
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        String sql = "SELECT * FROM usuario";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Usuario u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setLogin(rs.getString("login"));
            u.setSenha(rs.getString("senha"));
            u.setSituacao(rs.getString("situacao"));
            PerfilDAO pDAO = new PerfilDAO();
            u.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
            lista.add(u);
        }
        this.desconectar();
        return lista;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM usuario WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Usuario carregarPorId(int id) throws Exception {
        Usuario u = new Usuario();
        String sql = "SELECT * FROM usuario WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setLogin(rs.getString("login"));
            u.setSenha(rs.getString("senha"));
            u.setSituacao(rs.getString("situacao"));
            PerfilDAO pDAO = new PerfilDAO();
            u.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
        }
        this.desconectar();
        return u;
    }

    public void alterar(Usuario u) throws Exception {
        String sql = "UPDATE usuario SET nome=?,login=?,senha=?,id_perfil=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, u.getNome());
        pstm.setString(2, u.getLogin());
        pstm.setString(3, u.getSenha());
        pstm.setInt(4, u.getPerfil().getId());
        pstm.setInt(5, u.getId());
        pstm.execute();
        this.desconectar();
    }

    public Usuario logar(String login, String senha) throws Exception {
        Usuario u = new Usuario();
        String sql = "SELECT * FROM usuario WHERE login=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setLogin(rs.getString("login"));
                u.setSenha(rs.getString("senha"));
                u.setSituacao(rs.getString("situacao"));
                PerfilDAO pDAO = new PerfilDAO();
                u.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
            }
        }
        this.desconectar();
        return u;
    }

}
