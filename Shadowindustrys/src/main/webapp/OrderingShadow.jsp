<%@ page import="java.util.ArrayList"%>
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

	<%
	ArrayList<ShadowDTO> Pricelist = (ArrayList<ShadowDTO>) session.getAttribute("Pricelist");
	%>

	<%
	ShadowDTO dto = new ShadowDTO();
	dto = (ShadowDTO) session.getAttribute("dto");
	%>

	<h2>Place Your Order</h2>
	<form id="orderform" name="orderform">
		<p>Name:</p>
		<input type="text" id="name" name="name" value="<%=dto.getName()%>"
			placeholder="abc" required>
		<p>Email:</p>
		<input type="email" id="email" name="email"
			value="<%=dto.getEmail()%>" placeholder="xyz@gmail">
		<p>Phone:</p>
		<input type="tel" id="phone" name="phone" value="<%=dto.getPhone()%>"
			placeholder="000-000-0000" required>
		<p>Delivery Address:</p>
		<input type="text" id="address" name="address" value=""
			placeholder="full Adddress" required>
		<p>Order Date:</p>
		<input type="date" id="date" name="date" value="" required>
		<p>Contact Number:</p>
		<input type="tel" id="number" name="number" value=""
			placeholder="000-000-0000" required>

		<div>
			<table id="table1" border="1">
				<tr>
					<th>List of Itams</th>
				</tr>
				<tr>
					<th>Product</th>
					<th>Available Quantity</th>
					<th>Price/pice</th>
				</tr>

				<%
				if (Pricelist != null) {
					for (int i = 0; i < Pricelist.size(); i++) {
						ShadowDTO dto1 = Pricelist.get(i);
				%>

				<tr>
					<td><%=dto1.getProducts()%></td>
					<td><%=dto1.getQuantitys()%></td>
					<td><%=dto1.getPrices()%></td>
				</tr>

				<%
				}
				}
				%>
			</table>
		</div>
		<div>
			<table border="1" id="table2">
				<tr class="pro">
					<th>Products:</th>
					<td><button type="button" class="deletebtn" title="Remove row">X</button></td>
					<td><select id="product" name="product" onchange="maxfun()"
						required>
							<option>--Select--</option>
							<option value="Gunmetalimpeller">Gunmetalimpeller</option>
							<option value="LTB4Bushes">LTB4Bushes</option>
							<option value="LTB5Bushes">LTB4Bushes</option>
							<option value="BorewellPumpImpeller">BorewellPumpImpeller</option>
							<option value="V4Bushes">V4Bushes</option>
							<option value="V5Bushes">V5Bushes</option>
							<option value="DmsImpeller">DmsImpeller</option>
							<option value="PhosphorBronzeCasting">PhosphorBronzeCasting</option>
					</select></td>
					<th>Quantity</th>
					<td><input type="number" id="quantity" name="quantity"
						value="" placeholder="00" max="10" required></td>
				</tr>

			</table>
		</div>
		<button id="newbtn">Add Products</button>
		<br> <input type="reset" id="clear" name="clear" value="Clear">
		<input type="button" id="proced" name="proced" value="Proced"
			onclick="procedfun()">
	</form>





</body>

<%-- 
<script type="text/javascript">
	function maxfun() {
		<% ArrayList<ShadowDTO> Pricelist= (ArrayList<ShadowDTO>)session.getAttribute("Pricelist");%>
		
		var product=document.getElementById("product").value
		
		
		
		 <%ShadowDTO dto1=new ShadowDTO();
		   dto=(ShadowDTO)session.getAttribute("dto");%>
		   
		   <%if(Pricelist!=null)%>console.log("Pricelist size---"+Pricelist.size())<%;%>
		   
		  <% if(Pricelist!=null){
		 		 for(int i=0;i<Pricelist.size();i++){
		 			 ShadowDTO dto2= Pricelist.get(i);
		 			 String product=dto2.getProducts();
		 			 String Quantity=dto2.getQuantitys();
		 			 String price=dto2.getPrices();%>
		 			 console.log(<%=product%>)
		 			 console.log(<%=Quantity%>)
		 			 console.log(<%=price%>)
		  			<%}
		   } %> var X=price;
		
	} 

</script> --%>



<script type="text/javascript">
	function procedfun() {
		var Name = document.getElementById("name").value
		var Email = document.getElementById("email").value
		var Phone = document.getElementById("phone").value
		var Address = document.getElementById("address").value
		var Date = document.getElementById("date").value
		var Number = document.getElementById("number").value
		var Product = document.getElementById("product").value
		var emailReg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var lettersReg = /^[A-Za-z]+$/;
		var phonenoReg = /^\d{10}$/;

		/* var count = document.getElementById("pro").childElementCount; */

		if (Name === "") {
			alert("enter valied name!");
		} else if (!lettersReg.test(Name)) {
			alert("Only Alphabets allowed inside Name!");
			return false;
		}

		if (Email === "") {

		} else if (!emailReg.test(Email)) {
			alert("Enter valied email!");
			return false;
		}
		if (Phone === "") {
			alert("Please provide Email or Phone");
		} else if (!phonenoReg.test(Phone)) {
			alert("Please provide valid Phone!");
			return false;
		} else {
			document.getElementById("orderform").action = "OrderServlet";
			document.getElementById("orderform").method = "post";
			document.getElementById("orderform").submit();

		}

	}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {
				var x = 1;
				$("#newbtn").click(
						function() {
							$('#table2 tr:nth-child(0) td:nth-child(2)')
									.clone().find("select").each(function() { /* #table1 tr:nth-child(3) td:nth-child(3) */
										$(this).val('').attr({
											'id' : function(_, id) {
												return id
											},
											'name' : function(_, name) {
												return name
											},
											'value' : ''
										});
									}).end().appendTo("#protable");
							x++;
						});

				$(document).on('click', 'button.deletebtn', function() {
					$(this).closest('tr').remove();
					return false;
				});
			});
</script>
</html>