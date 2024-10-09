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
    int idDev;
    String nomeDev;
    String emailDev;
    

    Connection conecta = null;
    PreparedStatement stDesenvolvedores = null;

    
        idDev = Integer.parseInt(request.getParameter("id"));
        nomeDev = request.getParameter("name");
        emailDev = request.getParameter("email");
       

        // Fazer conexão com o banco de dados
        Class.forName("com.mysql.cj.jdbc.Driver");
        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/SoloLeve", "root", "");
        conecta.setAutoCommit(false); // Iniciar transação

        // Inserir os dados na tabela produto do banco de dados aberto
        stDesenvolvedores = conecta.prepareStatement("INSERT INTO Desenvolvedores (id_desenvol, nome_desenvol, email_desenvol) VALUES (?, ?, ?)");
        stDesenvolvedores.setInt(1, idDev);
        stDesenvolvedores.setString(2, nomeDev);
        stDesenvolvedores.setString(3, emailDev);
        stDesenvolvedores.executeUpdate();

        // Commitar a transação
        conecta.commit();
   
    
%>

</body>
</html>
