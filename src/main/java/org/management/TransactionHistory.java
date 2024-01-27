package org.management;

import java.util.ArrayList;
import java.util.List;

public class TransactionHistory {
	private List<TransactionClass> transactionHistory;

	public TransactionHistory() {
		transactionHistory=new ArrayList<>();
	}
	
	public void addTransaction(TransactionClass transaction) {
        transactionHistory.add(transaction);
    }

    public List<TransactionClass> getTransactionHistory() {
        return transactionHistory;
    }
}
