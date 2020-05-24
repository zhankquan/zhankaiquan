package dao;

import java.util.ArrayList;
import java.util.Map;

import po.Customer;
import po.Manager;
import po.Tz;

public interface IManagerDao {
	public boolean insertTz(Tz tz);
	public void initConnection();
	public void closeConnection();
	public ArrayList getCustomerlist();
	public ArrayList getTzlist();
	public boolean updateTz(Tz tz);
	public Customer searchCustomerByAccount(String account);
	public Manager getManagerByAccount(String account);
	public boolean updateActz(Map map);
}
