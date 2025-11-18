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
        
        var id: UUID
        var title: String
        var type: TransactionType
        var state: TransactionState
        var amount: Double
        var regDate: Date
        var expDate: Date
        
        init(id: UUID, title: String, type: TransactionType, state: TransactionState, amount: Double, regDate: Date, expDate: Date) {
            self.id = id
            self.title = title
            self.type = type
            self.state = state
            self.amount = amount
            self.regDate = regDate
            self.expDate = expDate
            
        }
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
               
//  struct Transaction: Identifiable , Hashable {
//
//    let id = UUID()
//    let title: String
//    let type: TransactionType
//    let state: TransactionState
//    let amount: Double
//    let regDate: Date
//    let expDate: Date
//    
//    var displayRegDate: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        return dateFormatter.string(from: regDate)
//    }
//    
//    var displayExpDate: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        return dateFormatter.string(from: expDate)
//    }
//    
//    var displayAmount: String {
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .currency
//        numberFormatter.maximumFractionDigits = 2
//        return numberFormatter.string(from: amount as NSNumber) ?? "$0.00"
//    }
//}
