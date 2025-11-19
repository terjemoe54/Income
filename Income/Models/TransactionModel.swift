//
//  TransactionModel.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//

import Foundation
import SwiftUI
import SwiftData

    @Model
    class TransactionModel {
        
        var id: UUID = UUID()
        var title: String = ""
        var type: TransactionType = TransactionType.expense
        var state: TransactionState = TransactionState.pending
        var amount: Double = 0
        var regDate: Date = Date()
        var expDate: Date = Date()
        
        init(id: UUID, title: String, type: TransactionType, state: TransactionState, amount: Double, regDate: Date, expDate: Date) {
            self.id = id
            self.title = title
            self.type = type
            self.state = state
            self.amount = amount
            self.regDate = regDate
            self.expDate = expDate
            
        }
        
        @Transient
        var displayRegDate: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: regDate)
        }
        @Transient
        var displayExpDate: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: expDate)
        }
        @Transient
        var displayAmount: String {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            numberFormatter.maximumFractionDigits = 2
            return numberFormatter.string(from: amount as NSNumber) ?? "$0.00"
        }
    }
               
