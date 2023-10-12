//
//  GameFieldView.swift
//  PumpkinSmash
//
//  Created by cranoo3 on 2023/10/05.
//

import SwiftUI

struct GameFieldView: View {
    let grids = Array(repeating: GridItem(.fixed(UIScreen.main.bounds.width / 5 - 10)), count: 5)
    
    // let showHole: [Int] = [2, 6, 8, 10, 11, 12, 13, 14, 16, 18, 22] // 表示する穴の番号
    
    // difficulty → 難易度。0: 簡単, 1: 普通 2: 難しい
    let difficulty: Int = 1 // switchケーズに使用する
    
    var showHole: [Int] {
        // 難易度によって表示する穴の数を変更する
        switch difficulty {
        case 0:
            return [2, 6, 8, 10, 12, 14, 16, 18, 22]
            
        case 1:
            return [2, 6, 7, 8, 10, 11, 12, 13, 14, 16, 17, 18, 22]
            
        case 2:
            return Array(0...24)
            
        default:
            return []
        }
    }
    
    var body: some View {
        ZStack {
            //TODO: カスタム画像を作成(今週締め切り)
            // タブメニュー?
            VStack {
                // 上のメニューバー
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
                .padding()
                
                Spacer()
                
                // ゲーム画面
                LazyVGrid(columns: grids) {
                    ForEach ((0...24), id: \.self) { num in
                        if showHole.contains(num) {
                            Hole()
                        } else {
                            DummyHole()
                        }
                    }
                }
                .padding(.bottom, 30)
            
            
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(.black)
//                    .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
//                    .overlay(
//                        Text("Game Background 🐱")
//                            .font(.title)
//                            .fontWeight(.black)
//                            .foregroundColor(.white)
//                    )
//
//                Spacer()
//            }
//            .padding()
            }
        }
    }
}

struct Hole: View {
    var body: some View {
        ZStack {
            Image("Hole")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 90)
        }
    }
}

struct DummyHole: View {
    var body: some View {
        ZStack {
            Image("Hole")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.0)
                .frame(width: 80, height: 90)
        }
    }
}

struct GameGieldView_Previews: PreviewProvider {
    static var previews: some View {
        GameFieldView()
        // Hole()
    }
}
