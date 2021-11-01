//
//  FirebaseLogin.swift
//  uplifthings
//
//  Created by Alfred  Lucero on 10/31/21.
//

import SwiftUI
import Firebase

struct FirebaseLogin: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: { login() }) {
                Text("Log in")
            }
        }
        .padding()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
            }
        }
    }
}

struct FirebaseLogin_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseLogin()
    }
}
