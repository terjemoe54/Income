//
//  ContentView.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var transactions: [Transaction] = [
        Transaction(title: "Lønn", type: .income, state: .paid, amount: 32250.00, today: .now, expDate: Date()),
        Transaction(title: "Mango", type: .expense, state: .pending, amount: 25.00, today: .now, expDate: Date()),
        Transaction(title: "Apple", type: .expense, state: .paid, amount: 5.00, today: .now, expDate: Date(), payDate: Date())
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(transactions) { transaction in
                    Text(transaction.title)
                }
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
