//
//  TitleView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/13.
//

import SwiftUI

struct TitleView: View {
    
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

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}

