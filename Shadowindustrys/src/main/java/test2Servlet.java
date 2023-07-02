
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class test2Servlet
 */
@WebServlet("/test2Servlet")
public class test2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public test2Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String productName = request.getParameter("productName");
		String productQuantity = request.getParameter("productQuantity");
		String productPrice = request.getParameter("productPrice");

		// Do further processing with the retrieved values
		// For example, you can store them in a database, perform calculations, etc.

		// Example: Printing the values to the console
		System.out.println("Product Name: " + productName);
		System.out.println("Product Quantity: " + productQuantity);
		System.out.println("Product Price: " + productPrice);

		// You can send a response back to the client if needed
		// For example, you can send a confirmation message or redirect to another page

		// Example: Sending a response message
		response.setContentType("text/html");
		response.getWriter().println("<h2>Product Added Successfully!</h2>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
