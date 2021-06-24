//
//  Game.swift
//  Bullseye
//
//  Created by Nic Rowe on 6/24/21.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1

    func points(sliderValue: Int) -> Int {
        let difference = abs(sliderValue - target)
        if (sliderValue == target) {
            return 100
        } else if difference < 5 {
            return 50
        } else if difference < 10 {
            return 25
        } else {
            return 0
        }
    }
}

