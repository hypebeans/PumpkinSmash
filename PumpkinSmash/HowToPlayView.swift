//
//  HowToPlayView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/16.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            VStack {
                Text("遊び方")
                    .font(.custom("Kiwi Maru", size: 36))
                    .fontWeight(.bold)
                Spacer()
                Text("こちらは内容")
                    .font(.custom("Kiwi Maru", size: 36))
                    .fontWeight(.bold)
                HStack {
                    
                }
            }
        }
    }
}

#Preview {
    HowToPlayView()
}
