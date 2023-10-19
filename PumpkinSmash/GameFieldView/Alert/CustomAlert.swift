//
//  CustomAlert.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/19.
//

import SwiftUI

struct CustomAlert: View {
    var body: some View {
        ZStack() {
            VStack(spacing: 0) {
                Image("gamePaused")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.9)
                    .padding()
                
                VStack {
                    Text("ゆっくり休んでしてね 🎃🫰")
                        .font(.custom("Kiwi Maru", size: 20))
                        .foregroundColor(.white)
                        
                    Spacer()
                    // メニューに戻るボタン
                    Button(action: {
                        
                    }) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("SecondaryColor"))
                            .frame(width: 150, height: 60, alignment: .center)
                            .overlay(
                                Text("メニューに戻る")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                            )
                    }.padding()
                    
                    Spacer()
                }
            }.frame(width: 300, height: 270)
                .background(Color("PrimaryColor"))
                .cornerRadius(10)
                .overlay {
                    // ゲームやり直すボタン
                    Button(action: {
                        
                    }) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("SecondaryColor"))
                            .frame(width: 200, height: 100, alignment: .center)
                            .overlay(
                                Text("再開")
                                    .font(.custom("Kiwi Maru", size: 36))
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                            )
                    }.offset(y: 220)
                }

        }
            .overlay(alignment: .leading) {
                Image("danceLeft")
                    .scaleEffect(0.5)
                    .offset(x: -95, y: -150)
                
                Image("danceRight")
                    .scaleEffect(0.5)
                    .offset(x: 150, y: -150)
            }
    }
}

#Preview {
    CustomAlert()
}
