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
    int idUsuario;
    String nomeUsuario;
    String emailUsuario;
    String senhaUsuario;
    String statusUsu;
    String status;
    int desenvolvedorId;
    

    
            idUsuario = Integer.parseInt(request.getParameter("id_Usuario"));
            nomeUsuario = request.getParameter("nome_Usuario");
            emailUsuario = request.getParameter("email_Usuario");
            senhaUsuario = request.getParameter("senha_Usuario");
            statusUsu = request.getParameter("status_Usu");
            status = request.getParameter("status");
            desenvolvedorId = Integer.parseInt(request.getParameter("id_Dev"));

            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/SoloLeve", "root", "");

            String query = "INSERT INTO Usuarios (nome_usu, email_usu, senha_usu, status, desenvolvedor_id) VALUES (?,?,?,?,?,?,?)";
            st = conecta.prepareStatement(query);

            st.setInt(1, idUsuario);
            st.setString(2, nomeUsuario);
            st.setString(3, emailUsuario);
            st.setString(4, senhaUsuario);
            st.setString(5, statusUsu);
            st.setString(6, status);
            st.setInt(7, desenvolvedorId);
            

            st.executeUpdate(); // Executa o comando insert

            out.print("Pedido cadastrado com sucesso!");

            st.close();
            conecta.close();
        
    
%>

</body>
</html>
