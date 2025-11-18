//
//  AddTransactionView.swift
//  Income
//
//  Created by Terje Moe on 10/11/2025.
//

import SwiftUI
import SwiftData

struct AddTransactionView: View {
   
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
    var transactionToEdit: TransactionModel?
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }
    
    var body: some View {
        VStack {
            Spacer()
            TextField("0.00", value: $amount, formatter: numberFormatter)
                .font(.system(size: 60, weight: .thin))
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
            
            Rectangle()
                .fill(Color(uiColor: UIColor.lightGray))
                .frame(height: 0.5)
                .padding(.horizontal, 30)
            
            // Picker for Expense / Income
            Picker("Velg Type", selection: $selectedTransactionType) {
                ForEach(TransactionType.allCases) { transactionType in
                    Text(transactionType.title)
                        .tag(transactionType)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 50)
            
            // Picker for Pending / Payed / Recieved / Taken
            Picker("Velg Type", selection: $selectedState) {
                ForEach(TransactionState.allCases) { transactionState in
                    Text(transactionState.title)
                        .tag(transactionState)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            HStack {
                Spacer()
                ZStack {
                    Capsule()
                        .frame(width: 100, height: 30)
                        .foregroundColor(selectedTransactionType.color.opacity(0.7))
                        .overlay(Text(selectedTransactionType.title)
                            .font(.system(size: 15, weight: .bold)))
                }
                Spacer()
                
                ZStack {
                    Capsule()
                        .frame(width: 100, height: 30)
                        .foregroundColor(selectedState.color.opacity(0.7))
                        .overlay(Text(selectedState.title)
                            .font(.system(size: 15, weight: .bold)))
                    
                }
                Spacer()
            }
            .padding(.top, 40)
            
            HStack {
                VStack (alignment: .center){
                    Text("Registrerings Dato")
                        .padding(.leading)
                    
                    DatePicker("", selection: $selectedRegDate,
                               displayedComponents: .date)
                    .padding(.trailing)
                }
                .padding()
                
                VStack (alignment: .center) {
                    Text("Forfalls Dato")
                        .padding(.leading)
                    
                    DatePicker("", selection: $selectedExpDate,
                               displayedComponents: .date)
                    .padding(.trailing)
                }
                .padding()
            }
            .padding(.vertical, 25)
            
            TextField("Titel", text: $transactionTitle)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 30)
                .padding(.top)
            Button {
                guard transactionTitle.count >= 2 && amount > 0 else {
                    alertTitle = "Feil Titel"
                    alertMessage = "Titel må være minst 2 bokstaver og Beløp må være over 0"
                    showAlert = true
                    return
                }
              
                if let transactionToEdit = transactionToEdit {
                    transactionToEdit.title = transactionTitle
                    transactionToEdit.type = selectedTransactionType
                    transactionToEdit.state = selectedState
                    transactionToEdit.amount = amount
                    transactionToEdit.regDate = selectedRegDate
                    transactionToEdit.expDate = selectedExpDate
                   } else {
                    let transaction = TransactionModel(id: UUID(), title: transactionTitle, type: selectedTransactionType, state: selectedState, amount: amount, regDate: selectedRegDate, expDate: selectedExpDate)
                    context.insert(transaction)
                }
                
                dismiss()
                
            } label: {
                Text(transactionToEdit == nil ? "Opprett" : "Oppdater")
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
        .onAppear(perform: {
            if let transactionToEdit = transactionToEdit {
                amount = transactionToEdit.amount
                transactionTitle = transactionToEdit.title
                selectedTransactionType = transactionToEdit.type
                selectedState = transactionToEdit.state
                selectedRegDate = transactionToEdit.regDate
                selectedExpDate = transactionToEdit.expDate
                
            }
        })
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
