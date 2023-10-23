//
//  GameFieldView.swift
//  PumpkinSmash
//
//  Created by cranoo3 on 2023/10/05.
//

import SwiftUI
import AVFoundation

struct GameFieldView: View {
    // path: 画面遷移を制御するフラグ
    @Binding var path: [ViewPath]
    // グリッドの設定
    let grids = Array(repeating: GridItem(.fixed(UIScreen.main.bounds.width / 5 - 10)), count: 5)
    // タップサウンドを再生する
    let tapSound = try! AVAudioPlayer(data: NSDataAsset(name: "TapSound")!.data)
    // タイマーを作成
    @StateObject var timerManager = TimerManager()
    // 難易度を選択。
    // MARK:  プレビューの時はEnvironmentObjectにしてください!!! 簡単しか選ばれなくなります!!!
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
    @State var alertScale = 0.0
    @State var alertOpacity = 0.0
    // ポーズボタン表示のフラグ
    @State var isPauseShow = false
    // かぼちゃ画像のアニメーション
    @State var buttonAnimation: CGSize = CGSize(width: 0, height: 0)
    // かぼちゃの点数
    @State var countPumpkinPoints: Int = 0
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
                .offset(x: -35, y: 20)
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
                        Button(
                            action: {
                                isAlertShow.toggle()
                        }) {
                            Image("pauseButton")
                                .scaleEffect(0.25)
                        }
                        .frame(width: 50, height: 50)
                        .disabled(isAlertShow ? true : false)
                        
                        
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
                    .disabled(isAlertShow ? true : false)
                    
                    
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
                
            }
            .background(isAlertShow ? Color(.black) : Color(.clear))
            .opacity(isAlertShow ? 0.6 : 1)
            
            if isAlertShow {
                ZStack {
                    CustomAlert(path: $path)
                }.scaleEffect(alertScale)
                    .opacity(alertOpacity)
                // ポーズボタンを表示する、アニメを実施する
                .onAppear() {
                    timerManager.pause()
                    withAnimation(.easeInOut(duration: 0.5)) {
                        alertScale = 1.0
                        alertOpacity = 1.0
                    }
                }
            }
        }
        // GameFieldViewが呼び出された時に残り時間を設定する
        .onAppear() {
            setDifficulty()
        }
        .fullScreenCover(
            isPresented: $timerManager.isTimerStopped,
            onDismiss: {
                // ゲームを初期状態に戻す
                isGameStarted = false               // ゲーム開始フラグをリセット
                buttonPosition = 0                  // ボタンの場所をリセット
                countPumpkinPoints = 0              // 得点をリセット
                timerManager.secondsLeft = setTime  // 残り時間をリセット
            },
            content: {
                ScoreResultsView(pumpkinPoints: self.countPumpkinPoints, path: $path)
                    .navigationBarBackButtonHidden()
            }
        )
    }
    // 難易度を設定する
    func setDifficulty() {
        // 制限時間(setTime)、表示する穴の数(showHole)、画像の種類を変更する(pumpkinImage)
        switch difficulty.num {
        case 0:
            setTime = 15
            showHole = [2, 6, 8, 10, 12, 14, 16, 18, 22]
            pumpkinImages = ["Normal_Pumpkin", "Gold_Pumpkin", "Ookawa_Pumpkin"]
        case 1:
            setTime = 10
            showHole = [2, 6, 7, 8, 10, 11, 12, 13, 14, 16, 17, 18, 22]
            pumpkinImages = ["Normal_Pumpkin", "Gold_Pumpkin", "Ookawa_Pumpkin"]
        case 2:
            setTime = 7
            showHole = Array(0...24)
            pumpkinImages = ["Normal_Pumpkin", "Gold_Pumpkin", "Ookawa_Pumpkin", "Bomb_Pumpkin", "OverworkCat_Pumpkin"]
        default:
            setTime = 1
            showHole = []
        }
        // 残り時間を設定
        timerManager.secondsLeft = setTime
    }
    
    // 画像によって点数を振り分ける
    func dividePoint(imageName: String) {
        switch imageName {
        case "Normal_Pumpkin":
            countPumpkinPoints += 1
            // print("Normal_Pumpkin. point: \(pumpkinPoints)")
        case "Gold_Pumpkin":
            countPumpkinPoints += 5
            // print("Gold_Pumpkin. point: \(pumpkinPoints)")
        case "Ookawa_Pumpkin":
            countPumpkinPoints += 10
            // print("Ookawa_Pumpkin. point: \(pumpkinPoints)")
        case "Bomb_Pumpkin":
            countPumpkinPoints -= 10
            // print("Bomb_Pumpkin. point: \(pumpkinPoints)")
        case "OverworkCat_Pumpkin":
            countPumpkinPoints -= 20
            // print("OverworkCat_Pumpkin. point: \(pumpkinPoints)")
        default:
            countPumpkinPoints = 0
        }
    }
}

// FIXME: (path: .constant([]))はデバッグ用です。'Difficulty.swift'の値を変更するとプレビューの難易度を変更できます
struct GameFieldView_Previews: PreviewProvider {
    static var previews: some View {
        GameFieldView(path: .constant([]))
    }
}
