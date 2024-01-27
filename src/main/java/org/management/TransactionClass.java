package org.management;

import java.time.LocalDateTime;
import java.util.Date;

public class TransactionClass {
	private String transactionType;
	private double amount;
	private Date timestamp;
	
	public TransactionClass() {
		super();
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	
	}
