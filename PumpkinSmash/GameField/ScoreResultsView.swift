//
//  ScoreResultsView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/12.
//

import SwiftUI

struct ScoreResultsView: View {
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            VStack {
                Text("ゲーム終了")
                    .font(.custom("Kiwi Maru", size: 60))
                    .fontWeight(.black)
                    .foregroundColor(Color("FourthColor"))
                
                Spacer()
                Text("あなたのスコア結果")
                    .font(.custom("Kiwi Maru", size: 36))
                    .fontWeight(.medium)
                    .foregroundColor(Color("FourthColor"))
                Spacer()
                ZStack {
                    Image("OverworkCat_Pumpkin")
                        .resizable()
                        .aspectRatio(contentMode: .fit) //TODO: 背景の変更
                    Text("99")
                        .font(.custom("Kiwi Maru", size: 96))
                        .fontWeight(.medium)
                        .foregroundColor(Color("FourthColor"))
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        
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
                    
                    Button(action: {
                        
                    }) {
                        RoundedRectangle(cornerRadius: 15)
                        // TODO: カスタム画像のボタン（今週も締め切り 🗿）
                            .fill(Color("SecondaryColor"))
                            .frame(width: 150, height: 60, alignment: .center)
                            .overlay(
                                Text("ゲームやり直す") //TODO: ボタンの画像を作成
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
        ScoreResultsView()
    }
}
