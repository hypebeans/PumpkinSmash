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
    // 制限時間を設定
    @State var setTime: Int = 0
    // ランダムにかぼちゃの画像を選ぶ
    @State var buttonImage = SelectPumpkinImage().randomSelect()
    // グリッドの設定
    let grids = Array(repeating: GridItem(.fixed(UIScreen.main.bounds.width / 5 - 10)), count: 5)
    
    // difficulty → 難易度 LevelSelectViewで選択
    // 0: 簡単, 1: 普通 2: 難しい
    let difficulty: Int         // 難易度
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
    // かぼちゃの点数
    @State var pumpkinPoints: Int = 0
    
    @Binding var isNext: Bool
    
    // タップサウンドを再生する
    let tapSound = try! AVAudioPlayer(data: NSDataAsset(name: "TapSound")!.data)
    func playSound() {
        // 連打した時に音が重ならないようにする
        tapSound.stop()
        tapSound.currentTime = 0
        tapSound.play()
    }
    
    
    
    var body: some View {
        ZStack {
            Image("GameBG")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1.2)
                .offset(x: -25, y: -60)
                .opacity(0.8)
                .ignoresSafeArea()
            
            // タブメニューとグリッド
            VStack {
                // メニューバー
                HStack {
                    // メニューボタン(ダミーです)
                    Image(systemName: "slider.horizontal.3")
                        .opacity(0.0)
                    
                    Spacer()
                    
                    ZStack {
                        Image("Timeboard")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(y: -10)
                        // タイマー
                        Text("残り\(timerManager.secondsLeft)秒")
                            .font((.custom("Kiwi Maru", size: 48)))
                            .foregroundStyle(.white)
                    }
                    
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
                                    playSound() // タップ音を再生する
                                    buttonPosition = showHole.shuffled()[0] // ボタンが表示される場所をランダムで選択する
                                    buttonAnimation.height = 0 // アニメーション用に初期値に戻す
                                    // 押された画像の種類によって点数を振り分ける
                                    switch buttonImage {
                                    case "Normal_Pumpkin":
                                        pumpkinPoints += 1
                                        print("Normal_Pumpkin. point: \(pumpkinPoints)")
                                    case "Gold_Pumpkin":
                                        pumpkinPoints += 5
                                        print("Gold_Pumpkin. point: \(pumpkinPoints)")
                                    case "Ookawa_Pumpkin":
                                        pumpkinPoints += 10
                                        print("Ookawa_Pumpkin. point: \(pumpkinPoints)")
                                    case "Bomb_Pumpkin":
                                        pumpkinPoints -= 10
                                        print("Bomb_Pumpkin. point: \(pumpkinPoints)")
                                    case "OverworkCat_Pumpkin":
                                        pumpkinPoints -= 20
                                        print("OverworkCat_Pumpkin. point: \(pumpkinPoints)")
                                    default:
                                        pumpkinPoints = 0
                                    }
                                }) {
                                    Image(buttonImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .offset(buttonAnimation)
                                        .onAppear() {
                                            // かぼちゃの種類をランダムに選択する
                                            buttonImage = SelectPumpkinImage().randomSelect()
                                            // かぼちゃの登場アニメーション
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
                            buttonAnimation.height = 0 // アニメーション用に初期値に戻す
                        }) {
                            ZStack {
                                Text("🎃 TAP TO START 🎃")
                                    .font((.custom("Kiwi Maru", size: 30)))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .offset(y: -35)
                            }
                            .padding()
                        }
                    }
                }
                .padding(.bottom, 30)
            }
        }
        // GameFieldViewが呼び出された時に残り時間を設定する
        .onAppear() {
            // 残り時間を設定
            switch difficulty {
            case 0:
                setTime = 15
            case 1:
                setTime = 10
            case 2:
                setTime = 5
            default:
                setTime = 0
            }
            timerManager.secondsLeft = setTime
            
        }
        .fullScreenCover(
            isPresented: $timerManager.isTimerStoped,
            onDismiss: {
                // ゲームを初期状態に戻す
                isGameStarted = false               // ゲーム開始フラグをリセット
                buttonPosition = 0                  // ボタンの場所をリセット
                pumpkinPoints = 0                   // 得点をリセット
                timerManager.secondsLeft = setTime  // 残り時間をリセット
            },
            content: {
                ScoreResultsView(pumpkinPoints: $pumpkinPoints, isNext: $isNext)
            }
        )
    }
}

// FIXME: (difficulty: 0)はデバッグ用です。数字を変更すると難易度が変化します
struct GameGieldView_Previews: PreviewProvider {
    static var previews: some View {
        GameFieldView(difficulty: 0, isNext: .constant(true))
    }
}
