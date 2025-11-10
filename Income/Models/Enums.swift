//
//  TransactionType.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//

import Foundation

enum TransactionState: String, CaseIterable, Identifiable {
    case  paid, pending, resieved, taken
    var id: Self { self }
    
    var title: String {
        switch self {
        case .paid:
            return "Paid"
        case .pending:
            return "Pending"
        case .resieved:
            return "Resieved"
        case .taken:
            return "Taken"
        }
    }
}

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

enum TransactionCategoy: String, CaseIterable, Identifiable {
    case ordenary, taken
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .ordenary:
            return "Ordenary"
        case .taken:
            return "Taken"
        }
    }
}
