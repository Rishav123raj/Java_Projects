package org.management.bean;

import java.io.Serializable;

public class LoginForm implements Serializable {
	private static final long serialVersionUID = 1L;
	private String accountno;
	private String username;
	private String password;
	
	public String getAccountno() {
		return accountno;
	}
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
