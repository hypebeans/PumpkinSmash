//
//  ScoreResultsView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/12.
//

import SwiftUI

struct ScoreResultsView: View {
    let pumpkinPoints: Int
    @Binding var path: [ViewPath]
    // dismissボタン
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            VStack {
                Text("ゲーム終了")
                    .font(.custom("Kiwi Maru", size: 60))
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .overlay(
                Text("ゲーム終了")
                    .font(.custom("Kiwi Maru", size: 60))
                    .fontWeight(.black)
                    .foregroundColor(Color("FourthColor"))
                    .offset(x: 2, y: 4)
                )
                
                Spacer()
                Text("あなたのスコア結果")
                    .font(.custom("Kiwi Maru", size: 36))
                    .fontWeight(.medium)
                    .foregroundColor(Color("FourthColor"))
                Spacer()
                ZStack {
                    Image("Scoreboard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.85)
                    Text("\(pumpkinPoints)")
                        .font(.custom("Kiwi Maru", size: 96))
                        .fontWeight(.medium)
                        .foregroundColor(Color("FourthColor"))
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    // メニューに戻るボタン
                    Button(action: {
                        path.removeLast()
                    }) {
                        RoundedRectangle(cornerRadius: 15)
                        // TODO: カスタム画像のボタン（今週も締め切り 🗿）
                            .fill(Color("SecondaryColor"))
                            .frame(width: 150, height: 60, alignment: .center)
                            .overlay(
                                Text("メニューに戻る") //TODO: ボタンの画像を作成
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                            )
                    }
                    
                    // ゲームやり直すボタン
                    Button(action: {
                        dismiss()
                    }) {
                        RoundedRectangle(cornerRadius: 15)
                        // TODO: カスタム画像のボタン（今週も締め切り 🗿）
                            .fill(Color("SecondaryColor"))
                            .frame(width: 150, height: 60, alignment: .center)
                            .overlay(
                                Text("もう1度プレイ") //TODO: ボタンの画像を作成
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                            )
                    }
                    Spacer()
                }.padding()
                
                Spacer()
            }
            
        }
        
        
        
        
    }
}

struct ScoreResultView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreResultsView(pumpkinPoints: 99, path: .constant([.GameFieldView]))
    }
}
