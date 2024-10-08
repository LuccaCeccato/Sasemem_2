import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/LoginServlet") //especifica a url que o servlet responde
public class LoginServlet extends HttpServlet { //classe do servlet extendendo o HttpServlet
    private static final long serialVersionUID = 1L; //evita problema, dog

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)//metodo doPost recebe request=requisicao e response=resposta
            throws ServletException, IOException {
        String username = request.getParameter("username"); //valor do username
        String password = request.getParameter("password"); //valor do password
        
        try {
            
            //conexao com o banco
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/sololeve","root","");
            
            // select do sql pra ver se tem o usuario no banco
            String sql = "SELECT * FROM Usuarios WHERE nome_usu = ? AND senha_usu = ?";
            PreparedStatement statement = connecta.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            
            ResultSet rs = statement.executeQuery();
            
            if (rs.next()) {
                // se o usuário existe, manda pra pagina inicial
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("telaBase.html");
            } else{ //se não existe, dale o erro
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("Senha ou usuario invalido.");
            }
            
            // Fecha a connexão
            rs.close();
            statement.close();
            connecta.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("Error occurred while processing the request.");
        }
    }
}
