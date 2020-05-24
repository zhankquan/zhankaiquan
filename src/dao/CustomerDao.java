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
import po.Apply;
import po.Chat;
import po.Customer;
import po.Friend;
import po.Mx;
import po.New;
import po.Tz;
import po.Zzhk;

public class CustomerDao implements ICustomerDao{
	private Connection conn = null;	
	public void initConnection(){
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=shiyan3","sa","990726");
		}catch(Exception ex){ex.printStackTrace();}
	}
	
	public boolean insertCustomer(Customer cus){
		String sql1 = "INSERT INTO T_CUSTOMER(ACCOUNT,PASSWORD,CNAME,CBALANCE,EMAIL) VALUES(?,?,?,?,?)";
		try{
			initConnection();
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ps1.setString(1, cus.getAccount());
			ps1.setString(2, cus.getPassword());
			ps1.setString(3, cus.getCname());
			ps1.setDouble(4, cus.getCbalance());
			ps1.setString(5, cus.getEmail());
			ps1.executeUpdate();
			return true;			
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return false;
	} 	
	
	public boolean insertMx(String account,String zf,double howmuch){
		String sql2= "INSERT INTO T_MX(ACCOUNT,TIME,ZF,HOWMUCH) VALUES(?,?,?,?)";
		Date date = new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :HH:mm:ss");

		try{
			initConnection();
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, account);
			ps2.setString(2, dateFormat.format(date));
			ps2.setString(3, zf);
			ps2.setDouble(4, howmuch);
			ps2.executeUpdate();
			return true;			
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return false;
	}
	public boolean insertZzhk(String eaccount,String iaccount,double money){
		String sql2= "INSERT INTO T_ZZHK(EACCOUNT,IACCOUNT,TIME,MONEY) VALUES(?,?,?,?)";
		Date date = new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :HH:mm:ss");

		try{
			initConnection();
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, eaccount);
			ps2.setString(2, iaccount);
			ps2.setString(3, dateFormat.format(date));
			ps2.setDouble(4, money);
			ps2.executeUpdate();
			return true;			
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return false;
		
	}
	
	public boolean insertActz(Actz actz){
		String sql2= "INSERT INTO T_ACTZ(ACCOUNT,NAME,OFFICE,STATUS,DATE,PRICE) VALUES(?,?,?,?,?,?)";
		try{
			initConnection();
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, actz.getAccount());
			ps2.setString(2, actz.getName());
			ps2.setString(3, actz.getOffice());
			ps2.setString(4, actz.getStatus());
			ps2.setString(5, actz.getDate());
			ps2.setDouble(6, actz.getPrice());
			ps2.executeUpdate();
			return true;			
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return false;
		
	}
	
	public boolean deleteActz(Map map){
		String account=(String)map.get("account");
		String office=(String)map.get("office");
		System.out.println(office+"..."+account);
		String sql2= "DELETE FROM T_ACTZ WHERE ACCOUNT=? AND OFFICE=?";
		try{
			initConnection();
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, account);
			ps2.setString(2, office);
			ps2.executeUpdate();
			return true;			
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return false;
	}
	
	public boolean updateCustomer(Customer cus){
		String sql = "UPDATE T_CUSTOMER SET PASSWORD=?,CNAME=?,CBALANCE=?,EMAIL=? WHERE ACCOUNT=?";
		try{
			initConnection();
			PreparedStatement ps = conn.prepareStatement(sql);			
			ps.setString(1, cus.getPassword());
			ps.setString(2, cus.getCname());
			ps.setDouble(3, cus.getCbalance());
			ps.setString(5, cus.getAccount());
			ps.setString(4, cus.getEmail());
			ps.executeUpdate();
			return true;			
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return false;
	} 	
	

	
	
	public Customer getCustomerByAccount(String account){
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

	public ArrayList getMxByAccount(String account){
		
		ArrayList list=new ArrayList();
		try{
			initConnection();
			 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //查询语句
			 String sql2 = "SELECT ACCOUNT,TIME,ZF,HOWMUCH FROM T_MX WHERE ACCOUNT='"+account+"' Order by TIME  DESC";
	            conn.prepareStatement(sql2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //执行查询
	            ResultSet rs2=stmt.executeQuery(sql2);
			
			
			
			while(rs2.next()){
				Mx cus2 = new Mx();
				cus2.setAccount(rs2.getString("ACCOUNT"));
				cus2.setTime(rs2.getString("TIME"));
				cus2.setZf(rs2.getString("ZF"));
				cus2.setHowmuch(rs2.getDouble("HOWMUCH"));
				list.add(cus2);
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return list;
	}
	public ArrayList getZzhkByAccount1(String account){
		ArrayList list2=new ArrayList();
		try{
			initConnection();
			 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //查询语句
			 String sql2 = "SELECT EACCOUNT,IACCOUNT,TIME,MONEY FROM T_ZZHK WHERE EACCOUNT='"+account+"' Order by TIME  DESC";
	            conn.prepareStatement(sql2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //执行查询
	            ResultSet rs2=stmt.executeQuery(sql2);
			
			while(rs2.next()){
				Zzhk cus3 = new Zzhk();
				cus3.setEaccount(rs2.getString("EACCOUNT"));
				cus3.setIaccount(rs2.getString("IACCOUNT"));
				cus3.setTime(rs2.getString("TIME"));	
				cus3.setMoney(rs2.getDouble("MONEY"));
				list2.add(cus3);
				System.out.println(cus3.getEaccount()+"123"+cus3.getIaccount());
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return list2;
	}
	
	public ArrayList getZzhkByAccount2(String account){
		ArrayList list3=new ArrayList();
		try{
			initConnection();
			 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //查询语句
			 String sql2 = "SELECT EACCOUNT,IACCOUNT,TIME,MONEY FROM T_ZZHK WHERE IACCOUNT='"+account+"' Order by TIME  DESC";
	            conn.prepareStatement(sql2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //执行查询
	            ResultSet rs2=stmt.executeQuery(sql2);
			
			while(rs2.next()){
				Zzhk cus3 = new Zzhk();
				cus3.setEaccount(rs2.getString("EACCOUNT"));
				cus3.setIaccount(rs2.getString("IACCOUNT"));
				cus3.setTime(rs2.getString("TIME"));	
				cus3.setMoney(rs2.getDouble("MONEY"));
				list3.add(cus3);
				
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return list3;
	}
	public ArrayList getTz(){
		ArrayList list4=new ArrayList();
		try{
			initConnection();
			 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //查询语句
			 String sql2 = "SELECT NAME,OFFICE,DATE,STATUS,PRICE FROM T_TZ";
	            conn.prepareStatement(sql2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //执行查询
	            ResultSet rs2=stmt.executeQuery(sql2);
			
			while(rs2.next()){
				Tz cus3 = new Tz();
				cus3.setName(rs2.getString("NAME"));
				cus3.setOffice(rs2.getString("OFFICE"));
				cus3.setDate(rs2.getString("DATE"));
				cus3.setStatus(rs2.getString("STATUS"));	
				cus3.setPrice(rs2.getDouble("PRICE"));
				list4.add(cus3);
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return list4;
	}
	
	public ArrayList getActzByAccount(String account){
		ArrayList list5=new ArrayList();
		try{
			initConnection();
			 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //查询语句
			 String sql2 = "SELECT ACCOUNT,NAME,OFFICE,DATE,STATUS,PRICE FROM T_ACTZ WHERE ACCOUNT='"+account+"' Order by PRICE  DESC";
	            conn.prepareStatement(sql2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //执行查询
	            ResultSet rs2=stmt.executeQuery(sql2);
			
			System.out.println(account+"123");
			
			while(rs2.next()){
				Actz cus3 = new Actz();
				cus3.setAccount(rs2.getString("ACCOUNT"));
				cus3.setName(rs2.getString("NAME"));
				cus3.setOffice(rs2.getString("OFFICE"));
				cus3.setDate(rs2.getString("DATE"));
				cus3.setStatus(rs2.getString("STATUS"));
				cus3.setPrice(rs2.getDouble("PRICE"));
				list5.add(cus3);
				
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return list5;
	}
	
	public ArrayList getApplyByAccount(String account){
		ArrayList applylist=new ArrayList();
		try{
			initConnection();
			 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //查询语句
			 String sql2 = "SELECT SENDER,RECEIVER,MESSAGE,TIME,AGREE,SENDERNAME FROM T_FRIENDAPPLY WHERE RECEIVER='"+account+"' AND AGREE=0 Order by TIME  DESC";
	            conn.prepareStatement(sql2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //执行查询
	            ResultSet rs2=stmt.executeQuery(sql2);
			
			System.out.println(account+"123");
			
			while(rs2.next()){
				Apply apply=new Apply();
				apply.setSender(rs2.getString("SENDER"));
				apply.setReceiver(rs2.getString("RECEIVER"));
				apply.setMessage(rs2.getString("MESSAGE"));
				apply.setTime(rs2.getString("TIME"));
				apply.setAgree(rs2.getDouble("AGREE"));
				apply.setSendername(rs2.getString("SENDERNAME"));
				applylist.add(apply);
				
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return applylist;
	}
	public ArrayList getNew(){
		ArrayList newlist=new ArrayList();
	
		
		try{
			initConnection();
			 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //查询语句
			 String sql2 = "SELECT TEXT,TIME FROM T_ANNOUNCEMENT Order by TIME DESC";
	            conn.prepareStatement(sql2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //执行查询
	            ResultSet rs2=stmt.executeQuery(sql2);
			
			
			
			while(rs2.next()){
				New systemnew =new New();
				systemnew.setText(rs2.getString("TEXT"));
				systemnew.setTime(rs2.getString("TIME"));
				newlist.add(systemnew);
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return newlist;
	}
	
	public ArrayList getFriendByAccount(String account){
		ArrayList friendlist=new ArrayList();
		try{
			initConnection();
			 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //查询语句
			 String sql2 = "SELECT FRIENDACCOUNT,FRIENDNAME FROM T_FRIENDLIST WHERE ACCOUNT='"+account+"'";
	            conn.prepareStatement(sql2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	            //执行查询
	            ResultSet rs2=stmt.executeQuery(sql2);
			
			System.out.println(account+"123");
			
			while(rs2.next()){
				Friend friend=new Friend();
				friend.setFriendaccount(rs2.getString("FRIENDACCOUNT"));
				friend.setFriendname(rs2.getString("FRIENDNAME"));
				
				friendlist.add(friend);
				
			}
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return friendlist;
	}
	
	
	public ArrayList getChatByAccount(String account,String friendaccount){
		ArrayList chatlist=new ArrayList();
		 String sql1 = "select SENDERACCOUNT,RECEIVERACCOUNT,TIME,TEXT from T_CHAT where SENDERACCOUNT=? and RECEIVERACCOUNT=? UNION ALL select SENDERACCOUNT,RECEIVERACCOUNT,TIME,TEXT from T_CHAT where SENDERACCOUNT=? and RECEIVERACCOUNT=? Order by TIME  ";
		try{
			initConnection();
			PreparedStatement ps1 = conn.prepareStatement(sql1);			
			ps1.setString(1, account);
			ps1.setString(2, friendaccount);
			ps1.setString(3, friendaccount);
			ps1.setString(4, account);
			ResultSet rs2 = ps1.executeQuery();
			
			while(rs2.next()){
				Chat cus3 = new Chat();
				cus3.setSenderaccount(rs2.getString("SENDERACCOUNT"));
				cus3.setReceiveraccount(rs2.getString("RECEIVERACCOUNT"));
				cus3.setTime(rs2.getString("TIME"));	
				cus3.setText(rs2.getString("TEXT"));
				chatlist.add(cus3);
			}
			System.out.println(chatlist.size()+"456");
		}catch(Exception ex){ex.printStackTrace();
		System.out.println("123456456");
		}
		finally{
			closeConnection();
		}
		return chatlist;
	}
	
	
	public boolean insertApply(Apply apply){
		
		String sql2= "INSERT INTO T_FRIENDAPPLY(SENDER,SENDERNAME,RECEIVER,MESSAGE,TIME,AGREE) VALUES(?,?,?,?,?,?)";
		try{
			initConnection();
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, apply.getSender());
			ps2.setString(2, apply.getSendername());
			ps2.setString(3, apply.getReceiver());
			ps2.setString(4, apply.getMessage());
			ps2.setString(5, apply.getTime());
			ps2.setDouble(6, apply.getAgree());
			
			
			ps2.executeUpdate();
			return true;			
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return false;
		
	}
	
	public boolean agree(String sender,String receiver,String sendername,String receivername){
		
		String sql1="INSERT INTO T_FRIENDLIST(ACCOUNT,FRIENDNAME,FRIENDACCOUNT) VALUES(?,?,?)";
		String sql2= "update T_FRIENDAPPLY set AGREE=1 where RECEIVER=? and SENDER=?;";
		try{
			initConnection();
			PreparedStatement ps1 = conn.prepareStatement(sql2);
			ps1.setString(1, receiver);
			ps1.setString(2, sender);
			ps1.executeUpdate();
			PreparedStatement ps2 = conn.prepareStatement(sql1);
			ps2.setString(1, receiver);
			ps2.setString(2, sendername);
			System.out.println(sendername);
			ps2.setString(3, sender);
			ps2.executeUpdate();
			PreparedStatement ps3 = conn.prepareStatement(sql1);
			ps3.setString(1, sender);
			ps3.setString(2, receivername);
			ps3.setString(3, receiver);
			ps3.executeUpdate();
			return true;			
		}catch(Exception ex){ex.printStackTrace();}
		finally{
			closeConnection();
		}
		return false;
	}
	
public boolean insertChat(Chat chat){
		
		String sql2= "INSERT INTO T_CHAT(SENDERACCOUNT,RECEIVERACCOUNT,TIME,TEXT) VALUES(?,?,?,?)";
		try{
			initConnection();
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, chat.getSenderaccount());
			ps2.setString(2, chat.getReceiveraccount());
			ps2.setString(3, chat.getTime());
			ps2.setString(4, chat.getText());
			ps2.executeUpdate();
			
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
