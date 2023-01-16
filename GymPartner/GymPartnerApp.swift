//
//  GymPartnerApp.swift
//  GymPartner
//
//  Created by James Gasek on 1/15/23.
//

import SwiftUI
import FirebaseAuth

@main
struct GymPartnerApp: App {
    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser != nil {
                MainView()
            } else {
                AuthView()
            }
        }
    }
}
