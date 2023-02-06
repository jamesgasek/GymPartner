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
    @State private var userAwaitingAuth = false
    
    var body: some Scene {
        WindowGroup {
            if userAuthenticated {
                MainView(auth: $userAuthenticated)
                    .transition(.identity)
                    .onAppear{
                        print("mainview")
                    }
            } else if userAwaitingAuth {
                AuthCodeView(userAwaitingAuth: $userAwaitingAuth, userAuthenticated: $userAuthenticated)
            }
            else {
                AuthView(userAuthenticated: $userAuthenticated, userAwaitingAuth: $userAwaitingAuth)
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
