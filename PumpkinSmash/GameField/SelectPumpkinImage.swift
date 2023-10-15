//
//  SelectPumpkinImage.swift
//  PumpkinSmash
//
//  Created by cranoo3 on 2023/10/13.
//

import Foundation

struct SelectPumpkinImage {
    // ゲームの難易度
    var difficulty: Int = 0
    
    // かぼちゃ画像の配列
    // 難易度によって表示されるかぼちゃの画像が変化する
    var pumpkinImage: [String] {
        switch difficulty {
        case 0:
            return ["Normal_Pumpkin", "Gold_Pumpkin", "Ookawa_Pumpkin"]
        case 1:
            return ["Normal_Pumpkin", "Gold_Pumpkin", "Ookawa_Pumpkin"]
        case 2:
            return ["Normal_Pumpkin", "Gold_Pumpkin", "Ookawa_Pumpkin", "Bomb_Pumpkin", "OverworkCat_Pumpkin"]
        default:
            return []
        }
    }
    
    // 画像をランダムに返す
    func randomSelect() -> String {
        return pumpkinImage.shuffled()[0]
    }
}
