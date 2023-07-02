
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.ShadowDTO;
import DAO.ShadowDAO;

@WebServlet("/StockupServlet")
public class StockupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StockupServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		ShadowDTO dto = new ShadowDTO();

		String Product[] = request.getParameterValues("product");
		String Quantity[] = request.getParameterValues("quantity");
		String Price[] = request.getParameterValues("price");

		for (int i = 0; i < Product.length; i++) {
			System.out.println("Product=" + Product[i]);
		}
		for (int i = 0; i < Quantity.length; i++) {
			System.out.println("Quantity=" + Quantity[i]);
		}
		for (int i = 0; i < Price.length; i++) {
			System.out.println("Price=" + Price[i]);
		}

		dto.setProduct(Product);
		dto.setQuantity(Quantity);
		dto.setPrice(Price);

		ShadowDAO dao = new ShadowDAO();
		dao.stockupdate(dto);

		response.setContentType("text/html");
		response.getWriter().println("<h2>Products Added Successfully!</h2>");
	}

}
