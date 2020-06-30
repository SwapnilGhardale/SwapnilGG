package servlet;

import controller.SQLControl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;


import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*; 
public class ShoppingCardServlet extends HttpServlet {

  
	private static final long serialVersionUID = 1L;

	/**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SQLControl control = new SQLControl();
        //get session
        HttpSession session = request.getSession();
        //get cID,payMethod and date
        String cName = request.getParameter("custname");
        String ctele =request.getParameter("custtele");
        String payMethod = request.getParameter("txtMethod");
        String caddr="",ctele1="",transtype="Offline";
        if(session.getAttribute("log")!="true") {
        	 caddr=request.getParameter("custaddr");
        	 ctele1 =request.getParameter("custtele1");
        	 transtype="OnlineClient";
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date = dateFormat.format(new Date());
        
        PrintWriter out = response.getWriter();
        if (session.getAttribute("cart") != null) {
            try {
            	int totalPrice=0;

                String tot=request.getParameter("tot");
            	if(tot!=null)
            	{
            	totalPrice=Integer.parseInt(tot);
            	}
            	//insert order table
            	control.insertOrder(date,payMethod,cName,totalPrice,transtype,caddr,ctele,ctele1);
           
            } catch (SQLException ex) {
                System.out.println("SQL Error");
            }
            try {
                //insert orderline table
            	
                int orderID = control.getlastedOrID();
                @SuppressWarnings("unchecked")
				ArrayList<Cart> arrC = (ArrayList<Cart>) session.getAttribute("cart");
                for (int i = 0; i < arrC.size(); i++) {
                    String pID = arrC.get(i).getpID();
                    int quantity = arrC.get(i).getQuantity();
                    int price = arrC.get(i).getpPrice();
                    control.insertOrderLine(orderID, pID, quantity, price);
                    control.decreasestock(pID, quantity);
//stock decreasing
                }
                
                
            } catch (SQLException e) {
                System.out.println("SQL Error");
            }   
            
            String to=request.getParameter("mail");
            if(to!="") {
        
            String from="ghsonu2@gmail.com", password="sonugh27", sub="Your Order Receipt", msg="How r u?";  
                      //Get properties object    
          
                      Properties props = new Properties();    
                      props.put("mail.smtp.host", "smtp.gmail.com");    
                      props.put("mail.smtp.socketFactory.port", "465");    
                      props.put("mail.smtp.socketFactory.class",    
                                "javax.net.ssl.SSLSocketFactory");    
                      props.put("mail.smtp.auth", "true");    
                      props.put("mail.smtp.port", "465");    
                      //get Session   
                      Session session1 = Session.getDefaultInstance(props,    
                       new javax.mail.Authenticator() {    
                       protected PasswordAuthentication getPasswordAuthentication() {    
                       return new PasswordAuthentication(from,password);  
                       }    
                      });    
                      //compose message    
                      try {    
                       MimeMessage message = new MimeMessage(session1);    
                       message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
                       message.setSubject(sub);    
                     //  message.setText(msg);    
                       String tot=request.getParameter("tot");
                       message.setContent("<h1>Order Details</h1><br><table><tr><th>PaymentMethod</th><th>CustName</th><th>Total Order Amount</th><th>Mobile</th></tr><tr><td>"+payMethod+"</td><td>"+cName+"</td><td>"+tot+"</td><td>"+ctele+"</td></tr></table>","text/html" );  
                       
                       //send message  
                       Transport.send(message);    
                       System.out.println("message sent successfully");    
                      } catch (Exception e) {
                    	  
                      }    
                         to=null;
            }
          
                        
            //destroy session
           // session.invalidate();
                      session.setAttribute("cart", null);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Success. Thank you for using service. Check your Email for your receipt...');");
            out.println("location='product.jsp';");
            out.println("</script>");
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('You dont buy anything!! Plz buy something before checkout');");
            out.println("location='product.jsp';");
            out.println("</script>");
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
