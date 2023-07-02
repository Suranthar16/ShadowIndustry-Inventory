<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shadow</title>
</head>
<body>
	<h2>Register</h2>
	<form id="regform" name="regform">

		<p>Name:</p>
		<input type="text" id="name" name="name" value="" placeholder="abc"
			required>
		<p>Email:</p>
		<input type="email" id="email" name="email" value=""
			placeholder="xyz@email.com">
		<p>Phone:</p>
		<input type="tel" id="phone" name="phone" value=""
			placeholder="000-000-0000">
		<p></p>
		<input type="reset" id="clear" name="clear" value="Clear"> <input
			type="button" id="register" name="register" value="Submit"
			onclick="regfun()">
	</form>
</body>
<script type="text/javascript">
	function regfun() {
		var Name = document.getElementById("name").value
		var Email = document.getElementById("email").value
		var Phone = document.getElementById("phone").value
		var emailReg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var lettersReg = /^[A-Za-z]+$/;
		var phonenoReg = /^\d{10}$/;

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
			document.getElementById("regform").action = "LoginShadowServlet";
			document.getElementById("regform").method = "post";
			document.getElementById("regform").submit();

		}

	}
</script>
</html>