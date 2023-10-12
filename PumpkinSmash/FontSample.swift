//
//  FontSample.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/11.
//

import SwiftUI

struct FontSample: View {
    var body: some View {
        Text("Hello, World!")
            .font(.custom("Kiwi Maru", size: 30))
            .fontWeight(.regular)
    }
}

#Preview {
    FontSample()
}
