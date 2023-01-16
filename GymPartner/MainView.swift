//
//  MainView.swift
//  GymPartner
//
//  Created by James Gasek on 1/15/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            TextField("Email", text: .constant(""))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(20)
            SecureField("Password", text: .constant(""))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(20)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("SIGN IN")
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
                    .foregroundColor(.blue)
            })

            //sign up button. when clicked, opens SignUpView
            NavigationLink(destination: SignUpView()) {
                Text("HELP")
                    .foregroundColor(.gray)
                    .frame(width: 220, height: 60)
            }


            


        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
