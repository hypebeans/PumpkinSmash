//
//  SelectPumpkinImage.swift
//  PumpkinSmash
//
//  Created by cranoo3 on 2023/10/13.
//

import Foundation

struct SelectPumpkinImage {
    // かぼちゃ画像の配列
    let pumpkinImage:[String] = ["Normal_Pumpkin", "Gold_Pumpkin", "Ookawa_Pumpkin", "Bomb_Pumpkin", "OverworkCat_Pumpkin"]
    
    // 画像をランダムに返す
    func randomSelect() -> String {
        return pumpkinImage.shuffled()[0]
    }
}
