//
//  TransactionType.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//

import Foundation

enum TransactionState {
    case  paid, pending, resieved, taken
    
}

enum TransactionType {
    case income, expense
    
}

enum TransactionCategoy {
    case ordenary, taken
}
