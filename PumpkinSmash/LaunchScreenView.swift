//
//  LaunchScreenView.swift
//
//
//
//

import SwiftUI

struct LaunchScreenView: View {
    @State var index: Int = 0
    private let timer = Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
        
        VStack {
            Image("animepumpkin\(index)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .onReceive(timer) { _ in
                    index += 1
                    if index >= 74 {
                        timer.upstream.connect().cancel()
                    }
                }
        }
        
        }
    }
}
    
    
    struct LaunchScreenView_Previews: PreviewProvider {
        static var previews: some View {
            LaunchScreenView()
        }
    }
