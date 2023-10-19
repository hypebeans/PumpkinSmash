//
//  HoleView.swift
//  PumpkinSmash
//
//  Created by cranoo3 on 2023/10/14.
//

import SwiftUI

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

struct Hole_Previews: PreviewProvider {
    static var previews: some View {
        Hole()
    }
}
