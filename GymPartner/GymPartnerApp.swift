//
//  GymPartnerApp.swift
//  GymPartner
//
//  Created by James Gasek on 1/15/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore


@main
struct GymPartnerApp: App {
    
    // Store the authentication state
    // Store the authentication state
    @State private var userAuthenticated = false
    
    var body: some Scene {
        WindowGroup {
            if userAuthenticated {
                MainView()
                    .transition(.identity)
                    .onAppear{
                        print("mainview")
                    }
            } else {
                AuthView(userAuthenticated: $userAuthenticated)
                    .onAppear{
                        print("authview")
                    }
            }
        }
    }
    
    init() {
        FirebaseApp.configure()
    }
}
