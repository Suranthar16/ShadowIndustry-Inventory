package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.ShadowDTO;
import ShadowDB.ShadowDB;

public class ShadowDAO {
	
	//insert intial infomation into database
	public boolean Orderdao(ShadowDTO dto) {

		ShadowDB db = new ShadowDB();
		Connection conn = db.getConnection();
		boolean result1 = false;

		String sql = "INSERT INTO test1.shadowlogin(Name,Email,Phone)VALUES(?,?,?);";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getPhone());

			double result = 0;
			result = ps.executeUpdate();
			System.out.println(result);
			if (result > 0) {
				result1 = true;
				System.out.println("insert success!");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;

	}
	
	//new stock updating
	public boolean stockupdate(ShadowDTO dto) {

		ShadowDB db = new ShadowDB();
		Connection conn = db.getConnection(); /*
												 * UPDATE Customers SET ContactName = 'Alfred Schmidt', City=
												 * 'Frankfurt'WHERE CustomerID = 1;
												 */
		boolean result1 = false;

		String Product[] = dto.getProduct();
		String Quantity[] = dto.getQuantity();
		String Price[] = dto.getPrice();

		for (int i = 0; i < Product.length; i++) {

			String sql = "UPDATE test1.shadowstock SET Product=?,Quantity=?,Price=? WHERE Product=?;";
			PreparedStatement ps = null;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, Product[i]);
				ps.setString(2, Quantity[i]);
				ps.setString(3, Price[i]);
				ps.setString(4, Product[i]);

				double result = 0;
				result = ps.executeUpdate();// Important key for Updating values into Database
				System.out.println(result);
				if (result > 0) {
					result1 = true;
					System.out.println("insert success!");
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return false;
	}
	
	//inserting orders into database
	public boolean orders(ShadowDTO dto) {

		ShadowDB db = new ShadowDB();
		Connection conn = db.getConnection();
		boolean result1 = false;

		String sql = "INSERT INTO test1.shadoworders(Name,Email,Phone,DeliveryAddress,OrderDate,ContactNumber)VALUES(?,?,?,?,?,?);";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getPhone());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getDate());
			ps.setString(6, dto.getNumber());

			double result = 0;
			result = ps.executeUpdate();
			System.out.println(result);
			if (result > 0) {
				result1 = true;
				System.out.println("insert success!");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;

	}
	
	//insert Product and Quantity into database
	public boolean pqorders(ShadowDTO dto) {

		ShadowDB db = new ShadowDB();
		Connection conn = db.getConnection();
		boolean result1 = false;

		String Phone = dto.getNumber();
		String Product[] = dto.getProduct();
		String Quantity[] = dto.getQuantity();

		for (int i = 0; i < Product.length; i++) {

			String sql = "INSERT INTO test1.shadowpqorder(Phone,Product,Quantity)VALUES(?,?,?);";
			PreparedStatement ps = null;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, Phone);
				ps.setString(2, Product[i]);
				ps.setString(3, Quantity[i]);

				double result = 0;
				result = ps.executeUpdate();
				System.out.println(result);
				if (result > 0) {
					result1 = true;
					System.out.println("insert success!");
				}
			} catch (Exception e) {
				System.out.println(e);
			}

		}
		return false;
	}
	
	//getting current stock detials
	public ArrayList<ShadowDTO> stockprice() {

		ShadowDB db = new ShadowDB();
		Connection conn = db.getConnection();
		boolean result1 = false;

		ArrayList<ShadowDTO> Pricelist = new ArrayList<ShadowDTO>();
		System.out.println(conn);
		ResultSet rs = null;
		PreparedStatement ps = null;

		String sql = "select * from test1.shadowstock;";

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			System.out.println(rs);

			while (rs.next()) {

				ShadowDTO dto1 = new ShadowDTO();
				String Products = rs.getString("Product");
				System.out.println("Products-->" + Products);
				dto1.setProducts(Products);

				String Quantitys = rs.getString("Quantity");
				System.out.println("Quantitys---->" + Quantitys);
				dto1.setQuantitys(Quantitys);

				String Prices = rs.getString("Price");
				System.out.println("Prices---->" + Prices);
				dto1.setPrices(Prices);

				Pricelist.add(dto1);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return Pricelist;
	}

}
