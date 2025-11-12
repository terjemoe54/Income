//
//  SettingsView.swift
//  Income
//
//  Created by Terje Moe on 09/11/2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var tax: String
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
                        footer: Text("Enter Taxprcent Here")) {
                    VStack {
                        HStack {
                            Text("Skatt:          ")
                            TextField("Tax % :", text: $tax)
                        }
                    }
                }
                
                Section {
                    Link(destination: URL(string: Constants.web)!,
                         label: {
                        Label("Read Last News in VG", systemImage: "globe")
                    })
                    HStack {
                        Image(systemName: "envelope")
                        Link("Contact me via mail",
                             destination: URL(string: Constants.email)!)
                    }
                    HStack {
                        Image(systemName: "phone")
                        Link("Call me",
                             destination: URL(string: Constants.phone)!)
                    }
                }
                
            }
            .foregroundStyle(darkModeEnabled ? Color.white : Color.black)
            .font(.system(size: 16, weight: .semibold))
            .navigationTitle("Settings")
        }
        .preferredColorScheme(darkModeEnabled ? .dark : .light)
    }
}

#Preview {
    SettingsView(tax: .constant("18"), darkModeEnabled: .constant(false), systemThemeEnabled: .constant(false))
}
