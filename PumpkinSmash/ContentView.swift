//
//  ContentView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/04.
//

import SwiftUI



struct ContentView: View {
    
//    let primary = Color(primaryColor)
//    let secondaryColor = Color(secondaryColor)
//    let tertiaryColor = Color(tertiaryColor)
//    let fourthColor = Color(fourthColor)
//    let fifthColor = Color(fifthColor)
    
    var body: some View {
        VStack {
            Text("Pumpkin");
            Spacer()
            
            VStack {
                Button(action: {}) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black.gradient)
                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                        .overlay(
                            Text("START")
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                        )
                }.padding()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
