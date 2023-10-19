//
//  TitleView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/13.
//

import SwiftUI

struct TitleView: View {
    // 画面遷移を制御
    @State var path: [ViewPath] = []
    @State var showPlay = false
    // View間で難易度をやり取りするためのObservedObject
    @ObservedObject var difficulty = Difficulty()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        // 遊び方ボタン
                        Button(action: {
                            showPlay = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("FourthColor"))
                                .scaleEffect(1.5)
                        }.padding(.leading, 20)
                        Text("遊び方 🎃")
                            .font(.custom("Kiwi Maru", size: 16))
                            .foregroundColor(Color("FourthColor"))
                            .padding(.leading, 2)
                        Spacer()
                        
                    }
                    .padding()
                    .sheet(isPresented: $showPlay) {
                        HowToPlayView()
                    }

                    // ロゴ
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(1.25)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    
                    VStack {
                        // TAP TO START
                        Button(action: {
                            path.append(.LevelSelectView)
                        }) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color("PrimaryColor"))
                                .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                                .overlay(
                                    Text("🎃 TAP TO START 🎃")
                                        .font(.custom("Kiwi Maru", size: 30))
                                        .fontWeight(.black)
                                        .foregroundColor(.white)
                                )
                            Spacer()
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    ZStack {
                        VStack {
                            // TODO: 他の画像を追加こと
                            Image("Ookawa_Pumpkin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    
                }
                // ボタンが押された時にレベル選択に遷移する
                .navigationDestination(for: ViewPath.self) { value in
                    switch value {
                    case .TitleView:
                        TitleView()
                    case .LevelSelectView:
                        LevelSelectView(path: $path)
                            .navigationBarBackButtonHidden()
                            .environmentObject(difficulty)
                    case .GameFieldView:
                        GameFieldView(path: $path)
                            .navigationBarBackButtonHidden()
                            .environmentObject(difficulty)
                        
                    }
                }
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}

