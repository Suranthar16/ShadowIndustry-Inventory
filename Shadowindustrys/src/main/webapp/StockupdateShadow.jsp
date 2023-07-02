<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shadow</title>
</head>
<body>

<h1>Stock Update</h1>
	<form id="stockupdate" name="stockupdate">
		<table>
			<tr class="pro">
				<th>Products:</th>
				<td><button type="button" class="deletebtn" title="Remove row">X</button></td>
				<td><select  id="product" name="product" required>
				<option >--Select--</option>
				<option value="Gunmetalimpeller">Gunmetalimpeller</option>
				<option value="LTB4Bushes">LTB4Bushes</option>
				<option value="LTB4Bushes">LTB4Bushes</option>
				<option value="BorewellPumpImpeller">BorewellPumpImpeller</option>
				<option value="V4Bushes">V4Bushes</option>
				<option value="V5Bushes">V5Bushes</option>
				<option value="DmsImpeller">DmsImpeller</option>
				<option value="PhosphorBronzeCasting">PhosphorBronzeCasting</option>
				</select></td>
				<th>Quantity:</th>
				<td><input type="number" id="quantity" name="quantity" value="" placeholder="00" required></td>
				<th>Price:</th>
				<td><input type="number" id="price" name="price" value="" placeholder="00Rs" required></td>
			</tr>	
		</table>
		
		<button id="newbtn" >Add Products</button><br>
		<input type="reset" id="clear" name="clear" value="Clear" >
		<input type="button" id="update" name="update" value="Update" onclick="updatefun()" >

	</form>

</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
   $(document).ready(function(){
      var x = 1;
      $("#newbtn").click(function () {
         $("table tr:First").clone().find("select").each(function () {
            $(this).val('').attr({
               'id': function (_, id) {
                  return id 
               },
               'name': function (_, name) {
                  return name 
               },
               'value': ''
            });
         }).end().appendTo("table");
         x++;
      });

      $(document).on('click', 'button.deletebtn', function () {
         $(this).closest('tr').remove();
         return false;
      });
   });
</script>
<script type="text/javascript">
	function updatefun() {
		
		document.getElementById("stockupdate").action="StockupServlet";
		document.getElementById("stockupdate").method="post";
		document.getElementById("stockupdate").submit();
	}
</script>
</html>