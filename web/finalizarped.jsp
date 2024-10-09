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
    <meta http-equiv="refresh" content="0;url=supply360-pedido.html">
    <title>Cadastro de Pedido</title>
</head>
<body>

<%
   // Receber os dados digitados no formulário codpro.html
    int idTask;
    String descTask;
    int idDev;
    int typeTaskId;
    Date dtConclusao;
    String status;
    

    Connection conecta = null;
    PreparedStatement stTarefas = null;

    
        idTask = Integer.parseInt(request.getParameter("idTask"));
        descTask = request.getParameter("descTask");
        idDev = request.getParameter("idDev");
        typeTaskId = Integer.parseInt(request.getParameter("typeTaskId"));
        dtConclusao = request.getParameter("dtConclusao");
        statusTask = request.getParameter("statusTask");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

         // Converte a String para LocalDate
        LocalDate date = LocalDate.parse(dtConclusao, formatter);

        // Fazer conexão com o banco de dados
        Class.forName("com.mysql.cj.jdbc.Driver");
        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/SoloLeve", "root", "");
        conecta.setAutoCommit(false); // Iniciar transação

        // Inserir os dados na tabela produto do banco de dados aberto
        stTarefas = conecta.prepareStatement("INSERT INTO Tarefas (id_task, descricao_task, desenvolvedor_id, tipo_tarefa_id, data_conclusao, status) VALUES (?, ?, ?, ?, ?, ?)");
        stTarefas.setInt(1, idTask);
        stTarefas.setString(2, descTask);
        stTarefas.setInt(3, idDev);
        stTarefas.setInt(4, typeTaskId);
        stTarefas.setDate(5, dtConclusao);
        stTarefas.setInt(6, statusTask);
        stTarefas.executeUpdate();

        // Commitar a transação
        conecta.commit();
   
%>

</body>
</html>
