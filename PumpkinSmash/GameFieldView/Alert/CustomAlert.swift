//
//  CustomAlert.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/19.
//

import SwiftUI

struct CustomAlert: View {
    
    @Binding var path: [ViewPath]
    @Environment(\.dismiss) private var dismiss
    
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
                    // タイトルに戻るボタン
                    HStack(spacing: 0) {
                        Button(action: {
                            path.removeAll()
                        }) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color("SecondaryColor"))
                                .frame(width: 110, height: 60, alignment: .center)
                                .overlay(
                                    Text("メニュ")
                                        .font(.custom("Kiwi Maru", size: 18))
                                        .fontWeight(.black)
                                        .foregroundColor(.white)
                                )
                        }.padding()
                        
                        // 再開ボタン
                        Button(action: {
                            path.removeAll()
                        }) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color("SecondaryColor"))
                                .frame(width: 110, height: 60, alignment: .center)
                                .overlay(
                                    Text("再開")
                                        .font(.custom("Kiwi Maru", size: 20))
                                        .fontWeight(.black)
                                        .foregroundColor(.white)
                                )
                        }.padding()
                    }
                    
                    Spacer()
                }
            }.frame(width: 300, height: 270)
                .background(Color("PrimaryColor"))
                .cornerRadius(10)
                .overlay {
                    // ゲームやり直すボタン
                    Button(action: {
                        dismiss()
                    }) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("SecondaryColor"))
                            .frame(width: 200, height: 100, alignment: .center)
                            .overlay(
                                Text("続ける")
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

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(path: .constant([.GameFieldView]))
    }
}
