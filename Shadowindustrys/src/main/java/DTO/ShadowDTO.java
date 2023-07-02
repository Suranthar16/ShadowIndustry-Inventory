package DTO;

public class ShadowDTO {
	
	String Name="";
	String Email="";
	String Phone="";

	
	String Address="";
	String Date="";
	String Number="";
	String Product[];
	String Quantity[];
	String Price[];
	
	String Products="";
	String Quantitys="";
	String Prices="";
	
	
	
	
	
	public String getProducts() {
		return Products;
	}
	public void setProducts(String products) {
		Products = products;
	}
	public String getQuantitys() {
		return Quantitys;
	}
	public void setQuantitys(String quantitys) {
		Quantitys = quantitys;
	}
	public String getPrices() {
		return Prices;
	}
	public void setPrices(String prices) {
		Prices = prices;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getNumber() {
		return Number;
	}
	public void setNumber(String number) {
		Number = number;
	}

	public String[] getProduct() {
		return Product;
	}
	public void setProduct(String[] product) {
		Product = product;
	}
	public String[] getQuantity() {
		return Quantity;
	}
	public void setQuantity(String[] quantity) {
		Quantity = quantity;
	}
	
	public String[] getPrice() {
		return Price;
	}
	public void setPrice(String[] price) {
		Price = price;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	

}
