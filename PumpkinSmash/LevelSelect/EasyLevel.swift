//
//  EasyLevel.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/13.
//

import SwiftUI

struct EasyLevel: View {
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            VStack {
                Text("簡単")
                Spacer()
            }
            .edgesIgnoringSafeArea([.bottom, .horizontal])
        }
    }
}

#Preview {
    EasyLevel()
}
