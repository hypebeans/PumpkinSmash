//
//  LevelSelectView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/04.
//

import SwiftUI

struct LevelSelectView: View {
    // 画面遷移を制御
    @Binding var path: [ViewPath]
    // difficulty → 難易度   0: 簡単, 1: 普通 2: 難しい
    @State var difficulty: Int = 0
    
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
                
                // 簡単
                Button(action: {
                    presented(num: 0)
                }) {
                    RoundedRectangle(cornerRadius: 20)
                    // TODO: カスタム画像のボタン（今週も締め切り 🗿）
                        .fill(Color("TertiaryColor"))
                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                        .overlay(
                            Text("簡単 🤡") //TODO: ボタンの画像を作成
                                .font(.custom("Kiwi Maru", size: 30))
                                .fontWeight(.black)
                                .foregroundColor(.white) +
                            Text("\n\n初心者向けにはおすすめよー 😃")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.black)
                                .foregroundColor(.white)
                        )
                }

                .padding()
                
                // 普通
                Button(action: {
                    presented(num: 1)
                }) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("TertiaryColor"))
                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                        .overlay(
                            Text("普通 🤨")
                                .font(.custom("Kiwi Maru", size: 30))
                                .fontWeight(.black)
                                .foregroundColor(.white) +
                            Text("\n\n中級者向けにしっかりレベルアップ！ 🤩")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.black)
                                .foregroundColor(.white)
                        )
                }
                .navigationDestination(for: ViewPath.self) { value in
                    GameFieldView(path: $path)
                }
                .padding()
                
                // 難しい
                Button(action: {
                    presented(num: 2)
                }) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("TertiaryColor"))
                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                        .overlay(
                            Text("難しい 🗿")
                                .font(.custom("Kiwi Maru", size: 30))
                                .fontWeight(.black)
                                .foregroundColor(.white) +
                            Text("\n\nえぇぇ、カボチャ愛好家ですねー 😳")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.black)
                                .foregroundColor(.white)
                        )
                }
                .padding()
            }
        }
    }
    
    // 難易度を変数difficultyへ代入し画面遷移を行う関数
    func presented(num: Int) {
        difficulty = num
        path.append(.GameFieldView)
    }
    
    func returnDifficulty() -> Int{
        return difficulty
    }
    
}

struct LevelSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectView(path: .constant([.TitleView]))
    }
}
