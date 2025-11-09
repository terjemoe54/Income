//
//  SettingsView.swift
//  Income
//
//  Created by Terje Moe on 09/11/2025.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("Your Name") var name: String = ""
    @AppStorage("Your Bank Account") var account: String = ""
    @AppStorage("TaxPercent") var tax: String = ""
    var body: some View {
       ZStack {
           Color.yellow.opacity(0.2)
               .ignoresSafeArea()
           VStack{
               
               Text("SETTINGS")
                   .font(.largeTitle)
                   .fontWeight(.bold)
                   .background(.green.opacity(0.2))
                   .padding(.top, 30)
                   .padding(.bottom, 30)
          
               Text("Navn:")
                   TextField("Name: ", text: $name)
                   Text("BankKonto:")
                   TextField("Bank Account:", text: $account)
                   Text("SkatteProsent:")
                   TextField("Tax % :", text: $tax) // Denne må gjøres om til int
                Spacer()
           }
           .multilineTextAlignment(.center)
           .font(.system(size: 16, weight:.bold))
           .textFieldStyle(RoundedBorderTextFieldStyle())
           .cornerRadius(15)
           .padding(.horizontal, 25)
        }
    }
}

#Preview {
    SettingsView()
}
