//
//  HowToPlayView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/16.
//

import SwiftUI

struct HowToPlayView: View {
    
    let longIntro =
"""
まず、私たちのゲームを試してくれてありがとうございます！ 「Pumpkin Smash」又はカボチャスマッシュはハロウィンテーマミニゲーム。

たった1ゴールだけでカボチャをスマッシュして自分の力で最高のスコアに到達する。

このゲームは3つの難易度と5種類のカボチャに分かれています。
"""
    
    let easyDesc =
    """
簡単の詳細は９穴があります。そして、時間制限は15秒になります。かぼちゃの種類合計は3個になります。
"""
    let mediumDesc =
    """
簡単の詳細は13穴があります。そして、時間制限は10秒になります。かぼちゃの種類合計も3個になります。
"""
    let hardDesc =
    """
簡単の詳細は25穴があります。そして、時間制限は5秒になります。かぼちゃの種類合計は5個になります。危険なかぼちゃがあるので、ご注意ください
"""
    
    
    var body: some View {

            ScrollView {
                ZStack {
                    Color("PrimaryColor")
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        Text("")
                        Spacer()
                        Image("HowToPlay")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(0.8)
                            .offset(x: 20)
                        
                        Spacer()
                        Text("Pumpkin Smashにようこそ！🎃🫰")
                            .font(.custom("Kiwi Maru", size: 20))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("FourthColor"))
                        Spacer()
                        Text(longIntro)
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        HStack {
                            Image("PlayMethod")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.65)
                            Image("Instruction")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(1.15)
                                .offset(x: -20)
                                .frame(maxWidth: .infinity)
                        }.padding()
                        Spacer()
                        HStack(spacing: 0) {
                        Text("３つの難易度は")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text("簡単")
                            .font(.custom("Kiwi Maru", size: 24))
                            .foregroundStyle(Color("TertiaryColor"))
                            Text("、")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        Text("普通")
                                .font(.custom("Kiwi Maru", size: 24))
                                .foregroundStyle(Color("SecondaryColor"))
                            Text("、")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        Text("難しい")
                                .font(.custom("Kiwi Maru", size: 24))
                                .foregroundStyle(Color("FourthColor"))
                    }
                        Spacer()
                        HStack(spacing: 0) {
                            Image("easyTitle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.85)
                                .offset(x: -5)
                                .frame(maxWidth: .infinity)
                            Text(easyDesc)
                                .font(.custom("Kiwi Maru", size: 12))
                                .fontWeight(.bold)
                        }
                        .padding()
                        
                        Spacer()
                        HStack(spacing: 0) {
                            Image("normalTitle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.85)
                                .offset(x: -5)
                                .frame(maxWidth: .infinity)
                            Text(mediumDesc)
                                .font(.custom("Kiwi Maru", size: 12))
                                .fontWeight(.bold)
                        }
                        .padding()
                        Spacer()
                        HStack(spacing: 0) {
                            Image("hardTitle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.85)
                                .offset(x: -5)
                                .frame(maxWidth: .infinity)
                            Text(hardDesc)
                                .font(.custom("Kiwi Maru", size: 12))
                                .fontWeight(.bold)
                        }
                        .padding()
                        Text("")
                            .font(.custom("Kiwi Maru", size: 36))
                            .fontWeight(.bold)
                        Spacer()
                        Text("5つのかぼちゃ種類は：")
                            .font(.custom("Kiwi Maru", size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(Color("FourthColor"))
                        Spacer()
                        
                        // 普通かぼちゃ
                        HStack(spacing: 0) {
                            Image("Normal_Pumpkin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.75)
                            Text("普通かぼちゃ")
                                .font(.custom("Kiwi Maru", size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                
                        }
                        .offset(y: 20)
                        .padding()
                        Text("これは普通かぼちゃのことです。スマッシュなら、スコア+1になった。")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack(spacing: 0) {
                            Text("難易度：")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("簡単")
                                .font(.custom("Kiwi Maru", size: 24))
                                .foregroundStyle(Color("TertiaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("普通")
                                    .font(.custom("Kiwi Maru", size: 24))
                                    .foregroundStyle(Color("SecondaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("難しい")
                                    .font(.custom("Kiwi Maru", size: 24))
                                    .foregroundStyle(Color("FourthColor"))
                        }
                        
                        
                        // 金かぼちゃ
                        HStack(spacing: 0) {
                            Text("金かぼちゃ")
                                .font(.custom("Kiwi Maru", size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            Image("Gold_Pumpkin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.75)
                                
                        }
                        .offset(y: 20)
                        .padding()
                        Text("これは普通かぼちゃのことです。スマッシュなら、スコア+3になった。")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack(spacing: 0) {
                            Text("難易度：")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("簡単")
                                .font(.custom("Kiwi Maru", size: 24))
                                .foregroundStyle(Color("TertiaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("普通")
                                    .font(.custom("Kiwi Maru", size: 24))
                                    .foregroundStyle(Color("SecondaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("難しい")
                                    .font(.custom("Kiwi Maru", size: 24))
                                    .foregroundStyle(Color("FourthColor"))
                        }
                        
                        // 大川かぼちゃ
                        HStack(spacing: 0) {
                            Image("Ookawa_Pumpkin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.75)
                            Text("大川かぼちゃ")
                                .font(.custom("Kiwi Maru", size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                
                        }
                        .offset(y: 20)
                        .padding()
                        Text("これは普通かぼちゃのことです。スマッシュなら、スコア+3になった。")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack(spacing: 0) {
                            Text("難易度：")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("簡単")
                                .font(.custom("Kiwi Maru", size: 24))
                                .foregroundStyle(Color("TertiaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("普通")
                                    .font(.custom("Kiwi Maru", size: 24))
                                    .foregroundStyle(Color("SecondaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("難しい")
                                    .font(.custom("Kiwi Maru", size: 24))
                                    .foregroundStyle(Color("FourthColor"))
                        }
                        
                        // 爆弾かぼちゃ
                        HStack(spacing: 0) {
                            Text("爆弾かぼちゃ")
                                .font(.custom("Kiwi Maru", size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            Image("Bomb_Pumpkin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.75)
                        }
                        .offset(y: 20)
                        .padding()
                        Text("これは普通かぼちゃのことです。スマッシュなら、スコア+3になった。")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack(spacing: 0) {
                            Text("難易度：")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("難しい")
                                    .font(.custom("Kiwi Maru", size: 24))
                                    .foregroundStyle(Color("FourthColor"))
                        }
                        
                        // 残業猫かぼちゃ
                        HStack(spacing: 0) {
                            Image("OverworkCat_Pumpkin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.75)
                            Text("残業猫かぼちゃ 🙀🐱😺😻😺🐱🙀")
                                .font(.custom("Kiwi Maru", size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        }
                        .offset(y: 20)
                        .padding()
                        Text("これは普通かぼちゃのことです。スマッシュなら、スコア+3になった。")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack(spacing: 0) {
                            Text("難易度：")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("難しい")
                                    .font(.custom("Kiwi Maru", size: 24))
                                    .foregroundStyle(Color("FourthColor"))
                        }.padding()
                        
                    }
                }
            }
//            .navigationViewStyle(StackNavigationViewStyle())
            .ignoresSafeArea()
//            .presentationDetents([
//                .large
//              ])
//            .presentationBackgroundInteraction(.enabled(upThrough: .height(.infinity)))

            
            


    }
}

#Preview {
    HowToPlayView()
}
