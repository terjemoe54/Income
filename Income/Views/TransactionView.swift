//
//  TransactionView.swift
//  Income
//
//  Created by Terje Moe on 09/11/2025.
//
import SwiftUI

struct TransactionView: View {
    let transaction: Transaction
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Reg : \(transaction.displayRegDate)")
                    .font(.system(size: 14,weight: .bold))
                Spacer()
                Text("Due : \(transaction.displayExpDate)")
                    .font(.system(size: 14, weight: .bold))
                    .font(.system(size: 14))
                Spacer()
            }
            .padding(.vertical, 5)
            .background(Color.lightGrayShade.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            HStack {
                Image(systemName: transaction.type == .income ? "arrow.up.forward" : "arrow.down.forward")
                    .font(.system(size: 16, weight: .bold ))
                    .foregroundStyle(transaction.type == .income ? Color.green : Color.red)
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(transaction.title)
                           // .foregroundStyle(transaction.type.color)
                            .foregroundStyle(Color.black)
                            .font(.system(size: 15, weight: .bold))
                        Spacer()
                        Text(String(transaction.displayAmount))
                            .font(.system(size: 15, weight: .bold))
                            .padding(.horizontal)
                    }
                    // Text(transaction.type == .income ? "Income" : "Expense")
                    HStack {
                        Text(transaction.type.title)
                            .font(.system(size: 14).bold())
                         Spacer()
                        Text(transaction.state.title)
                            .font(Font.system(size: 14).bold())
                            .foregroundStyle(transaction.state.color)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .listRowSeparator(.hidden)
    }
}

#Preview {
    TransactionView(transaction: Transaction(title: "Telefon", type: .expense, state: .pending, amount: 984.45, regDate: .now, expDate: .now))
}
