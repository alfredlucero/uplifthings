//
//  UplifthingsList.swift
//  uplifthings
//
//  Created by Alfred  Lucero on 10/31/21.
//

import SwiftUI

struct Uplifthing: Codable, Identifiable {
    let id: Int
    var thing: String
}

class UserSettings: ObservableObject {
    let defaults = UserDefaults.standard
    // https://www.simpleswiftguide.com/how-to-use-userdefaults-in-swiftui/
    @Published var uplifthings: [Uplifthing] {
        didSet {
            do {
                let encoder = JSONEncoder()
                let encodedUplifthings = try encoder.encode(uplifthings)
                defaults.set(encodedUplifthings, forKey: "uplifthings")
            } catch {
                print("Unable to encode uplifthings (\(error)")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "uplifthings") {
            do {
                let decoder = JSONDecoder()
                let decodedUplifthings = try decoder.decode([Uplifthing].self, from: data)
                self.uplifthings = decodedUplifthings
            } catch {
                print("Unable to decode uplifthings (\(error))")
                self.uplifthings = Array(repeating: Uplifthing(id: 0, thing: ""), count: 10).enumerated().map { (index, element) in
                    return Uplifthing(id: index + 1, thing: "")
                }
            }
        } else {
            self.uplifthings = Array(repeating: Uplifthing(id: 0, thing: ""), count: 10).enumerated().map { (index, element) in
                return Uplifthing(id: index + 1, thing: "")
            }
        }
    }
}


struct UplifthingsList: View {
    @ObservedObject var userSettings = UserSettings()
    @Environment(\.editMode) var editMode
    
    var body: some View {
            VStack {
                VStack(alignment: .leading, spacing: 8.0) {
                    Circle()
                        .frame(width: 40.0, height: 40.0)
                        .foregroundColor(Color(hue: 0.139, saturation: 0.43, brightness: 0.897))
                   
                    Text("Uplifthings")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Write 10 things to uplift your soul everyday")
                        .foregroundColor(.white)
                        .font(.title2)
                }
                .padding(.all)
                .background(Color(hue: 0.488, saturation: 0.469, brightness: 0.774))
                .cornerRadius(20.0)
                .shadow(color: Color(hue: 0.488, saturation: 0.469, brightness: 0.774).opacity(0.5), radius: 20, x: 0, y: 5)
                
                Text("What uplifts you today?")
                    .font(.title2)
                    .bold()
                    .padding()
                    .shadow(color: Color(hue: 0.488, saturation: 0.531, brightness: 0.488).opacity(0.2), radius: 5, x: 0, y: 8)
                    .foregroundColor(Color(hue: 0.488, saturation: 0.531, brightness: 0.488))

         
                List($userSettings.uplifthings) { $uplifthing in
                    HStack {
                        Text("\($uplifthing.id).")
                            .padding(.horizontal, 5)
                        TextEditor(text: $uplifthing.thing)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10.0)
                            .disabled(editMode?.wrappedValue == .inactive)
                        
                    }
                    .foregroundColor(Color(hue: 0.488, saturation: 0.531, brightness: 0.488))
                }
                .padding(.vertical)
                
                HStack {
                    EditButton()
                    if editMode?.wrappedValue == .active {
                        Button("Clear") {
                            // Clear and reset the list
                            userSettings.uplifthings = Array(repeating: Uplifthing(id: 0, thing: ""), count: 10).enumerated().map { (index, element) in
                                return Uplifthing(id: index + 1, thing: "")
                            }
                        }
                    }
                }
            }
    }
}

struct UplifthingsList_Previews: PreviewProvider {
    static var previews: some View {
        UplifthingsList()
    }
}
