package servlet;

import controller.SQLControl;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Product;

/*
@SuppressWarnings("serial")
*/

public class ProductServlet extends HttpServlet {

    /**
	 * 
	 */

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws SQLException 
     */
    @SuppressWarnings({ "unchecked" })
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException,IndexOutOfBoundsException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        SQLControl control = new SQLControl();
        //get sessuin
        HttpSession session = request.getSession();
        ArrayList<Cart> arrCart = new ArrayList<Cart>();
       //arrCart.ensureCapacity(10);
        ArrayList<Product> arrPro = new ArrayList<Product>();
        //arrPro.ensureCapacity(10);
        //get product detail
        arrPro = control.selectProduct(id);

        //store product infomartion to session
        if (session.getAttribute("cart") == null) {
            //if not exist session cart
            //add new product to cart
            arrCart.add(new Cart(arrPro.get(0).getpId(), arrPro.get(0).getpName(), arrPro.get(0).getpPrice(),1));
        } else {
            arrCart = (ArrayList<Cart>) session.getAttribute("cart");
            //if ID is exist
            //increase quantity
            boolean checkID=false;
            for (int i = 0; i < arrCart.size(); i++) {
                if (arrCart.get(i).getpID().equalsIgnoreCase(id)) {
                    arrCart.get(i).setQuantity(arrCart.get(i).getQuantity() + 1);
                    checkID = true;
                    break;
                }
            }
            //if ID isn't exist
            if (checkID ==false) {
                 arrCart.add(new Cart(arrPro.get(0).getpId(), arrPro.get(0).getpName(), arrPro.get(0).getpPrice(), 1));
            }
        }
        //set session
        session.setAttribute("cart", arrCart);
        response.sendRedirect("cart.jsp");

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
        try {
			processRequest(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
        try {
			processRequest(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
