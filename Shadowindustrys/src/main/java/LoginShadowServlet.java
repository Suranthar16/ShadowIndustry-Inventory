
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.ShadowDTO;
import DAO.ShadowDAO;

@WebServlet("/LoginShadowServlet")
public class LoginShadowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginShadowServlet() {
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

		// getting Values from jsp
		String Name = request.getParameter("name");
		String Email = request.getParameter("email");
		String Phone = request.getParameter("phone");

		// setting the value in DTO
		dto.setName(Name);
		dto.setEmail(Email);
		dto.setPhone(Phone);

		System.out.println("Name=" + Name);
		System.out.println("Email=" + Email);
		System.out.println("Phone=" + Phone);

		ShadowDAO dao = new ShadowDAO();
		// calling function
		dao.Orderdao(dto);

		HttpSession dtoSession = request.getSession();
		dtoSession.setAttribute("dto", dto);

		ArrayList<ShadowDTO> Pricelist = dao.stockprice();
		if (Pricelist != null)
			System.out.println("Pricelist size---" + Pricelist.size());

		HttpSession Session = request.getSession();
		Session.setAttribute("Pricelist", Pricelist);

		response.sendRedirect("OrderingShadow.jsp");
	}

}
