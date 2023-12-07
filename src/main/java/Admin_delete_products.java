import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Admin_delete_products extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");
            String query = "DELETE FROM admin_add_products WHERE id = ?";
            PreparedStatement pst = con.prepareStatement("select images from admin_add_products where id=? ");
			pst.setInt(1, id);
			ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                String image = resultSet.getString("images");
                // Do something with the result
                String pathname="C:/Users/lenov/eclipse-workspace/Quickkart-Mini_Project/src/main/webapp/products_img/"+image;
            	
                File img=new File(pathname);
  			  if (img.exists()) {
  	                if (img.delete()) {
  	                    System.out.println("Image file deleted.");
  	                } else {
  	                    System.out.println("Failed to delete image file.");
  	                }
  	            } else {
  	                System.out.println("Image file not found.");
  	            }
  			
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();}
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("Admin_product_show.jsp"); // Redirect to your page after deletion
    }
}
