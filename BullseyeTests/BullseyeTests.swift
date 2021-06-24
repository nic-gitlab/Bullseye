//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Nic Rowe on 6/24/21.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        game = Game()

    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScoreWithinFourPositive() {
        let guess = game.target + 4
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 50)
    }

    func testScoreWithinFourNegative() {
        let guess = game.target - 4
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 50)
    }

}
