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
    @Binding var darkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Display"),
                        footer: Text("System settings will override Dark Mode and use the current device theme")) {
                    
                    Toggle(isOn: $darkModeEnabled) {
                        Text("Dark mode")
                    }
                    
                    Toggle(isOn: $systemThemeEnabled) {
                        Text("Use System Settings")
                    }
                    
                }
                
                Section(header: Text("Personal Information"),
                        footer: Text("Enter Name, Taxprcent and Bank Account Number here")) {
                    VStack {
                        HStack{
                            Text("Navn:           ")
                            TextField("Name: ", text: $name)
                        }
                        HStack{
                            Text("BankKonto:")
                            TextField("Bank Account:", text: $account)
                        }
                        HStack {
                            Text("Skatt:          ")
                            TextField("Tax % :", text: $tax)
                        }
                    }
                }
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .semibold))
                
                Section {
                    Link(destination: URL(string: Constants.web)!,
                         label: {
                        Label("Read Last News in VG", systemImage: "link")
                    })
                    
                    Link("Contact me via mail",
                         destination: URL(string: Constants.email)!)
                    
                    Link("Call me",
                         destination: URL(string: Constants.phone)!)
                    
                }
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .semibold))
                
            }
            .navigationTitle("Settings")
            
        }
    }
}

#Preview {
    SettingsView(darkModeEnabled: .constant(false), systemThemeEnabled: .constant(false))
}

/*
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
 */
