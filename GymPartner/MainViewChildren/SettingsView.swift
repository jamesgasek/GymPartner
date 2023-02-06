//
//  SettingsView.swift
//  GymPartner
//
//  Created by James Gasek on 1/29/23.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    @Binding var auth: Bool

    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Account")) {
                    NavigationLink(destination: Text("Profile")) {
                        Text("Profile")
                    }
                    Button(action: {
                        self.auth = false
                    }) {
                        Text("Sign Out")
                    }
                }
                
                Section(header: Text("GymPartner")) {
                    NavigationLink(destination: Text("Notifications")) {
                        Text("Notifications")
                    }
                    NavigationLink(destination: Text("Help")) {
                        Text("Help")
                    }
                    NavigationLink(destination: Text("About")) {
                        Text("About")
                    }
                }
            }
        }
    }
}
