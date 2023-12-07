import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig

public class admin_user_update extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Long contact_number = Long.parseLong(request.getParameter("contact_number"));
		String email= request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");
            PreparedStatement ps = con
                    .prepareStatement("UPDATE quickkart_user_login SET username=?, email=?, password=?, contact_number=?  WHERE username=?");
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setLong(4, contact_number);
            ps.setString(5,username);
          
            ps.executeUpdate();
            
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("admin_user_details_show.jsp").forward(request, response);
    }
}