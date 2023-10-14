//
//  LevelSelectView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/04.
//

import SwiftUI

struct LevelSelectView: View {
    @State var isNext = false
    // difficulty → 難易度   0: 簡単, 1: 普通 2: 難しい
    @State var difficulty = 0
    
    var body: some View {
        NavigationStack {
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
                    
                    // 簡単
                    Button(action: {
                        difficulty = 0
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
                    
                    // 普通
                    Button(action: {
                        difficulty = 1
                        isNext = true
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
                    
                    // 難しい
                    Button(action: {
                        difficulty = 2
                        isNext = true
                    }) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("TertiaryColor"))
                            .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                            .overlay(
                                Text("難しい 🗿")
                                    .font(.custom("Kiwi Maru", size: 30))
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                            )
                    }
                    .padding()
                }
                // ボタンが押された時に正しく画面遷移を行う
                .navigationDestination(isPresented: $isNext) {
                    GameFieldView(difficulty: $difficulty)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

struct LevelSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectView()
    }
}
