//
//  ContentView.swift
//  uplifthings
//
//  Created by Alfred  Lucero on 10/20/21.
//

import SwiftUI

struct ContentView: View {
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
            .shadow(color: Color(hue: 0.488, saturation: 0.469, brightness: 0.774).opacity(0.5), radius: 20, x: 0, y: 8)
                
            Text("What uplifts you today?")
                .font(.title3)
                .bold()
                .foregroundColor(Color(hue: 0.488, saturation: 0.531, brightness: 0.488))
                .padding(.top)
                .shadow(color: Color(hue: 0.488, saturation: 0.531, brightness: 0.488).opacity(0.2), radius: 5, x: 0, y: 8)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
