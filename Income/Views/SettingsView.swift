//
//  SettingsView.swift
//  Income
//
//  Created by Terje Moe on 09/11/2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var name: String
    @Binding var tax: String
    @Binding var darkModeEnabled: Bool
    @Binding var showName: Bool
    @Binding var orderDescending: Bool
    
    var body: some View {
        NavigationView {
            Form {
              Section(header: Text("Display"),
                        footer: Text("")) {
                    
                    Toggle(isOn: $darkModeEnabled) {
                        
                        Text(darkModeEnabled ? "Dag modus" : "Natt modus")
                        
                    }
                    
                    Toggle(isOn: $showName) {
                        Text(showName ? "Skjul bruker navn" : "Vis bruker navn")
                    }
                }
                
                Section(header: Text("Sortering"),
                        footer: Text("")) {
                    
                    Toggle(isOn: $orderDescending) {
                        Text(orderDescending ? "Dato (Elste først)" :"Dato (Nyeste først)")
                    }
                    
//                    Toggle(isOn: $showName) {
//                        Text("Intekter / Utgifter")
//                    }
                }
  
                Section(header: Text("Personlig Information"),
                        footer: Text("Skattprosent")) {
                    VStack {
                        HStack {
                            Text("Ditt Navn:          ")
                            TextField("Navn:", text: $name)
                        }
                        
                        HStack {
                            Text("Skatt:          ")
                            TextField("Skatt % :", text: $tax)
                        }
                    }
                }
                
                Section {
                    Link(destination: URL(string: Constants.web)!,
                         label: {
                        Label("Les VG", systemImage: "globe")
                    })
                    HStack {
                        Image(systemName: "envelope")
                        Link("Kontakt meg via mail",
                             destination: URL(string: Constants.email)!)
                    }
                    HStack {
                        Image(systemName: "phone")
                        Link("Ring meg",
                             destination: URL(string: Constants.phone)!)
                    }
                }
            }
            .foregroundStyle(darkModeEnabled ? Color.white : Color.black)
            .font(.system(size: 16, weight: .semibold))
            .navigationTitle("Instillinger")
        }
        .preferredColorScheme(darkModeEnabled ? .dark : .light)
    }
}

#Preview {
    SettingsView(name: .constant("Tomle Hue"), tax: .constant("18"), darkModeEnabled: .constant(false), showName: .constant(false), orderDescending: .constant(false))
}
