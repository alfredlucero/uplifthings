//
//  UplifthingsExamples.swift
//  uplifthings
//
//  Created by Alfred  Lucero on 10/31/21.
//

import SwiftUI

struct UplifthingsExamples: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    var body: some View {
        Text("Example: \(firestoreManager.uplifthingExample)")
                .padding()
    }
}

struct UplifthingsExamples_Previews: PreviewProvider {
    static var previews: some View {
        UplifthingsExamples()
            .environmentObject(FirestoreManager())
    }
}
