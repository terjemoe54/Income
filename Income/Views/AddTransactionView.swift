//
//  AddTransactionView.swift
//  Income
//
//  Created by Terje Moe on 10/11/2025.
//

import SwiftUI

struct AddTransactionView: View {
    
    @State private var amount = 0.00
    @State private var selectedTransactionType: TransactionType = .expense
    
    
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }
    
    var body: some View {
       VStack {
           TextField("0.00", value: $amount, formatter: numberFormatter)
               .font(.system(size: 60, weight: .thin))
               .multilineTextAlignment(.center)
               .keyboardType(.numberPad)
          
           Picker("Choose Type", selection: $selectedTransactionType) {
               ForEach(TransactionType.allCases) { transactionType in
                   Text(transactionType.title)
                       .tag(transactionType)
                   
               }
           }
               Spacer()
       
       }
    }
}

#Preview {
    AddTransactionView()
}
