//
//  ContentView.swift
//  uplifthings
//
//  Created by Alfred  Lucero on 10/20/21.
//

import SwiftUI
import Foundation


struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                UplifthingsList()
            }
            .padding(.top)
            .navigationTitle("Home")
            .navigationBarItems(trailing:
            HStack {
                NavigationLink(destination: FirebaseLogin()) {
                    Text("Log In")
                }
                NavigationLink(destination: UplifthingsExamples()) {
                    Text("Examples")
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
