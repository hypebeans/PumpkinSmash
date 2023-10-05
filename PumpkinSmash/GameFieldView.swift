//
//  GameFieldView.swift
//  PumpkinSmash
//
//  Created by cranoo3 on 2023/10/05.
//

import SwiftUI

struct GameFieldView: View {
    var body: some View {
        ZStack {
            // タブメニュー?
            VStack {
                HStack {
                    // メニューボタン
                    Button(action: {}) {
                        Image(systemName: "slider.horizontal.3")
                    }
                    Spacer()
                    
                    // タイマー
                    Text("0:00") // TODO: あとで適したものに変更しよう
                    
                    Spacer()
                    
                    // ポーズボタン
                    Button(action: {}) {
                        Image(systemName: "pause.fill")
                    }
                }
                
                // ゲーム画面
                RoundedRectangle(cornerRadius: 20)
                    .fill(.black.gradient)
                    .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                    .overlay(
                        Text("Game Background 🐱")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                    )
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    GameFieldView()
}
