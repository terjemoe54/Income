//
//  AddTransactionView.swift
//  Income
//
//  Created by Terje Moe on 10/11/2025.
//

import SwiftUI

struct AddTransactionView: View {
    
    @State private var amount = 0.00
    @State private var transactionTitle = ""
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
          
           Rectangle()
               .fill(Color(uiColor: UIColor.lightGray))
               .frame(height: 0.5)
               .padding(.horizontal, 30)
           
           Picker("Choose Type", selection: $selectedTransactionType) {
               ForEach(TransactionType.allCases) { transactionType in
                   Text(transactionType.title)
                       .tag(transactionType)
                   
               }
           }
           TextField("Title", text: $transactionTitle)
               .font(.system(size: 15))
               .textFieldStyle(.roundedBorder)
               .padding(.horizontal, 30)
               .padding(.top)
           Button {
               
           } label: {
               Text("Create")
                   .font(.system(size: 15, weight: .semibold))
                   .foregroundStyle(Color.white)
                   .frame(height: 40)
                   .frame(maxWidth: .infinity)
                   .background(Color.primaryLightGreen)
                   .clipShape(RoundedRectangle(cornerRadius: 6))
           }
           .padding(.top)
           .padding(.horizontal, 30)

               Spacer()
       
       }
       .padding(.top)
    }
}

#Preview {
    AddTransactionView()
}
