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
        Transaction(title: "Telefon", type: .expense, state: .pending, cat: .ordenary, amount: 984.45, regDate: .now, expDate: .now),
        Transaction(title: "Strøm", type: .expense, state: .paid, cat: .ordenary, amount: 387.29, regDate: Date(), expDate: Date()),
        Transaction(title: "Kemner", type: .expense, state: .taken, cat: .taken, amount: 1370.00, regDate: .now, expDate: .now)
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(transactions) { transaction in
                    VStack {
                        HStack {
                           Spacer()
                            Text(transaction.displayRegDate)
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
                                        .font(.system(size: 15, weight: .bold))
                                    Spacer()
                                    Text(String(transaction.displayAmount))
                                        .font(.system(size: 15, weight: .bold))
                                }
                                Text("Completed")
                                    .font(.system(size: 14))
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
