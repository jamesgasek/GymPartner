//
//  AuthCodeView.swift
//  GymPartner
//
//  Created by James Gasek on 1/19/23.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseAuth

struct AuthCodeView: View{

    @Binding var userAwaitingAuth: Bool
    @Binding var userAuthenticated: Bool
    
    @State private var code = ""

    var body: some View {
        TextField("CODE", text: $code)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(5.0)
            .padding(.horizontal, 20)
            .submitLabel(.go)
            .onSubmit {
                userAwaitingAuth = false;
                userAuthenticated = true;
            }
    }
}

struct AuthCodeView_Previews: PreviewProvider {
    static var previews: some View {
        AuthCodeView( userAwaitingAuth: $isAwaitingAuth, userAuthenticated: $isAuthenticated)
    }
    
    @State static var isAuthenticated = false
    @State static var isAwaitingAuth = false
}
