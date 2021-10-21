//
//  ContentView.swift
//  uplifthings
//
//  Created by Alfred  Lucero on 10/20/21.
//

import SwiftUI

struct Uplifthing: Identifiable {
    let id: Int
    var thing: String
}

struct ContentView: View {
    @State private var uplifthings: [Uplifthing] = Array(repeating: Uplifthing(id: 0, thing: ""), count: 10).enumerated().map { (index, element) in
        return Uplifthing(id: index + 1, thing: "")
    }

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

         
                List($uplifthings) { $uplifthing in
                    HStack {
                        Text("\($uplifthing.id).")
                            .padding(.horizontal, 5)
                        TextEditor(text: $uplifthing.thing)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10.0)
                    }
                    .foregroundColor(Color(hue: 0.488, saturation: 0.531, brightness: 0.488))
                }
                .padding(.vertical)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
