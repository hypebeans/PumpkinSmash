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
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                
                VStack {
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.black)
                            .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                            .overlay(
                                Text("TAP TO START")
                                    .font(.custom("Kiwi Maru", size: 30))
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                            )
                     Spacer()
                    }.padding()
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
