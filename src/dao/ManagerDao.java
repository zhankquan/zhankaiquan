package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import po.Actz;
import po.Customer;
import po.Manager;
import po.ManagerCustomer;
import po.Mx;
import po.Tz;
import po.Zzhk;

public class ManagerDao implements IManagerDao{
	private Connection conn = null;	
	public void initConnection(){
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=shiyan3","sa","990726");
		}catch(Exception ex){ex.printStackTrace();}
	}
	
	public boolean insertTz(Tz tz){
		String sql1 = "INSERT INTO T_TZ(NAME,STATUS,OFFICE,DATE,PRICE) VALUES(?,?,?,?,?)";
		try{
			initConnection();
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ps1.setString(1, tz.getName());
			ps1.setString(2, tz.getStatus());
			ps1.setString(3, tz.getOffice());
			ps1.setString(4, tz.getDate());
			ps1.setDouble(5, tz.getPrice());
			ps1.executeUpdate();
			return true;			
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return false;
	} 	
	
	
	
	public Manager getManagerByAccount(String account){
		String sql1 = "SELECT ACCOUNT,NAME,PASSWORD FROM T_MANAGER WHERE ACCOUNT=?";
		try{
			initConnection();
			PreparedStatement ps1 = conn.prepareStatement(sql1);			
			ps1.setString(1, account);
			ResultSet rs1 = ps1.executeQuery();
			if(rs1.next()){
				Manager manager=new Manager();
				manager.setAccount(rs1.getString("ACCOUNT"));
				manager.setPassword(rs1.getString("PASSWORD"));
				manager.setName(rs1.getString("NAME"));
				return manager;
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return null;
	} 	
	
	public Customer searchCustomerByAccount(String account){
		String sql1 = "SELECT ACCOUNT,PASSWORD,CNAME,CBALANCE,EMAIL FROM T_CUSTOMER WHERE ACCOUNT=?";
		try{
			initConnection();
			PreparedStatement ps1 = conn.prepareStatement(sql1);			
			ps1.setString(1, account);
			ResultSet rs1 = ps1.executeQuery();
			if(rs1.next()){
				Customer cus1 = new Customer();
				cus1.setAccount(rs1.getString("ACCOUNT"));
				cus1.setPassword(rs1.getString("PASSWORD"));
				cus1.setCname(rs1.getString("CNAME"));
				cus1.setCbalance(rs1.getDouble("CBALANCE"));
				cus1.setEmail(rs1.getString("EMAIL"));
				return cus1;
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return null;
	} 	
	
	
	
	
	public ArrayList getCustomerlist(){
		String sql1 = "SELECT ACCOUNT,PASSWORD,CNAME,CBALANCE,EMAIL FROM T_CUSTOMER ";
		ArrayList customerlist=new ArrayList();
		try{
			initConnection();
			PreparedStatement ps1 = conn.prepareStatement(sql1);			
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()){
				Customer customer = new Customer();
				customer.setAccount(rs1.getString("ACCOUNT"));
				customer.setPassword(rs1.getString("PASSWORD"));
				customer.setCname(rs1.getString("CNAME"));
				customer.setCbalance(rs1.getDouble("CBALANCE"));
				customer.setEmail(rs1.getString("EMAIL"));
				customerlist.add(customer);
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return customerlist;
	} 	
	
	public ArrayList getTzlist(){
		String sql1 = "SELECT NAME,STATUS,OFFICE,DATE,PRICE FROM T_TZ ";
		ArrayList tzlist=new ArrayList();
		try{
			initConnection();
			PreparedStatement ps1 = conn.prepareStatement(sql1);			
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()){
				Tz tz = new Tz();
				tz.setName(rs1.getString("NAME"));
				tz.setStatus(rs1.getString("STATUS"));
				tz.setOffice(rs1.getString("OFFICE"));
				tz.setDate(rs1.getString("DATE"));
				tz.setPrice(rs1.getDouble("PRICE"));
				tzlist.add(tz);
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return tzlist;
	} 	
	
	public boolean updateTz(Tz tz){
		String sql = "UPDATE T_TZ SET NAME=?,STATUS=?,DATE=?,PRICE=? WHERE OFFICE=?";
		try{
			initConnection();
			PreparedStatement ps = conn.prepareStatement(sql);			
			ps.setString(1, tz.getName());
			ps.setString(2, tz.getStatus());
			ps.setString(3, tz.getDate());
			ps.setDouble(4, tz.getPrice());
			ps.setString(5, tz.getOffice());
			ps.executeUpdate();
			return true;			
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return false;
	} 	
	

	public boolean updateActz(Map map){
		String sql = "UPDATE T_ACTZ SET PRICE=? WHERE OFFICE=?";
		String office=(String)map.get("office");
		Double price=(Double)map.get("price");
		try{
			initConnection();
			PreparedStatement ps = conn.prepareStatement(sql);			
			ps.setDouble(1, price);
			ps.setString(2, office);
			ps.executeUpdate();
			return true;			
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return false;
	} 	
	
	
	
	public void closeConnection(){
		try{
			if(conn!=null){
				conn.close();
				conn = null;
			}
		}catch(Exception ex){ex.printStackTrace();}
	}
}
