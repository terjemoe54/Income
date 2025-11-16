//
//  ContentView.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("darkModeEnambled") private var darkModeEnabled = false
    @AppStorage("ShowName") private var showName = false
    @AppStorage("YourName") private var name: String = ""
    @AppStorage("TaxPercent") private var tax: String = ""
    @State private var showingSettings = false
    @State private var transactions: [Transaction] =
    [
         Transaction(title: "Pensjon Nav", type: .income, state: .resieved, amount: 35875, regDate: Date(), expDate: .now),
         Transaction(title: "Pensjon WW", type: .income, state: .resieved, amount: 1000.00, regDate: .now, expDate: .now),
         Transaction(title: "Skatt Nav", type: .expense, state: .taken, amount: 6457.00, regDate: .now, expDate: .now),
         Transaction(title: "Skatt WW", type: .expense, state: .taken, amount: 271.00, regDate: .now, expDate: .now),
         Transaction(title: "Husleie", type: .expense, state: .taken, amount: 11300.00, regDate: .now, expDate: Date()),
         Transaction(title: "Kemner", type: .expense, state: .taken, amount: 1000.00, regDate: .now, expDate: .now),
         Transaction(title: "Nav Feilbetalt", type: .expense, state: .taken, amount: 1370.00, regDate: .now, expDate: .now)
    ]
    
    fileprivate func FloatingButton() -> some View {
        VStack {
            Spacer()
            NavigationLink {
                AddTransactionView(transactions: $transactions)
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
            .navigationTitle(showName ? "Account \(name)" : "Account")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingSettings = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundStyle(darkModeEnabled ? Color.white : Color.black)
                    }
                }
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView(name: $name, tax: $tax, darkModeEnabled: $darkModeEnabled, showName: $showName)
                // bare cooment
            }
        }.preferredColorScheme(darkModeEnabled ? .dark : .light)
    }
}

#Preview {
    HomeView()
}
