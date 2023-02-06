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
    @Binding var userAwaitingAuth: Bool

    @State private var showingAlert = false

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
                    //send text message with code
                    print("sending verification!")
                    PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { (verificationID, error) in
                        if error != nil {
                            print("error!:")
                            print(error!)
                            return
                        }

                        print("verificationID: \(verificationID!)")

                        UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                    }

                    userAwaitingAuth = true
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

                    //show dialog box: "Are you sure you want to continue as a guest? As a guest, you will not be able to save your workouts and track your progress!."
                    //if yes, then authenticateGuest()
                    //if no, then do nothing
                    showingAlert = true;

                
                }, label:({
                        Text("CONTINUE AS GUEST")
                            .fontWeight(.black)
                            .foregroundColor(Color(.systemGray3))
                            .font(.system(size: 16))
                    }))
                
                
                .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Continue as guest?"),
                                  
                                message: Text("As a guest, your workouts will be stored locally, and you risk losing your history and progression."),
                                
                                primaryButton: .default(Text("Continue as guest")) {
                                    authenticateGuest()
                                },
                                
                                secondaryButton: .cancel()
                            )}
                
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthView(userAuthenticated: $isAuthenticated, userAwaitingAuth: $isAwaitingAuth)
        }
        //.environment(\.colorScheme, .dark)
    }
    @State static var isAuthenticated = false
    @State static var isAwaitingAuth = false

}
