//
//  AuthView.swift
//  GymPartner
//
//  Created by James Gasek on 1/15/23.
//
import SwiftUI
import FirebaseCore
import FirebaseAuth




struct AuthView: View {
    //@ObservedObject var loginDelegate: LoginDelegate
    @Binding var userAuthenticated: Bool

    @State private var phone = ""
    //@State private var isAuthenticated = false
    
    func authenticateGuest(){
        Auth.auth().signInAnonymously() { (result, error) in
            if error == nil {
                //self.isAuthenticated = true
                self.userAuthenticated = true
            }
        }
    }

    var body: some View {
        NavigationView{
            VStack {
                Text("GymPartner")
                    .font(.largeTitle.italic())
                    .fontWeight(.bold)
                    .foregroundColor(Color("Black"))
                    .padding(.bottom, 20)
                    .padding(.top, 0)
                
                TextField("PHONE #", text: $phone)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.horizontal, 20)
                Button(action: {
                    //self.authenticate()
                }, label:({
                        Text("SIGN IN")
                            .font(.title.italic())
                            .fontWeight(.black)
                            .foregroundColor(.black)
                            .frame(width: 220, height: 60)
                    }))
                
                
                .background(Color("Green"))
                .cornerRadius(0.0)
                .padding(20)

                Button(action: {
                    self.authenticateGuest()
                }, label:({
                        Text("CONTINUE AS GUEST")
                            .fontWeight(.black)
                            .foregroundColor(Color(.systemGray3))
                            .font(.system(size: 16))
                    }))
                
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthView(userAuthenticated: $isAuthenticated)
        }
        //.environment(\.colorScheme, .dark)
    }
    @State static var isAuthenticated = false
}
