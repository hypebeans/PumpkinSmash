//
//  LevelSelectView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/04.
//

import SwiftUI

struct LevelSelectView: View {
    
    @State var isNext = false
    
    
    var body: some View {
        ZStack {
            Color("SecondaryColor")
                .ignoresSafeArea()
            
            VStack {
                Text("レベルを選択")
                    .font(.custom("Kiwi Maru", size: 36))
                    .fontWeight(.bold)
                    .foregroundColor(Color("TertiaryColor"))
                    .padding()
                Spacer()
                Text("自分の程度に挑戦しよう！ 💪")
                    .font(.custom("Kiwi Maru", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(Color("TertiaryColor"))
                    .padding(.trailing, 5)
                Spacer()
                Button(action: {
                    isNext = true
                }) {
                    RoundedRectangle(cornerRadius: 20)
                    // TODO: カスタム画像のボタン（今週も締め切り 🗿）
                        .fill(Color("TertiaryColor"))
                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                        .overlay(
                            Text("簡単 🤡") //TODO: ボタンの画像を作成
                                .font(.custom("Kiwi Maru", size: 30))
                                .fontWeight(.black)
                                .foregroundColor(.white)
//                            Spacer()
//                            Text("初心者向けにはおすすめよー 😃")
//                                .font(.custom("Kiwi Maru", size: 16))
//                                .fontWeight(.black)
//                                .foregroundColor(.white)
                        )
                }

                .padding()
                
                
                Button(action: {
                    
                }) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("TertiaryColor"))
                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                        .overlay(
                            Text("普通 🤨")
                                .font(.custom("Kiwi Maru", size: 30))
                                .fontWeight(.black)
                                .foregroundColor(.white)
                        )
                }.padding()
                Button(action: {}) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("TertiaryColor"))
                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                        .overlay(
                            Text("難しい 🗿")
                                .font(.custom("Kiwi Maru", size: 30))
                                .fontWeight(.black)
                                .foregroundColor(.white)
                        )
                }.padding()
                
            }
        }
        
        
    }
}

struct LevelSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectView()
    }
}
