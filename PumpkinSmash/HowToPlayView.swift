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
                            .foregroundStyle(.white)
                        Spacer()
                        Text(longIntro)
                            .font(.custom("Kiwi Maru", size: 16))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding()
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
                        Text("内容")
                            .font(.custom("Kiwi Maru", size: 36))
                            .fontWeight(.bold)
                        Spacer()
                        Text("内容")
                            .font(.custom("Kiwi Maru", size: 36))
                            .fontWeight(.bold)
                        Spacer()
                        HStack {
                            Text("内容")
                                .font(.custom("Kiwi Maru", size: 36))
                                .fontWeight(.bold)
                            
                            Image("Instruction")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }.padding()
                    }
                }
            }
//            .navigationViewStyle(StackNavigationViewStyle())
            
            .ignoresSafeArea()
            
            


    }
}

#Preview {
    HowToPlayView()
}
