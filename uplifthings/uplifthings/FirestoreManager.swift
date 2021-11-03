//
//  FirestoreManager.swift
//  uplifthings
//
//  Created by Alfred  Lucero on 10/31/21.
//

import Firebase

class FirestoreManager: ObservableObject {
    @Published var uplifthingExample: String
    
    init() {
        uplifthingExample = ""
        fetchUplifthingExample()
        fetchAllUplifthingExamples()
    }
    
    func fetchUplifthingExample() {
        let db = Firestore.firestore()
        
        let docRef = db.collection("UplifthingExamples").document("FirstExample")
        
        docRef.getDocument{ (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.uplifthingExample = data["thing"] as? String ?? ""
                }
            }
            
        }
    }
    
    func fetchAllUplifthingExamples() {
        let db = Firestore.firestore()
        
        db.collection("UplifthingExamples").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error gettingdocuments: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID): \(document.data())")
                }
            }
        }
    }
    
    func createUplifthingExample(thing: String) {
        let db = Firestore.firestore()

        let docRef = db.collection("UplifthingExamples").document("ExampleUpdate")

        docRef.setData(["thing": thing]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func updateUplifthingExample(thing: String) {
        let db = Firestore.firestore()

        let docRef = db.collection("UplifthingExamples").document("ExampleUpdate")

        docRef.setData(["thing": thing], merge: true) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully merged!")
            }
        }
    }
}
