//
//  TransactionModel.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//

import Foundation

class Transaction: Identifiable {
    let id = UUID()
    let title: String
    let type: TransactionType
    let state: TransactionState
    let amount: Double
    let today: Date
    let expDate : Date?
    let payDate: Date?
    init(
        title: String,
        type: TransactionType,
        state: TransactionState = .pending,
        amount: Double,
        today: Date,
        expDate: Date? = nil,
        payDate: Date? = nil
    ) {
        self.title = title
        self.type = type
        self.state = state
        self.amount = amount
        self.today = today
        self.expDate = expDate
        self.payDate = payDate
    }
}
