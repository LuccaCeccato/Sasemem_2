<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="refresh" content="0;url=supply360-cliente.html">
    <title>Cadastro de Cliente</title>
</head>
<body>

<%
    int idCliente;
    String telefone;
    String nome;
    int cadastro;
    String email;
    String endereco;
    

    
            
            idCliente = Integer.parseInt(request.getParameter("id_cliente"));
            telefone = request.getParameter("telefone");
            nome = request.getParameter("nome");
            cadastro = Integer.parseInt(request.getParameter("cadastro"));
            email = request.getParameter("email");
            endereco = request.getParameter("endereco");
            

            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco303", "root", "");

            String query = "INSERT INTO cliente (Id_Cliente, Nome_Cliente, Ender_Cliente, Telef_Cliente, Cadas_Cliente, Email_Cliente) VALUES (?, ?, ?, ?, ?, ?)";
            st = conecta.prepareStatement(query);

            st.setInt(1, idCliente);
            st.setString(2, nome);
            st.setString(3, endereco);
            st.setString(4, telefone);
            st.setInt(5, cadastro);
            st.setString(6, email);
            

            st.executeUpdate(); // Executa o comando insert

            out.print("Pedido cadastrado com sucesso!");

            st.close();
            conecta.close();
        
    
%>

</body>
</html>
