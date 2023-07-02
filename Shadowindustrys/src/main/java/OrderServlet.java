
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.ShadowDTO;
import DAO.ShadowDAO;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderServlet() {
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

		String Name = request.getParameter("name");
		String Email = request.getParameter("email");
		String Phone = request.getParameter("phone");
		String Address = request.getParameter("address");
		String Date = request.getParameter("date");
		String Number = request.getParameter("number");

		/*
		 * for(int i=0;) String Product[]=request.getParameterValues("product"+i);
		 */

		String Product[] = request.getParameterValues("product");
		for (int i = 0; i < Product.length; i++) {
			System.out.println("Product=" + Product[i]);
		}
		String Quantity[] = request.getParameterValues("quantity");
		for (int i = 0; i < Quantity.length; i++) {
			System.out.println("Quantity=" + Quantity[i]);
		}

		dto.setName(Name);
		dto.setEmail(Email);
		dto.setPhone(Phone);
		dto.setAddress(Address);
		dto.setDate(Date);
		dto.setNumber(Number);
		dto.setProduct(Product);
		dto.setQuantity(Quantity);

		System.out.println("Name=" + Name);
		System.out.println("Email=" + Email);
		System.out.println("Phone=" + Phone);
		System.out.println("Address=" + Address);
		System.out.println("Date=" + Date);
		System.out.println("Number=" + Number);

		ShadowDAO dao = new ShadowDAO();

		HttpSession dtoSession = request.getSession();
		dtoSession.setAttribute("dto", dto);

		response.sendRedirect("OrderConfirmation.jsp");

	}

}
