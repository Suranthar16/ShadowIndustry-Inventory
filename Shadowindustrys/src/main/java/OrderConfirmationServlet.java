
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import DAO.ShadowDAO;
import DTO.ShadowDTO;

@WebServlet("/OrderConfirmationServlet")
public class OrderConfirmationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderConfirmationServlet() {
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

		HttpSession session = request.getSession();
		ShadowDTO dto = new ShadowDTO();
		dto = (ShadowDTO) session.getAttribute("dto");

		String Product[] = dto.getProduct();
		String Quantity[] = dto.getQuantity();

		System.out.println("cName=" + dto.getName());
		System.out.println("cEmail=" + dto.getEmail());
		System.out.println("cPhone=" + dto.getPhone());
		System.out.println("cAddress=" + dto.getAddress());
		System.out.println("cDate=" + dto.getDate());
		System.out.println("cNumber=" + dto.getNumber());

		for (int i = 0; i < Product.length; i++) {
			System.out.println("cProduct=" + Product[i]);
		}
		for (int i = 0; i < Quantity.length; i++) {
			System.out.println("cQuantity=" + Quantity[i]);
		}

		ShadowDAO dao = new ShadowDAO();
		dao.orders(dto);
		dao.pqorders(dto);
		dao.stockprice();

		ArrayList<ShadowDTO> Pricelist = dao.stockprice();
		if (Pricelist != null)
			System.out.println("Pricelist size---" + Pricelist.size());

		response.sendRedirect("BillingShadow.jsp");
	}

}
