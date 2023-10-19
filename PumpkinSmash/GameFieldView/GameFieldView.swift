//
//  GameFieldView.swift
//  PumpkinSmash
//
//  Created by cranoo3 on 2023/10/05.
//

import SwiftUI
import AVFoundation

struct GameFieldView: View {
    // path → 画面遷移を制御するフラグ
    @Binding var path: [ViewPath]
    // グリッドの設定
    let grids = Array(repeating: GridItem(.fixed(UIScreen.main.bounds.width / 5 - 10)), count: 5)
    // タップサウンドを再生する
    let tapSound = try! AVAudioPlayer(data: NSDataAsset(name: "TapSound")!.data)
    // タイマーを作成
    @StateObject var timerManager = TimerManager()
    // 難易度を選択。
//    @EnvironmentObject var difficulty: Difficulty
    @ObservedObject var difficulty = Difficulty()
    // 制限時間を保持しておく変数
    @State var setTime: Int = 0
    // ランダムにかぼちゃの画像を選ぶ
    @State var randomSelectPumpkinImage = ""
    // 難易度によって表示されるかぼちゃを変更する
    @State var pumpkinImages:[String] = [""]
    // 表示する穴の選択
    @State var showHole: [Int] = []
    // ランダムでボタンを表示する
    @State var buttonPosition = 0
    // ゲームスタートのフラグ
    @State var isGameStarted = false
    //アラート表示のフラグ
    @State var isAlertShow = false
    // ポーズボタン表示のフラグ
    @State var isPauseShow = false
    // かぼちゃ画像のアニメーション
    @State var buttonAnimation: CGSize = CGSize(width: 0, height: 0)
    // かぼちゃの点数
    @State var pumpkinPoints: Int = 0
    // 連打した時に音が重ならないようにする
    func playSound() {
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
                    ZStack {
                        Image("Timeboard")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(y: isPauseShow ? -10 : -15)
                        // タイマー
                        Text("残り\(timerManager.secondsLeft)秒")
                            .font((.custom("Kiwi Maru", size: 48)))
                            .foregroundStyle(.white)
                    }.frame(maxWidth: .infinity)
                    
                    if isPauseShow {
                        // ポーズボタン
                        Spacer()
                        Button(action: {
                            isAlertShow = true
                        }) {
                            Image("pauseButton")
                                .scaleEffect(0.25)
                        }
                        .frame(width: 50, height: 50)
                    } //アニメ
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
                                    // タップ音を再生する
                                    playSound()
                                    // ボタンが表示される場所をランダムで選択する(重複なし)
                                    var positionTmp = 0
                                    positionTmp = buttonPosition
                                    repeat {
                                        buttonPosition = showHole.shuffled()[0]
                                    } while positionTmp == buttonPosition
                                    // アニメーション用に初期値に戻す
                                    buttonAnimation.height = 0
                                    // 押された画像の種類によって点数を振り分ける
                                    dividePoint(imageName: randomSelectPumpkinImage)
                                }) {
                                    Image(randomSelectPumpkinImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .offset(buttonAnimation)
                                        .onAppear() {
                                            // かぼちゃの画像をランダムに選択する
                                            randomSelectPumpkinImage = pumpkinImages.shuffled()[0]
                                            
                                            // かぼちゃの登場アニメーション
                                            withAnimation(.spring){
                                                buttonAnimation.height = -30
                                            }
                                        }
                                        .opacity(isGameStarted ? 1 : 0)
                                }
                            } else {
                                DummyHole()
                            }
                        }
                    }
                    
                    // TODO: ボタンデザインを変更しよう
                    if !isGameStarted {
                        Button(action: {
                            isGameStarted = true // ゲームを開始しているか
                            isPauseShow = true // ポーズボタンの表示
                            // ボタンが表示される場所をランダムで選択する(重複なし)
                            var positionTmp = 0
                            positionTmp = buttonPosition
                            repeat {
                                buttonPosition = showHole.shuffled()[0]
                            } while positionTmp == buttonPosition
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
            // 制限時間(setTime)、表示する穴の数(showHole)、画像の種類を変更する(pumpkinImage)
            switch difficulty.num {
            case 0:
                print("difficulty is 'Easy'")
                setTime = 15
                showHole = [2, 6, 8, 10, 12, 14, 16, 18, 22]
                pumpkinImages = ["Normal_Pumpkin", "Gold_Pumpkin", "Ookawa_Pumpkin"]
            case 1:
                print("difficulty is 'Normal'")
                setTime = 10
                showHole = [2, 6, 7, 8, 10, 11, 12, 13, 14, 16, 17, 18, 22]
                pumpkinImages = ["Normal_Pumpkin", "Gold_Pumpkin", "Ookawa_Pumpkin"]
            case 2:
                print("difficulty is 'Hard'")
                setTime = 5
                showHole = Array(0...24)
                pumpkinImages = ["Normal_Pumpkin", "Gold_Pumpkin", "Ookawa_Pumpkin", "Bomb_Pumpkin", "OverworkCat_Pumpkin"]
            default:
                setTime = 1
                showHole = []
            }
            // 残り時間を設定
            timerManager.secondsLeft = setTime
            
        }
        .fullScreenCover(
            isPresented: $timerManager.isTimerStopped,
            onDismiss: {
                // ゲームを初期状態に戻す
                isGameStarted = false               // ゲーム開始フラグをリセット
                buttonPosition = 0                  // ボタンの場所をリセット
                pumpkinPoints = 0                   // 得点をリセット
                timerManager.secondsLeft = setTime  // 残り時間をリセット
                print("onDismiss pumpkinPoints: \(pumpkinPoints)")
            },
            content: {
                ScoreResultsView(pumpkinPoints: self.pumpkinPoints, path: $path)
                    .navigationBarBackButtonHidden()
            }
        )
    }
    
    // 画像によって点数を振り分ける
    func dividePoint(imageName: String) {
        switch imageName {
        case "Normal_Pumpkin":
            pumpkinPoints += 1
            // print("Normal_Pumpkin. point: \(pumpkinPoints)")
        case "Gold_Pumpkin":
            pumpkinPoints += 5
            // print("Gold_Pumpkin. point: \(pumpkinPoints)")
        case "Ookawa_Pumpkin":
            pumpkinPoints += 10
            // print("Ookawa_Pumpkin. point: \(pumpkinPoints)")
        case "Bomb_Pumpkin":
            pumpkinPoints -= 10
            // print("Bomb_Pumpkin. point: \(pumpkinPoints)")
        case "OverworkCat_Pumpkin":
            pumpkinPoints -= 20
            // print("OverworkCat_Pumpkin. point: \(pumpkinPoints)")
        default:
            pumpkinPoints = 0
        }
    }
}

// FIXME: (difficulty: 0, isPresented: .constant(true))はデバッグ用です。difficultyの数字を変更すると難易度が変化します
struct GameFieldView_Previews: PreviewProvider {
    static var previews: some View {
        GameFieldView(path: .constant([]))
    }
}
