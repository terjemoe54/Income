//
//  CurrencyModel.swift
//  Income
//
//  Created by Gwinyai Nyatsoka on 7/2/2024.
//

import Foundation

enum Currency: Int, CaseIterable {
    case usd, nok
    
    var title: String {
        switch self {
        case .usd:
            return "USD"
        case .nok:
            return "NOK"
        }
    }
    
    var locale: Locale {
        switch self {
        case .usd:
            return Locale(identifier: "en_US")
        case .nok:
            return Locale(identifier: "en_NO")
        }
    }
    
}
