

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig
public class Admin_update_products extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int id = Integer.parseInt(request.getParameter("id"));
		int price= Integer.parseInt(request.getParameter("price"));
		String name = request.getParameter("name");
		int discount = Integer.parseInt(request.getParameter("discount"));
		Part file=request.getPart("images");
		String images=file.getSubmittedFileName();
		String categories=request.getParameter("categories");
		String description= request.getParameter("description");
		System.out.print(name+""+price+""+images+" "+categories);
		String pathname="C:/Users/lenov/eclipse-workspace/Quickkart-Mini_Project/src/main/webapp/products_img/"+images;
		try {
			
		FileOutputStream fos=new FileOutputStream(pathname);
		InputStream is=file.getInputStream();
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		System.out.println(pathname);
			
		} catch (Exception e) {
			
			// TODO: handle exception
			System.out.println(e);
			
		}

        try {			
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");
            PreparedStatement ps = con
                    .prepareStatement("UPDATE admin_add_products SET name=?, price=?, discount=?, categories=?, images=?, description=? WHERE id=?");
            ps.setString(1, name);
            ps.setInt(2, price);
            ps.setInt(3, discount);
            ps.setString(4, categories);
            ps.setString(5, images);
            ps.setString(6, description);
            ps.setInt(7, id);

            ps.executeUpdate();
            
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("Admin_product_show.jsp").forward(request, response);
    }
}
