//
//  ContentView.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @AppStorage("darkModeEnambled") private var darkModeEnabled = false
    @AppStorage("ShowName") private var showName = false
    @AppStorage("YourName") private var name: String = ""
    @AppStorage("TaxPercent") private var tax: String = ""
    @AppStorage("filterMinimum") var filterMinimum = 1.0
    @AppStorage("orderDescending") var orderDescending = false
    @AppStorage("showExpenses") var showExpenses = true
    @AppStorage("fromDate") var fromDate = Date()
    @AppStorage("toDate") var toDate = Date()
    @AppStorage("sortPaid") var sortPaid = false
    
    @State private var showingSettings = false
    @State private var transactionToEdit: TransactionModel? = nil
    @State private var showAddTransactionView = false
    
    @Environment(\.modelContext) private var context
    
    @Query var transactions: [TransactionModel]
    
    let calendar = Calendar.current
    
    private var displayTransactions: [TransactionModel] {
        let sortedTransactions =  sortPaid ? orderDescending ? transactions.sorted(by: { $0.regDate > $1.regDate }) : transactions.sorted(by: { $0.regDate < $1.regDate }) :  orderDescending ? transactions.sorted(by: { $0.expDate > $1.expDate }) : transactions.sorted(by: { $0.expDate < $1.expDate })
        
        guard filterMinimum > 0 else {
            return sortedTransactions
        }
        
        let filteredTransaction1 = sortedTransactions.filter({ ($0.amount > filterMinimum) && (showExpenses ? $0.type == .expense : $0.type != .all)})
        
        let filteredTransaction2 = sortedTransactions.filter({ sortPaid ? ($0.regDate >= calendar.startOfDay(for: fromDate)) && ($0.regDate <= calendar.startOfDay(for: toDate)) : ($0.expDate >= calendar.startOfDay(for: fromDate)) && ($0.expDate <= calendar.startOfDay(for: toDate))})
        
        let filteredTransactions = filteredTransaction1.filter({ filteredTransaction2.contains($0) })
        
        return filteredTransactions
        
    }
    
    
    private var expenses: String {
        let sumExpenses =  transactions.filter({ $0.type == .expense &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount})
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter.string(from: sumExpenses as NSNumber) ?? "NOK 0.00"
        
    }
    
    private var income: String {
        let sumIncome =  transactions.filter({ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount})
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        guard !showExpenses else {
            return "0.00"
        }
        return numberFormatter.string(from: sumIncome as NSNumber) ?? "NOK 0.00"
        
    }
    
    private var total: String {
        let sumExpenses =  transactions.filter({ $0.type == .expense &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount})
        let sumIncome =  transactions.filter({ $0.type == .income &&  $0.amount > filterMinimum }).reduce(0, { $0 + $1.amount})
        let total = sumIncome - sumExpenses
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: total as NSNumber) ?? "NOK 0.00"
    }
    
    
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
                        Text("På Konto")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color.white)
                        Text("\(total)")
                            .font(.system(size: 42, weight: .light))
                            .foregroundStyle(Color.white)
                    }
                    Spacer()
                }
                .padding(.top)
                
                HStack(spacing: 25) {
                    VStack(alignment: .leading) {
                        Text("Utgifter")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Color.white)
                        Text("\(expenses)")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(Color.white)
                    }
                    VStack(alignment: .leading) {
                        Text("Intekter")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Color.white)
                        Text("\(income)")
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
                 //   Text("\(fromDate)")
                 //   Text("\(toDate)")
                    BalanceView()
                    List {
                        ForEach(displayTransactions) { transaction in
                          Button {
                                transactionToEdit = transaction
                            } label: {
                                TransactionView(transaction: transaction)
                                    .foregroundStyle(.black)
                            }
                            
                   
                        }
                        .onDelete(perform: delete)
                    }
                    .scrollContentBackground(.hidden)
                }
                FloatingButton()
            }
            .navigationTitle(showName ? "Konto: \(name)" : "Konto")
            .navigationDestination(item: $transactionToEdit, destination: {
                transactionToEdit in
                AddTransactionView(transactionToEdit: transactionToEdit)
            })
            .navigationDestination(isPresented: $showAddTransactionView, destination: {
                AddTransactionView() 
            })
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
                SettingsView(name: $name, tax: $tax, filterMinimum: $filterMinimum, darkModeEnabled: $darkModeEnabled, showName: $showName, orderDescending: $orderDescending, showExpenses: $showExpenses, fromDate: $fromDate, toDate: $toDate, sortPaid: $sortPaid)
               
            }
        }.preferredColorScheme(darkModeEnabled ? .dark : .light)
    }
    
 // Denne er laget av AI
    
    private func delete(at offsets: IndexSet) {
       // Map the offsets to the displayed (sorted/filtered) transactions
       let itemsToDelete = offsets.compactMap { index in
           displayTransactions.indices.contains(index) ? displayTransactions[index] : nil
       }

       // Delete each item from the model context
       for item in itemsToDelete {
           context.delete(item)
       }

       // Persist changes
       do {
           try context.save()
       } catch {
           // Handle save errors if needed (you could add logging or user feedback here)
           #if DEBUG
           print("Failed to save context after deletion: \(error)")
           #endif
       }
   }
}

#Preview {
    HomeView()
}
