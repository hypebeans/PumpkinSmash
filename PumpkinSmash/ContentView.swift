//
//  ContentView.swift
//  PumpkinSmash
//
//  Created by Jonathan Budiman on 2023/10/04.
//

import SwiftUI



struct ContentView: View {


    @State var isLaunch = true
    
    var body: some View {
        Group {
            if isLaunch {
                LaunchScreenView()
            } else {
                TitleView()
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    isLaunch = false
                }
            }
        }    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
