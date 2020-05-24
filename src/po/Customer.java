package po;

public class Customer {
	private String account;
	private String password;
	private String cname;
	private double cbalance;
	private String email;
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public double getCbalance() {
		return cbalance;
	}
	public void setCbalance(double cbalance) {
		this.cbalance = cbalance;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
