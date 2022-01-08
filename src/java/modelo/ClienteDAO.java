/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class ClienteDAO extends DataBaseDAO {
    
    public static String UTF8toISO(String str){
        Charset utf8charset = Charset.forName("UTF-8");
        Charset iso88591charset = Charset.forName("ISO-8859-1");

        ByteBuffer inputBuffer = ByteBuffer.wrap(str.getBytes());

        // decode UTF-8
        CharBuffer data = utf8charset.decode(inputBuffer);

        // encode ISO-8559-1
        ByteBuffer outputBuffer = iso88591charset.encode(data);
        byte[] outputData = outputBuffer.array();

        return new String(outputData);
    }
    
    

    public void inserir(Cliente c, Endereco e) throws Exception {
        String sql = "INSERT INTO cliente (nome_fantasia,telefone,senha,cpf_cnpj,email,inscricao_estadual) VALUES(?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstm.setString(1, c.getNome_fantasia());
        pstm.setString(2, c.getTelefone());
        pstm.setString(3, c.getSenha());
        pstm.setString(4, c.getCpf_cnpj());
        pstm.setString(5, c.getEmail());
        pstm.setString(6, c.getInscricao_estadual());
        pstm.execute();
        ResultSet rs = pstm.getGeneratedKeys();
        if (rs.next()) {
            System.out.println("ID:" + rs.getInt(1));
            c.setId(rs.getInt(1));
        
        String sql_endereco = "INSERT INTO endereco (rua,cidade,cep,bairro,numero,complemento,cliente_id) VALUES(?,?,?,?,?,?,?)";
        PreparedStatement pstm_endereco = conn.prepareStatement(sql_endereco);
        pstm_endereco.setString(1, e.getRua());
        pstm_endereco.setString(2, e.getCidade());
        pstm_endereco.setString(3, e.getCep());
        pstm_endereco.setString(4, e.getBairro());
        pstm_endereco.setString(5, e.getNumero());
        pstm_endereco.setString(6, e.getComplemento());
        pstm_endereco.setInt(7, c.getId());
        pstm_endereco.execute();
         this.desconectar();
        }
    }
    
    
    


     public void inserirEndereco(int id, Endereco e) throws Exception {
        String sql = "SELECT FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstm.execute();
        pstm.setInt(1, id);
        ResultSet rs = pstm.getGeneratedKeys();
          while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome_fantasia(rs.getString("nome_fantasia"));
            c.setTelefone(rs.getString("telefone"));
            c.setSenha(rs.getString("senha"));
            c.setCpf_cnpj(rs.getString("cpf_cnpj"));
            c.setEmail(rs.getString("email"));
            c.setInscricao_estadual("inscricao_estadual");
        if (rs.next()) {
            System.out.println("ID:" + rs.getInt(1));
            c.setId(rs.getInt(1));
        
        String sql_endereco = "INSERT INTO endereco (rua,cidade,cep,bairro,numero,complemento,cliente_id) VALUES(?,?,?,?,?,?,?)";
        PreparedStatement pstm_endereco = conn.prepareStatement(sql_endereco);
        pstm_endereco.setString(1, e.getRua());
        pstm_endereco.setString(2, e.getCidade());
        pstm_endereco.setString(3, e.getCep());
        pstm_endereco.setString(4, e.getBairro());
        pstm_endereco.setString(5, e.getNumero());
        pstm_endereco.setString(6, e.getComplemento());
        pstm_endereco.setInt(7, c.getId());
        pstm_endereco.execute();
         this.desconectar();
        }
    }

     }
    
    
    public void inserir(Endereco e) throws Exception {
        String sql = "INSERT INTO endereco (rua,cidade,cep,bairro,numero,complemento,cliente_id) VALUES(?,?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, e.getRua());
        pstm.setString(2, e.getCidade());
        pstm.setString(3, e.getCep());
        pstm.setString(4, e.getBairro());
        pstm.setString(5, e.getNumero());
        pstm.setString(6, e.getComplemento());
        pstm.setInt(7, e.getCliente().getId());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Cliente> listar() throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome_fantasia(rs.getString("nome_fantasia"));
            c.setTelefone(rs.getString("telefone"));
            c.setSenha(rs.getString("senha"));
            c.setCpf_cnpj(rs.getString("cpf_cnpj"));
            c.setEmail(rs.getString("email"));
            c.setInscricao_estadual("inscricao_estadual");
            lista.add(c);

        }
        this.desconectar();
        return lista;
    }
    
    public ArrayList<Cliente> listarCliente(int id) throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
         pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome_fantasia(rs.getString("nome_fantasia"));
            c.setTelefone(rs.getString("telefone"));
            c.setSenha(rs.getString("senha"));
            c.setCpf_cnpj(rs.getString("cpf_cnpj"));
            c.setEmail(rs.getString("email"));
            c.setInscricao_estadual("inscricao_estadual");
            lista.add(c);

        }
        this.desconectar();
        return lista;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    
      public Cliente carregarPorIdCliente(int id) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setNome_fantasia(rs.getString("nome_fantasia"));
            c.setTelefone(rs.getString("telefone"));
            c.setSenha(rs.getString("senha"));
            c.setCpf_cnpj(rs.getString("cpf_cnpj"));
            c.setEmail(rs.getString("email"));
            c.setInscricao_estadual(rs.getString("inscricao_estadual"));

        }
        this.desconectar();
        return c;
    }
    
    

    public Cliente carregarPorId(int id) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setNome_fantasia(rs.getString("nome_fantasia"));
            c.setTelefone(rs.getString("telefone"));
            c.setSenha(rs.getString("senha"));
            c.setCpf_cnpj(rs.getString("cpf_cnpj"));
            c.setEmail(rs.getString("email"));
            c.setInscricao_estadual(rs.getString("inscricao_estadual"));
            ClienteDAO cDAO = new ClienteDAO();
            c.setEnderecos(cDAO.listarEndereco(rs.getInt("id")));
        }
        this.desconectar();
        return c;
    }

    public void alterar(Cliente c) throws Exception {
        String sql = "UPDATE cliente SET nome_fantasia=?,telefone=?,senha=?,email=?,cpf_cnpj=?,inscricao_estadual=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome_fantasia());
        pstm.setString(2, c.getTelefone());
        pstm.setString(3, c.getSenha());
        pstm.setString(4, c.getEmail());
        pstm.setString(5, c.getCpf_cnpj());
        pstm.setString(6, c.getInscricao_estadual());
        pstm.setInt(7, c.getId());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Endereco> listarEndereco(int cliente_id) throws Exception {
        ArrayList<Endereco> lista = new ArrayList<Endereco>();
        String sql = "SELECT * FROM endereco WHERE cliente_id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, cliente_id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Endereco e = new Endereco();
            e.setId(rs.getInt("id"));
            e.setRua(rs.getString("rua"));
            e.setCidade(rs.getString("cidade"));
            e.setCep(rs.getString("cep"));
            e.setBairro(rs.getString("bairro"));
            e.setNumero(rs.getString("numero"));
            e.setComplemento(rs.getString("complemento"));
            lista.add(e);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Endereco> listarEnderecos() throws Exception {
        ArrayList<Endereco> lista = new ArrayList<Endereco>();
        String sql = "SELECT * FROM endereco";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Endereco e = new Endereco();
            e.setId(rs.getInt("id"));
            e.setRua(rs.getString("rua"));
            e.setCidade(rs.getString("cidade"));
            e.setCep(rs.getString("cep"));
            e.setBairro(rs.getString("bairro"));
            e.setNumero(rs.getString("numero"));
            e.setComplemento(rs.getString("complemento"));
            e.setCliente(carregarPorId(rs.getInt("cliente_id")));
            lista.add(e);
        }
        this.desconectar();
        return lista;
    }
    
    
    public void excluirEndereco(int id) throws Exception {
        String sql = "DELETE FROM endereco WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Endereco carregarPorIdEndereco(int id) throws Exception {
        Endereco e = new Endereco();
        String sql = "SELECT * FROM endereco WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            e.setId(rs.getInt("id"));
            e.setRua(rs.getString("rua"));
            e.setCidade(rs.getString("cidade"));
            e.setCep(rs.getString("cep"));
            e.setBairro(rs.getString("bairro"));
            e.setNumero(rs.getString("numero"));
            e.setComplemento(rs.getString("complemento"));
            ClienteDAO cDAO = new ClienteDAO();
            e.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));
        }
        this.desconectar();
        return e;
    }

    public void alterar(Endereco e) throws Exception {
        String sql = "UPDATE endereco SET rua=?,cidade=?,cep=?,bairro=?,numero=?,complemento=?,cliente_id=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, e.getRua());
        pstm.setString(2, e.getCidade());
        pstm.setString(3, e.getCep());
        pstm.setString(4, e.getBairro());
        pstm.setString(5, e.getNumero());
        pstm.setString(6, e.getComplemento());
        pstm.setInt(7,e.getCliente().getId());
        pstm.setInt(8, e.getId());
        pstm.execute();
        this.desconectar();
    }

    public Cliente logar(String cpf_cnpj, String senha) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE cpf_cnpj=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, cpf_cnpj);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                c.setId(rs.getInt("id"));
                c.setNome_fantasia(rs.getString("nome_fantasia"));
                c.setTelefone(rs.getString("telefone"));
                c.setSenha(rs.getString("senha"));
                c.setCpf_cnpj(rs.getString("cpf_cnpj"));
                c.setEmail(rs.getString("email"));
                c.setInscricao_estadual("inscricao_estadual");
            }
        }
        this.desconectar();
        return c;
    }
}
