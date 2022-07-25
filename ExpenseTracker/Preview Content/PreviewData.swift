//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Saichand Pratapagiri on 24/07/22.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, categoryId: 801, date: "01/24/2022", institute: "Desjardins", account: "Visa Desjardins", merchant: "Apple", category: "Software", amount: 11.49, isPending: false, isTransfer: false, isExpense: true, isEdited: false, type: "debit")

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
