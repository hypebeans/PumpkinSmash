//
//  TimerManager.swift
//  PumpkinSmash
//
//  Created by cranoo3 on 2023/10/13.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = 10
    @Published var isTimerStoped = false
    var timer = Timer()
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.secondsLeft -= 1
            // タイマーが0になった時にマイナスにならないようにする
            if self.secondsLeft == 0 {
                self.timerMode = .initial
                self.secondsLeft = 0
                self.isTimerStoped = true
                timer.invalidate()
            }
        })
    }
    
    func pause() {
        timerMode = .paused
        timer.invalidate()
    }
    
    func reset() {
        timerMode = .initial
        self.secondsLeft = 10
        timer.invalidate()
    }
}
