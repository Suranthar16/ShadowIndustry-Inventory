<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Inventory</title>
</head>
<body>
	<h1>Inventory</h1>
	<form action="test2Servlet" method="POST">
		<table id="inventoryTable">
			<tr>
				<th>Product</th>
				<th>Quantity</th>
				<th>Price</th>
			</tr>
			<tr>
				<td>Product A</td>
				<td>10</td>
				<td>$19.99</td>
			</tr>
			<tr>
				<td>Product B</td>
				<td>5</td>
				<td>$9.99</td>
			</tr>
			<tr>
				<td>Product C</td>
				<td>2</td>
				<td>$14.99</td>
			</tr>
		</table>

		<br> <label for="productName">Product:</label> <input type="text"
			id="productName"> <label for="productQuantity">Quantity:</label>
		<input type="number" id="productQuantity"> <label
			for="productPrice">Price:</label> <input type="text"
			id="productPrice">
		<button onclick="addProduct()">Add Product</button>

		<script>
        function addProduct() {
            var productName = document.getElementById("productName").value;
            var productQuantity = document.getElementById("productQuantity").value;
            var productPrice = document.getElementById("productPrice").value;

            if (productName && productQuantity && productPrice) {
                var table = document.getElementById("inventoryTable");
                var row = table.insertRow(-1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);

                cell1.innerHTML = productName;
                cell2.innerHTML = productQuantity;
                cell3.innerHTML = "$" + productPrice;

                // Clear input fields
                document.getElementById("productName").value = "";
                document.getElementById("productQuantity").value = "";
                document.getElementById("productPrice").value = "";
            }
        }
    </script>
	</form>
</body>
</html>
