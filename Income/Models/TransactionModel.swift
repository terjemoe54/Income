//
//  TransactionModel.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//

import Foundation

struct Transaction: Identifiable , Hashable {
    
    let id = UUID()
    let title: String
    let type: TransactionType
    let state: TransactionState
    let amount: Double
    let regDate: Date
    let expDate: Date
    
    var displayRegDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: regDate)
    }
    
    var displayExpDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: expDate)
    }
    
    var displayAmount: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: amount as NSNumber) ?? "$0.00"
    }
}
