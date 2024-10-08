<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="refresh" content="0;url=supply360-produto.html">
    <title>Cadastro de Produto</title>
</head>
<body>

<%
    // Receber os dados digitados no formulário codpro.html
    int codigo;
    String nome;
    String descricao;
    int quantidade;

    Connection conecta = null;
    PreparedStatement stProduto = null;
    PreparedStatement stEstoque = null;

    
        codigo = Integer.parseInt(request.getParameter("id"));
        nome = request.getParameter("name");
        descricao = request.getParameter("descricao");
        quantidade = Integer.parseInt(request.getParameter("quantidade"));

        // Fazer conexão com o banco de dados
        Class.forName("com.mysql.cj.jdbc.Driver");
        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco303", "root", "");
        conecta.setAutoCommit(false); // Iniciar transação

        // Inserir os dados na tabela produto do banco de dados aberto
        stProduto = conecta.prepareStatement("INSERT INTO produto (Id_Produto, Nome_Produto, Descr_Produto) VALUES (?, ?, ?)");
        stProduto.setInt(1, codigo);
        stProduto.setString(2, nome);
        stProduto.setString(3, descricao);
        stProduto.executeUpdate();

        // Inserir os dados na tabela estoque
        stEstoque = conecta.prepareStatement("INSERT INTO estoque (Id_Estoque, Qtd_Estoque) VALUES (?, ?)");
        stEstoque.setInt(1, codigo);
        stEstoque.setInt(2, quantidade);
        stEstoque.executeUpdate();

        // Commitar a transação
        conecta.commit();
   
    
%>

</body>
</html>
