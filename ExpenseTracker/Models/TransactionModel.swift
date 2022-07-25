//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Saichand Pratapagiri on 24/07/22.
//

import Foundation

struct Transaction: Identifiable, Codable, Hashable {
    let id: Int?
    var categoryId: Int?
    
    let date: String?
    let institute: String?
    let account: String?
    var merchant: String?
    var category: String?
    
    let amount: Double?
    
    let isPending: Bool?
    var isTransfer: Bool?
    var isExpense: Bool?
    var isEdited: Bool?
    
    let type: TransactionType.RawValue
    
    var dateParsed: Date? {
        date?.dateParsed()
    }
    
    var signedAmount: Double? {
        return type == TransactionType.credit.rawValue ? amount : -(amount ?? -0)
    }
    
    var month: String {
        dateParsed?.formatted(.dateTime.year().month(.wide)) ?? ""
    }
}

enum TransactionType: String {
    case debit
    case credit
}
