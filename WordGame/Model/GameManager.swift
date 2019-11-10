//
//  GameManager.swift
//  WordGame
//
//  Created by Andrei Konstantinov on 02/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

final class GameManager {

  private let wordsLoader: WordsLoaderType = WordsLoader()
  private let maxScore = 3
  private(set) var words = [WordPair]()
  private(set) var currentChallenge: WordChallenge?
  private(set) var score = 0

  init() {
    words = wordsLoader.loadWords()
  }

}

// MARK: - GameManagerType

extension GameManager: GameManagerType {

  func nextChallenge() -> WordChallenge? {
    guard let wordPair = words.randomElement(),
      let randomPair = words.randomElement()
      else { return nil }
    var variants = [String]()

    variants.append(randomPair.textSpa)
    variants.append(wordPair.textSpa)
    variants.shuffle()

    guard let variant = variants.randomElement() else { return nil }

    let challenge = WordChallenge(
      original: wordPair.textEng,
      translation: wordPair.textSpa,
      variant: variant
    )

    currentChallenge = challenge

    return challenge
  }

  func acceptCurrentChallenge() -> Int {
    return check(challenge: currentChallenge, accept: true)
  }

  func declineCurrentChallenge() -> Int {
    return check(challenge: currentChallenge, accept: false)
  }

  func isGameOver() -> Bool {
    return score >= maxScore
  }

}

// MARK: - Private

private extension GameManager {

  func check(challenge: WordChallenge?, accept: Bool) -> Int {
    guard let challenge = challenge else { return 0 }
    let isGaveRightAccept = accept == true && challenge.translation == challenge.variant
    let isGaveRightDecline = accept == false && challenge.translation != challenge.variant
    let isRightAnswer = isGaveRightAccept || isGaveRightDecline
    score = isRightAnswer ? score + 1 : score
    return score
  }

}
