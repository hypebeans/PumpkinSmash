//
//  ScoreResultsView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/12.
//

import SwiftUI

struct ScoreResultsView: View {
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            VStack {
                Text("終了")
                    .font(.custom("Kiwi Maru", size: 60))
                    .fontWeight(.black)
                    .foregroundColor(Color("FourthColor"))
            }
            
        }
        
        
        
        
    }
}

#Preview {
    ScoreResultsView()
}
