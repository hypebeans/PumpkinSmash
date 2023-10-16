//
//  TitleView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/13.
//

import SwiftUI

struct TitleView: View {
    // 画面遷移を制御
    @State var isNext = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        // info Button
                        Button(action: {
                            
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
                    
                    // ロゴ
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(1.25)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    
                    // ボタンが押された時にレベル選択に遷移する
                    NavigationLink(
                        destination: LevelSelectView()
                            .navigationBarBackButtonHidden(),
                        isActive: $isNext){
                            // 空のView
                            EmptyView()
                        }
                    VStack {
                        Button(action: {
                            isNext = true
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
            }
        }
        }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}

