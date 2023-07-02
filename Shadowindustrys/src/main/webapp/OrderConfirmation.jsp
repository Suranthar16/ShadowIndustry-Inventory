<%@ page import="DTO.ShadowDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shadow</title>
</head>
<body>

	<h2>Check and conform the Order</h2>

	<% ShadowDTO dto=new ShadowDTO();
   dto=(ShadowDTO)session.getAttribute("dto");%>

	<form id="conformorder" name="conformorder">
		<table border="1">
			<tr>
				<th>Name:</th>
				<td><%=dto.getName() %></td>
			</tr>
			<tr>
				<th>Email:</th>
				<td><%=dto.getEmail() %></td>
			</tr>
			<tr>
				<th>Phone:</th>
				<td><%=dto.getPhone() %></td>
			</tr>
			<tr>
				<th>Deliviry Address:</th>
				<td><%=dto.getAddress() %></td>
			</tr>
			<tr>
				<th>Ordered Date:</th>
				<td><%=dto.getDate() %></td>
			</tr>
			<tr>
				<th>Contact:</th>
				<td><%=dto.getNumber() %></td>
			</tr>

			<%  
			  String Product[]=dto.getProduct();
			String Quantity[]=dto.getQuantity();
			for(int i = 0; i < Product.length; i++) { %>
			<tr>
				<th>Product:</th>
				<td><%=Product[i] %></td>
				<th>Quantity:</th>
				<td><%=Quantity[i] %></td>
				<%} %>

			</tr>

			<tr>
				<td><input type="button" id="back" name="back" value="Back"
					onclick="backfun()"> <input type="button" id="confirmorder"
					name="confirmorder" value="Confirm Order" onclick="confirmfun()"></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
		function backfun() {
			
			window.location.href ="OrderingShadow.jsp";
			
		}
		function confirmfun() {
			
			document.getElementById("conformorder").action="OrderConfirmationServlet";
			document.getElementById("conformorder").method="post";
			document.getElementById("conformorder").submit();
			
		}
	
	</script>
</html>