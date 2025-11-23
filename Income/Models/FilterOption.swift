//
//  FilterOptions.swift
//  Income
//
//  Created by Terje Moe on 23/11/2025.
//

import Foundation
import SwiftUI

enum FilterOption: String, CaseIterable, Identifiable {
    case   income, expense, minimum, dateFrom, dateTo, pending
    var id: Self { self }
    
    var filter: String {
        switch self {
        
        case .income:
            "transactions.filter({ $0.type == .expense }).reduce(0, { $0 + $1.amount})"
        case .expense:
            "{ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount}"
        case .minimum:
            "{ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount}"
        case .dateFrom:
            "{ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount}"
        case .dateTo:
            "{ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount}"
        case .pending:
            "{ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount}"
        }
    }
    
    var filt: String {
        switch self {
        
        case .income:
            "transactions.filter({ $0.type == .expense }).reduce(0, { $0 + $1.amount})"
        case .expense:
            "{ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount}"
        case .minimum:
            "{ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount}"
        case .dateFrom:
            "{ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount}"
        case .dateTo:
            "{ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount}"
        case .pending:
            "{ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount}"
        }
    }
}
