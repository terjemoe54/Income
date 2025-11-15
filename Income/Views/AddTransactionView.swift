//
//  AddTransactionView.swift
//  Income
//
//  Created by Terje Moe on 10/11/2025.
//

import SwiftUI

struct AddTransactionView: View {
    @Environment(\.dismiss) var dismiss
    @State private var amount = 0.00
    @State private var transactionTitle = ""
    @State private var selectedTransactionType: TransactionType = .expense
    @State private var selectedState: TransactionState = .pending
    @State private var selectedRegDate = Date()
    @State private var selectedExpDate = Date()
    @State private var intervall = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    @Binding var transactions: [Transaction]
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
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
            
            // Picker for Expense / Income
            Picker("Choose Type", selection: $selectedTransactionType) {
                ForEach(TransactionType.allCases) { transactionType in
                    Text(transactionType.title)
                        .tag(transactionType)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 50)
            
            // Picker for Pending / Payed / Recieved / Taken
            Picker("Choose Type", selection: $selectedState) {
                ForEach(TransactionState.allCases) { transactionState in
                    Text(transactionState.title)
                        .tag(transactionState)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
           
            HStack {
                VStack (alignment: .center){
                    Text("Registration Date")
                        .padding(.leading)
                    
                    DatePicker("", selection: $selectedRegDate,
                               displayedComponents: .date)
                    .padding(.trailing)
                }
                .padding()
                
                VStack (alignment: .center) {
                    Text("Due Date")
                        .padding(.leading)
                    
                    DatePicker("", selection: $selectedExpDate,
                               displayedComponents: .date)
                    .padding(.trailing)
                }
                .padding()
            }
            .padding(.vertical, 25)
             
            TextField("Title", text: $transactionTitle)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 30)
                .padding(.top)
            Button {
                guard transactionTitle.count >= 2 else {
                    alertTitle = "Invalid Title"
                    alertMessage = "Title must be 2 or more characters"
                    showAlert = true
                    return
                }
                
                let transaction = Transaction(title: transactionTitle, type: selectedTransactionType, state: selectedState,amount: amount, regDate: selectedRegDate, expDate: selectedExpDate)
                
                transactions.append(transaction)
                
                dismiss()
                
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
        .alert(alertTitle, isPresented: $showAlert) {
            Button(action: {
                
            }, label: {
                Text("OK")
            })
        } message: {
            Text(alertMessage)
        }
    }
}

#Preview {
    AddTransactionView(transactions: .constant([]))
}
