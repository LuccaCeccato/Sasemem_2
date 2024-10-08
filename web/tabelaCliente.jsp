<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Produtos</title>
    <link rel="stylesheet" href="supply360.css"/>
</head>
<body>
    <table class="w-full text-sm text-left text-blazeOrange">
        <thead class="text-xs text-blazeOrange uppercase bg-white">
            <tr>
                <th scope="col" class="px-4 py-3">ID</th>
                <th scope="col" class="px-4 py-4">Nome</th>
                <th scope="col" class="px-4 py-3">E-mail</th>
                <th scope="col" class="px-4 py-3"></th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SoloLeve", "root", "");
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM Desenvolvedores";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        int idDev = rs.getInt("id_desenvol");
                        String nomeDev = rs.getString("nome_desenvol");
                        String emailDev = rs.getString("email_desenvol");
            %>
            <tr class="text-xs text-blazeOrange uppercase bg-white">
                <td class="px-4 py-3"><%= idDev %></td>
                <td class="px-4 py-3 font-medium text-blazeOrange whitespace-nowrap"><%= nomeDev %></td>
                <td class="px-4 py-3"><%= emailDev %></td>
                <td class="px-4 py-3 relative">
                    <button class="pulse-on-hover items-center text-sm font-medium hover:bg-blazeOrange p-1.5 text-center text-blazeOrange rounded-lg focus:outline-none dropdown-button">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M6 10a2 2 0 11-4 0 2 2 0 014 0zM12 10a2 2 0 11-4 0 2 2 0 014 0zM16 12a2 2 0 100-4 2 2 0 000 4z"/>
                        </svg>
                    </button>
                    <div class="hidden dropdown fixed inset-0 z-40 flex items-center justify-center bg-black bg-opacity-50">
                        <div class="relative p-4 w-full max-w-md mx-auto bg-white rounded-lg shadow-lg">
                            <button type="button" class="text-blazeOrange bg-transparent rounded-lg text-sm p-1.5 inline-flex items-center ml-auto dropdown-button">
                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"/>
                                </svg>
                                <span class="sr-only">Fechar</span>
                            </button>
                            <ul class="text-lg text-center w-full">
                                <li>
                                    <button type="button" class="flex w-full items-center py-2 px-4 rounded-lg text-blazeOrange">
                                        <svg class="w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                            <path d="M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z"/>
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"/>
                                        </svg>
                                        Editar
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="flex w-full items-center py-2 px-4 rounded-lg text-blazeOrange">
                                        <svg class="w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                            <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/>
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z"/>
                                        </svg>
                                        Visualizar
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="flex w-full items-center py-2 px-4 rounded-lg text-blazeOrange">
                                        <svg class="w-4 h-4 mr-2" viewBox="0 0 14 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" clip-rule="evenodd" fill="currentColor" d="M6.09922 0.300781C5.93212 0.30087 5.76835 0.347476 5.62625 0.435378C5.48414 0.523281 5.36931 0.649009 5.29462 0.798481L4.64282 2.10078H1.59922C1.36052 2.10078 1.13161 2.1956 0.962823 2.36439C0.79404 2.53317 0.699219 2.76209 0.699219 3.00078C0.699219 3.23948 0.79404 3.46839 0.962823 3.63718C1.13161 3.80596 1.36052 3.90078 1.59922 3.90078V12.9008C1.59922 13.3782 1.78886 13.836 2.12643 14.1736C2.46399 14.5111 2.92183 14.7008 3.39922 14.7008H10.5992C11.0766 14.7008 11.5344 14.5111 11.872 14.1736C12.2096 13.836 12.3992 13.3782 12.3992 12.9008V3.90078C12.6379 3.90078 12.8668 3.80596 13.0356 3.63718C13.2044 3.46839 13.2992 3.23948 13.2992 3.00078C13.2992 2.76209 13.2044 2.53317 13.0356 2.36439C12.8668 2.1956 12.6379 2.10078 12.3992 2.10078H9.35562L8.70382 0.798481C8.62913 0.649009 8.5143 0.523281 8.3722 0.435378C8.23009 0.347476 8.06632 0.30087 7.89922 0.300781H6.09922ZM9.39922 3.90078H4.59922V12.9008C4.59922 13.1395 4.69404 13.3684 4.86282 13.5372C5.03161 13.706 5.26052 13.8008 5.49922 13.8008H8.49922C8.73791 13.8008 8.96683 13.706 9.13561 13.5372C9.3044 13.3684 9.39922 13.1395 9.39922 12.9008V3.90078Z"/>
                                        </svg>
                                        Deletar
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("Erro ao conectar ao banco de dados: " + e.getMessage());
                } finally {
                    if (rs != null) try { rs.close(); } catch (Exception e) {}
                    if (stmt != null) try { stmt.close(); } catch (Exception e) {}
                    if (conn != null) try { conn.close(); } catch (Exception e) {}
                }
            %>
        </tbody>
    </table>

    <script>
        const dropdownButtons = document.querySelectorAll('.dropdown-button');
        dropdownButtons.forEach(button => {
            button.addEventListener('click', () => {
                const dropdown = button.closest('td').querySelector('.dropdown');
                dropdown.classList.toggle('hidden');
            });
        });
    </script>
</body>
</html>
