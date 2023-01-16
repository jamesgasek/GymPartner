//
//  AuthView.swift
//  GymPartner
//
//  Created by James Gasek on 1/15/23.
//

import SwiftUI

struct AuthView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        VStack {
            Text("GymPartner")
                .font(.largeTitle.italic())
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 20)
                .padding(.top, 0)
                
            TextField("EMAIL", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.horizontal, 20)
            SecureField("PASSWORD", text: $password)
                .padding()
                //.font(.title.italic())
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                //20 padding on only left and right
                .padding(.horizontal, 20)
                
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("SIGN IN")
                    .font(.title.italic())
                    .fontWeight(.black)
                    .foregroundColor(.black)
                    .frame(width: 220, height: 60)
            })
            .background(Color("Green"))
            .cornerRadius(15.0)
            .padding(20)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("SIGN UP")
                    .fontWeight(.bold)
                    .foregroundColor(Color(.systemGray2))
            })
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
