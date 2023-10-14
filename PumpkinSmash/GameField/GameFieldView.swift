//
//  GameFieldView.swift
//  PumpkinSmash
//
//  Created by cranoo3 on 2023/10/05.
//

import SwiftUI
import AVFoundation

struct GameFieldView: View {
    // タイマーを作成
    @StateObject var timerManager = TimerManager()
    // ランダムにかぼちゃの画像を選ぶ
    @State var buttonImage = SelectPumpkinImage().randomSelect()
    // グリッドの設定
    let grids = Array(repeating: GridItem(.fixed(UIScreen.main.bounds.width / 5 - 10)), count: 5)
    
    // difficulty → 難易度 LevelSelectViewで選択
    // 0: 簡単, 1: 普通 2: 難しい
    let difficulty: Int
    var showHole: [Int] {
        // 難易度によって表示する穴の数を変更する
        switch difficulty {
        case 0:
            return [2, 6, 8, 10, 12, 14, 16, 18, 22]
            
        case 1:
            return [2, 6, 7, 8, 10, 11, 12, 13, 14, 16, 17, 18, 22]
            
        case 2:
            return Array(0...24)
            
        default:
            return []
        }
    }
    
    // ランダムでボタンを表示する
    @State var buttonPosition = 0
    // ゲームがスタートしているか
    @State var isGameStarted = false
    // かぼちゃ画像のアニメーション
    @State var buttonAnimation: CGSize = CGSize(width: 0, height: 0)
    
    // タップサウンド
    let tapSound = try! AVAudioPlayer(data: NSDataAsset(name: "TapSound")!.data)
    func playSound() {
        // 連打した時に音が重ならないようにする
        tapSound.stop()
        tapSound.currentTime = 0
        tapSound.play()
    }
    
    var body: some View {
        ZStack {
            //TODO: カスタム画像を作成(今週締め切り)
            // タブメニューとグリッド
            VStack {
                // メニューバー
                HStack {
                    // メニューボタン
                    Image(systemName: "slider.horizontal.3")
                        .opacity(0.0)
                    
                    Spacer()
                    
                    // タイマー
                    Text("残り\(timerManager.secondsLeft)秒") // TODO: あとで適したものに変更しよう
                        .font((.custom("Kiwi Maru", size: 60)))
                    
                    Spacer()
                    
                    // ポーズボタン
                    Button(action: {}) {
                        Image(systemName: "pause.fill")
                    }
                }
                .padding()
                
                Spacer()
                
                // ゲーム画面
                ZStack {
                    // ゲーム画面(穴の表示)
                    LazyVGrid(columns: grids) {
                        ForEach ((0...24), id: \.self) { num in
                            if showHole.contains(num) {
                                Hole()
                            } else {
                                DummyHole()
                            }
                        }
                    }
                    // ボタン(ランダム)
                    LazyVGrid(columns: grids) {
                        ForEach ((0...24), id: \.self) { num in
                            if buttonPosition == num {
                                Button(action: {
                                    buttonImage = SelectPumpkinImage().randomSelect()
                                    playSound()
                                    buttonPosition = showHole.shuffled()[0]
                                    buttonAnimation.height = 0
                                    print("Button position is \(buttonPosition)")
                                }) {
                                    Image(buttonImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .offset(buttonAnimation)
                                        .onAppear() {
                                            withAnimation(.spring){
                                                buttonAnimation.height = -30
                                            }
                                        }
                                }
                                .opacity(isGameStarted ? 1.0 : 0.0)
                            } else {
                                DummyHole()
                            }
                        }
                    }
                    
                    // TODO: ボタンデザインを変更しよう
                    if !isGameStarted {
                        Button(action: {
                            isGameStarted = true // ゲームを開始しているか
                            buttonPosition = showHole.shuffled()[0] // ボタンの場所をシャッフルする
                            timerManager.start() // タイマーをスタート
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(maxWidth: .infinity, maxHeight: 90)
                                Text("Start")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            }
                            .padding()
                        }
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .onAppear() {
            // 残り時間を設定
            switch difficulty {
            case 0:
                timerManager.secondsLeft = 15
            case 1:
                timerManager.secondsLeft = 10
            case 2:
                timerManager.secondsLeft = 5
            default:
                timerManager.secondsLeft = 0
            }
            
        }
        .fullScreenCover(isPresented: $timerManager.isTimerStoped, content: {
            ScoreResultsView()
        })
    }
}

// FIXME: (difficulty: 0)はデバッグ用です
struct GameGieldView_Previews: PreviewProvider {
    static var previews: some View {
        GameFieldView(difficulty: 0)
        // Hole()
    }
}
