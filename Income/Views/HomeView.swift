//
//  ContentView.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var transactions: [Transaction] =
    [
        Transaction(title: "Lønn", type: .income, state: .resieved, cat: .ordenary, amount: 32000.54, regDate: Date(), expDate: .now),
        Transaction(title: "Skatt", type: .expense, state: .taken, cat: .ordenary, amount: 9425.78, regDate: .now, expDate: .now),
        Transaction(title: "Husleie", type: .expense, state: .taken, cat: .taken, amount: 11300.00, regDate: .now, expDate: Date()),
//        Transaction(title: "Telefon", type: .expense, state: .pending, cat: .ordenary, amount: 984.45, regDate: .now, expDate: .now),
//        Transaction(title: "Strøm", type: .expense, state: .paid, cat: .ordenary, amount: 387.29, regDate: Date(), expDate: Date()),
//        Transaction(title: "Kemner", type: .expense, state: .taken, cat: .taken, amount: 1370.00, regDate: .now, expDate: .now)
    ]
    
    fileprivate func FloatingButton() -> some View {
        VStack {
            Spacer()
            NavigationLink {
                AddTransactionView()
            } label: {
                Text("+")
                    .font(.largeTitle)
                    .frame(width: 70, height: 70)
                    .foregroundStyle(Color.white)
                
            }
            .background(Color.primaryLightGreen)
            .clipShape(Circle())
            .padding(.bottom, 7)
            
        }
    }
    
    fileprivate func BalanceView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.primaryLightGreen)
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("BALANCE")
                            .font(.caption)
                            .foregroundStyle(Color.white)
                        Text("NOK2")
                            .font(.system(size: 42, weight: .light))
                            .foregroundStyle(Color.white)
                        }
                  Spacer()
                }
                .padding(.top)
                
                HStack(spacing: 25) {
                    VStack(alignment: .leading) {
                        Text("Expense")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Color.white)
                        Text("NOK22")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(Color.white)
                    }
                    VStack(alignment: .leading) {
                        Text("Income")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Color.white)
                        Text("NOK22")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(Color.white)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .frame(height: 150)
        .padding(.horizontal)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    BalanceView()
                    List {
                        ForEach(transactions) { transaction in
                            TransactionView(transaction: transaction)
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                FloatingButton()
            }
        }
    }
}

#Preview {
    HomeView()
}
