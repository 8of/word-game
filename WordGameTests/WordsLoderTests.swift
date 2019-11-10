//
//  WordsLoderTests.swift
//  WordGameTests
//
//  Created by Andrei Konstantinov on 02/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import XCTest

@testable import WordGame

final class WordsLoderTests: XCTestCase {

  func testLoadWords() {
    let words = WordsLoader().loadWords()
    XCTAssertTrue(words.count > 0)
  }

}

