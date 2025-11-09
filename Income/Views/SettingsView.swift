//
//  SettingsView.swift
//  Income
//
//  Created by Terje Moe on 09/11/2025.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var name: String = ""
    @State private var tax: String = ""
    @State private var account: String = ""
    
    var body: some View {
       ZStack {
           Color.yellow.opacity(0.2)
               .ignoresSafeArea()
           VStack{
               
               Text("SETTINGS")
                   .padding(.top, 30)
               
               TextField("Name: ", text: $name)
               TextField("Bank Account:", text: $account)
               TextField("Tax % :", text: $tax) // Denne må gjøres om til int
               Spacer()
           }
           .textFieldStyle(RoundedBorderTextFieldStyle())
           .cornerRadius(15)
           .padding(.horizontal, 25)
        }
    }
}

#Preview {
    SettingsView()
}
