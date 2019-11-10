//
//  GameManagerType.swift
//  WordGame
//
//  Created by Andrei Konstantinov on 02/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

protocol GameManagerType {
  func nextChallenge() -> WordChallenge?
  func acceptCurrentChallenge() -> Int
  func declineCurrentChallenge() -> Int
  func isGameOver() -> Bool
}
