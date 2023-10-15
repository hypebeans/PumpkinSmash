//
//  LevelSelectView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/04.
//

import SwiftUI

struct LevelSelectView: View {
<<<<<<< Updated upstream:PumpkinSmash/LevelSelectView.swift
    // 画面遷移を制御
    @State var isNext = false
    // difficulty → 難易度   0: 簡単, 1: 普通 2: 難しい
    @State var difficulty = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("SecondaryColor")
                    .ignoresSafeArea()
=======
    
    @State var showEasy = false
    @State var showMedium = false
    @State var showHard = false
    
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
                Text("自分の程度に挑戦しよう！ 💪 ")
                    .font(.custom("Kiwi Maru", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(Color("TertiaryColor"))
                    .padding(.trailing, 5)
                Spacer()
                Button(action: {
                    showEasy = true
                }) {
                    RoundedRectangle(cornerRadius: 20)
                    // TODO: カスタム画像のボタン（今週も締め切り 🗿）
                        .fill(Color("TertiaryColor"))
                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                        .overlay(
                            Text("簡単 👶") //TODO: ボタンの背景を作成
                                .font(.custom("Kiwi Maru", size: 30))
                                .fontWeight(.black)
                                .foregroundColor(.white) +
                            Text("\n\n初心者向けにはおすすめよー 😃")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.black)
                                .foregroundColor(.white)
                        )
                }.padding()
                    .sheet(isPresented: $showEasy, content: {
                        EasyLevel()
                    })
>>>>>>> Stashed changes:PumpkinSmash/LevelSelect/LevelSelectView.swift
                
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
                    
<<<<<<< Updated upstream:PumpkinSmash/LevelSelectView.swift
                    // ボタンが押された時に遷移する
                    NavigationLink(
                        destination: GameFieldView(difficulty: self.difficulty)
                            .navigationBarBackButtonHidden(),
                        isActive: $isNext){
                            // 空のView
                            EmptyView()
                        }
                    
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
=======
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
                }.padding()
                Button(action: {
                    
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
                }.padding()
                Spacer()
                //TODO: 画像のデコ
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
>>>>>>> Stashed changes:PumpkinSmash/LevelSelect/LevelSelectView.swift
            }
        }
    }
}

struct LevelSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectView()
    }
}
