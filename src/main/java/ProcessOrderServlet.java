import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.JsonValue;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProcessOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");

            Statement smtt = con.createStatement();
            ResultSet Rs = smtt.executeQuery("SELECT id FROM customer_order_confirm");
            int in = 0;
            while (Rs.next()) {
                int id = Rs.getInt("id");
                while (id > in) {
                    in = id;
                }
            }
            in++; // Increment outside the loop
            System.out.println(in);

            // Retrieve cart data from the request
            String cartDataString = request.getParameter("cartData");
            String customer_name = request.getParameter("customer_name");
            String email = request.getParameter("email");
            String phone_number = request.getParameter("phone_number");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String pin_code = request.getParameter("pin_code"); 
            String address = request.getParameter("address");
            String paymentOption = request.getParameter("payment-option");
            String discount=request.getParameter("discountedPrice");
           
            
            
            JsonReader jsonReader = Json.createReader(new StringReader(cartDataString));
            JsonArray cartData = jsonReader.readArray();
            jsonReader.close();

            // Insert cart data into the database
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO customer_order_confirm (customer_name, email, phone_number, state, city, pin_code, address, product_name, product_price, product_quantity, paymentOption, id,discount) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
            for (JsonValue item : cartData) {
                JsonObject product = (JsonObject) item;
                String productName = product.getString("productName");
                System.out.println(productName);
                double productPrice = Double.parseDouble(product.getJsonNumber("productPrice").toString());
                int productQuantity = Integer.parseInt(product.getJsonNumber("productQuantity").toString());

                // Insert order details
                pstmt.setString(1, customer_name);
                pstmt.setString(2, email);
                pstmt.setString(3, phone_number);
                pstmt.setString(4, city);
                pstmt.setString(5, state);
                pstmt.setString(6, pin_code);
                pstmt.setString(7, address);
                pstmt.setString(8, productName);
                pstmt.setDouble(9, productPrice);
                pstmt.setInt(10, productQuantity);
                pstmt.setString(11, paymentOption);
                pstmt.setInt(12, in);
                pstmt.setString(13, discount);
                pstmt.executeUpdate();

                // Update stock value
                PreparedStatement updateStockStmt = con.prepareStatement("UPDATE ADMIN_ADD_PRODUCTS SET stock = stock - ? WHERE name = ?");
                updateStockStmt.setInt(1, productQuantity);
                updateStockStmt.setString(2, productName);
                updateStockStmt.executeUpdate();
                updateStockStmt.close();
            }

            
            // Close resources
            pstmt.close();
            con.close();

            // Send a response back to the client
            PrintWriter out = response.getWriter();
            out.print("Data received and stored successfully.");
            HttpSession session = request.getSession();
            session.setAttribute("id", in);
          
            response.sendRedirect("confirm_order.jsp");
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
            // Handle exceptions properly, e.g., by sending an error response to the client
            response.sendRedirect("confirm_order.jsp");
            
        }
        
    }
}
