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
私たちのゲームをプレイしていただきありがとうございます！ 

「Pumpkin Smash」はハロウィンをテーマにしたミニゲームです。飛び出すカボチャをタップして最高スコアを到達しよう！
"""
    
    let easyDesc =
    """
9つの穴が表示されます。
時間制限は15秒で3種類の
かぼちゃが登場します。
"""
    
    let mediumDesc =
    """
13個の穴が表示されます。
時間制限は10秒で3種類の
かぼちゃが登場します。
"""
    let hardDesc =
    """
25個の穴が表示されます。
時間制限は7秒で5種類の
かぼちゃが登場します。
危険なかぼちゃがあるので
注意してください！
"""
    
    
    var body: some View {

        ZStack {
            // 背景色
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            // ScrollView
            ScrollView {
                ZStack {
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
                        Text("難易度は")
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
                        Text("の3つ")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
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
                                .offset(x: 10)
                                .frame(maxWidth: .infinity)
                            Text(hardDesc)
                                .font(.custom("Kiwi Maru", size: 12))
                                .fontWeight(.bold)
                                .padding(.leading, 35)
                        }
                        .padding()
                        Text("")
                            .font(.custom("Kiwi Maru", size: 36))
                            .fontWeight(.bold)
                        Spacer()
                        Text("登場するかぼちゃの種類")
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
                                .frame(maxWidth: .infinity)
                                
                        }
                        .offset(y: 20)
                        .padding()
                        // ノーマルかぼちゃ
                        Text("これは普通かぼちゃです。スコア1ポイント追加")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack(spacing: 0) {
                            Text("登場する難易度: ")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("簡単")
                                .font(.custom("Kiwi Maru", size: 16))
                                .foregroundStyle(Color("TertiaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("普通")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .foregroundStyle(Color("SecondaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("難しい")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .foregroundStyle(Color("FourthColor"))
                            
                        }
                        
                        
                        // 金かぼちゃ
                        HStack(spacing: 0) {
                            Text("金かぼちゃ")
                                .font(.custom("Kiwi Maru", size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                            Image("Gold_Pumpkin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.75)
                                
                        }
                        .offset(y: 20)
                        .padding()
                        Text("これは金かぼちゃです。スコア5ポイント追加")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack(spacing: 0) {
                            Text("登場する難易度: ")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("簡単")
                                .font(.custom("Kiwi Maru", size: 16))
                                .foregroundStyle(Color("TertiaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("普通")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .foregroundStyle(Color("SecondaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("難しい")
                                    .font(.custom("Kiwi Maru", size: 16))
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
                                .frame(maxWidth: .infinity)
                                
                        }
                        .offset(y: 20)
                        .padding()
                        Text("これは大川先生をモチーフにした大川ぼちゃです。目がTuxになっているのが特徴。スコア10ポイント追加")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack(spacing: 0) {
                            Text("登場する難易度: ")
                                .font(.custom("Kiwi Maru", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("簡単")
                                .font(.custom("Kiwi Maru", size: 16))
                                .foregroundStyle(Color("TertiaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("普通")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .foregroundStyle(Color("SecondaryColor"))
                                Text("、")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            Text("難しい")
                                    .font(.custom("Kiwi Maru", size: 16))
                                    .foregroundStyle(Color("FourthColor"))
                            
                        }
                        
                        // 爆弾かぼちゃ
                        HStack(spacing: 0) {
                            Text("爆弾かぼちゃ")
                                .font(.custom("Kiwi Maru", size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                            Image("Bomb_Pumpkin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.75)
                        }
                        .offset(y: 20)
                        .padding()
                        Text("これは爆弾かぼちゃです。押しても害はありませんが、スコアから10ポイント引かれます")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack(spacing: 0) {
                            Text("登場する難易度：")
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
                                .frame(maxWidth: .infinity)
                        }
                        .offset(y: 20)
                        .padding()
                        Text("これは残業ぼちゃのことです。残業をしすぎたお陰で疲れています。スコアから20ポイント引かれます")
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack(spacing: 0) {
                            Text("登場する難易度：")
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
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HowToPlayView()
}
