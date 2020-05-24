package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import po.Actz;
import po.Apply;
import po.Chat;
import po.Customer;

public interface ICustomerDao {
	
	public void initConnection();
	public abstract boolean insertCustomer(Customer cus);
	public abstract boolean insertMx(String account,String zf,double howmuch);
	public abstract boolean insertZzhk(String eaccount,String iaccount,double money);
	public abstract boolean insertActz(Actz actz);
	public abstract boolean updateCustomer(Customer cus);
	public abstract boolean deleteActz(Map map);
	public abstract boolean insertChat(Chat chat);
	public abstract boolean agree(String sender,String receiver,String sendername,String receivername);
	public abstract Customer getCustomerByAccount(String account);
	public abstract ArrayList getTz();
	public abstract ArrayList getMxByAccount(String account);
	public abstract ArrayList getZzhkByAccount1(String account);
	public abstract ArrayList getZzhkByAccount2(String account);
	public abstract ArrayList getActzByAccount(String account);
	public abstract ArrayList getNew();
	public abstract ArrayList getApplyByAccount(String account);
	public abstract ArrayList getFriendByAccount(String account);
	public abstract ArrayList getChatByAccount(String account,String friendaccount);
	public abstract boolean insertApply(Apply apply);
}
