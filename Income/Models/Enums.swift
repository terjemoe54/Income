//
//  TransactionType.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//

import Foundation
import SwiftUI

enum TransactionState: String, CaseIterable, Identifiable {
    case   resieved, pending, paid, taken
    var id: Self { self }
    
    var title: String {
        switch self {
        case .paid:
            return "Resieved"
        case .pending:
            return "Pending"
        case .resieved:
            return "Paid"
        case .taken:
            return "Taken"
        }
    }
    
    var color: Color {
        switch self {
        case .paid:
            return .blue
        case .pending:
            return .yellow
        case .resieved:
            return .green
        case .taken:
            return .red
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
    var color: Color {
        switch self {
            
        case .income:
            return .green
        case .expense:
            return .red
        }
    }
}

