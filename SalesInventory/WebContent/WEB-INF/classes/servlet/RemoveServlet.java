package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;

/**
 * Servlet implementation class RemoveServlet
 */
public class RemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
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
    public RemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  response.setContentType("text/html;charset=UTF-8");
		  String pID=request.getParameter("id");
		  HttpSession session=request.getSession();

	//	  PrintWriter out = response.getWriter();
			@SuppressWarnings("unchecked")
			ArrayList<Cart> arrC = (ArrayList<Cart>) session.getAttribute("cart");
			  for (int i = 0; i < arrC.size(); i++) {
              if(arrC.get(i).getpID().contentEquals(pID))
            	  arrC.remove(arrC.get(i));
			  }
			  if(arrC.isEmpty())
			  {
				  session.setAttribute("cart",null);
			  }
			  else {
				  session.setAttribute("cart",arrC);
			  }
			  response.sendRedirect("cart.jsp");
			  		  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
