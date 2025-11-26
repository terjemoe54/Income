//
//  IncomeApp.swift
//  Income
//
//  Created by Terje Moe on 08/11/2025.
//
// Denne bruker iCloud Data

import SwiftUI
import SwiftData

@main
struct IncomeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: [TransactionModel.self])
        }
    }
        init() {
            print(URL.applicationSupportDirectory.path(percentEncoded: false))
        }
    
}
