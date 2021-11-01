//
//  uplifthingsApp.swift
//  uplifthings
//
//  Created by Alfred  Lucero on 10/20/21.
//

import SwiftUI
import Firebase

@main
struct uplifthingsApp: App {
    @StateObject var firestoreManager = FirestoreManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(firestoreManager)
        }
    }
}
