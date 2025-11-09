//
//  TransactionModel.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//

import Foundation

struct Transaction: Identifiable {
    
    let id = UUID()
    let title: String
    let type: TransactionType
    let state: TransactionState
    let cat: TransactionCategoy?
    let amount: Double
    let regDate: Date
    let expDate: Date
    
}
