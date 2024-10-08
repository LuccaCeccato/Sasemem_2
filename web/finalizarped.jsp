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
    int idCliente = 0;
    int idPedido = 0;
    java.sql.Date dataPedidoSql = null;

    try {
        if (request.getParameter("id_cliente") != null && request.getParameter("id_pedido") != null && request.getParameter("data_pedido") != null) {
            idCliente = Integer.parseInt(request.getParameter("id_cliente"));
            idPedido = Integer.parseInt(request.getParameter("id_pedido"));
            String dataPedidoStr = request.getParameter("data_pedido");
            
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedDate = format.parse(dataPedidoStr);
            dataPedidoSql = new java.sql.Date(parsedDate.getTime());

            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco303", "root", "");

            String query = "INSERT INTO pedido (Id_Cliente, Id_Pedido, Data_Pedido) VALUES (?, ?, ?)";
            st = conecta.prepareStatement(query);

            st.setInt(1, idCliente);
            st.setInt(2, idPedido);
            st.setDate(3, dataPedidoSql);

            st.executeUpdate(); // Executa o comando insert

            out.print("Pedido cadastrado com sucesso!");

            st.close();
            conecta.close();
        } else {
            out.print("Todos os campos são obrigatórios.");
        }
    } catch (SQLException | ClassNotFoundException e) {
        out.print("Erro: " + e.getMessage());
    } catch (NumberFormatException e) {
        out.print("Erro de formato: " + e.getMessage());
    } catch (ParseException e) {
        out.print("Erro de parsing de data: " + e.getMessage());
    }
%>

</body>
</html>
