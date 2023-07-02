
<%@ page import="java.util.*"%>
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
	<h2>SHADOW</h2>
	<h4>BILL</h4>

	<% ArrayList<ShadowDTO> Pricelist= (ArrayList<ShadowDTO>)session.getAttribute("Pricelist");%>

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
			<tr>
				<th>Product:</th>
				<th>Quantity:</th>
				<th>price:</th>
				<th>Rate:</th>
			</tr>

			<%  int total=0;
				String Product[]=dto.getProduct();
				String Quantity[]=dto.getQuantity();
				for(int i = 0; i < Product.length; i++) {
				
					String quan=Quantity[i] ;
					String product= Product[i];%>

			<tr>
				<td><input type="text" id="product" name="product"
					value="<%=Product[i] %>"></td>
				<td><input type="text" id="quantity" name="quantity"
					value="<%=quan %>"></td>

				<%  String p="";
				ShadowDTO dto2=new ShadowDTO();
				if(Pricelist.size()>0){
						
					
					 for(int j=0;j < Pricelist.size();j++){
							ShadowDTO dto1= Pricelist.get(j);
	 							String pr=dto1.getPrices();
	 							String qu=dto1.getQuantitys();
	 							String produc=dto1.getProducts();%>

				<%  int rate=0;
	 								
	 							if(product!=null&& produc !=null&& product.equals(produc)) { 
			
             							p=dto1.getPrices();
             							rate=Integer.parseInt(quan)*Integer.parseInt(p);
             							total+=rate; %>

				<td><input type="text" id="price" name="price" value="<%=p %>"></td>
				<td><input type="text" id="rate" name="rate" value="<%=rate%>"></td>


				<%}} }%>


				<%} %>
			</tr>
			<tr>
				<th>Total:</th>
				<td><input type="text" id="total" name="total"
					value="<%=total%>"></td>
			</tr>

			<tr>
				<td><input type="button" id="back" name="back" value="Back"
					onclick="backfun()"> <input type="button" id="Print"
					name="Print" value="Print"></td>
			</tr>
		</table>
	</form>
</body>

<!-- <script type="text/javascript">
			function ratefun() {
			var product=document.getElementById("product").value	
			var quantity=document.getElementById("quantity").value
			var price=document.getElementById("price").value
			var rate=0;
			 console.log(price,product.length);
			 	for(var i=0;i<quantity.length;i++){
					 console.log( parseInt(price[i]))
				 	 console.log(parseInt(quantity[i]))
			        rate = parseInt(price)*parseInt(quantity);
					 document.getElementById("rate").value = rate;
					  console.log(rate);
			    }
		}
		
		ratefun();
	</script> -->


<script type="text/javascript">
		function totalfun() {
			
			 var rate = document.getElementsByName("rate");
			    var tot=0;
			    for(var i=0;i<rate.length;i++){
			        if(parseInt(rate[i].value))
			            tot += parseInt(rate[i].value);
			        
			       
			    }
			    document.getElementById("total").value = tot; 
		}
	</script>
<script type="text/javascript">
	function backfun() {
		window.location.href = "OrderConfirmation.jsp";
	}
	
	</script>
</html>


