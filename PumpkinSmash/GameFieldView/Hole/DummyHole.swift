//
//  DummyHole.swift
//  PumpkinSmash
//
//  Created by cranoo3 on 2023/10/14.
//

import SwiftUI

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

struct DummyHole_Previews: PreviewProvider {
    static var previews: some View {
        DummyHole()
    }
}
