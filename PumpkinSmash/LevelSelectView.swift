//
//  LevelSelectView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/04.
//

import SwiftUI

struct LevelSelectView: View {
    
    @State var isNext = false
    
    
    var body: some                                    View {
        VStack {
            Text("レベルを選択")
                .font(.title)
                .fontWeight(.bold)
                .padding()
        
            Button(action: {
                isNext = true
            }) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.black.gradient)
                    .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                    .overlay(
                        Text("簡単 🤡")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                    )
            }
//            .alert(isPresented: $isNext) {
//                Alert(title: Text("CONTINUE"), message: Text("Lanjut?"), primaryButton: Button("YES"), secondaryButton: Button("NO", role: .destructive))
//            }
            .padding()
            
            
            Button(action: {}) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.black.gradient)
                    .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                    .overlay(
                        Text("普通 🤨")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                    )
            }.padding()
            Button(action: {}) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.black.gradient)
                    .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                    .overlay(
                        Text("難しい 🗿")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                    )
            }.padding()
            
        }
        
    }
}

struct LevelSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectView()
    }
}
