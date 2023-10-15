//
//  HowToPlayView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/13.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        ZStack {
            Color("TertiaryColor")
                .ignoresSafeArea()
            VStack {
                Text("遊び方 🎃")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    HowToPlayView()
}
