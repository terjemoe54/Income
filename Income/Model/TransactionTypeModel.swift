//
//  TransactionTypeModel.swift
//  Income
//
//  Created by Gwinyai Nyatsoka on 30/1/2024.
//

import Foundation

enum TransactionType: String, CaseIterable, Identifiable {
    case income, expense
    var id: Self { self }
    
    var title: String {
        switch self {
        case .income:
            return "Income"
        case .expense:
            return "Expense"
        }
    }
}

enum TransactionState: String, CaseIterable, Identifiable {
    case pending, completed
    var id: Self { self }
    
    var state: String {
        switch self {
        case .pending:
            return "Pending"
        case .completed:
            return "Completed"
        }
    }
}
