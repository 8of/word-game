//
//  WordsLoader.swift
//  WordGame
//
//  Created by Andrei Konstantinov on 02/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

final class WordsLoader {}

// MARK: - WordsLoaderType

extension WordsLoader: WordsLoaderType {

  func loadWords() -> [WordPair] {
    guard let path = Bundle.main.path(forResource: "words", ofType: "json") else { return [] }
    do {
      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
      let decoder = JSONDecoder()
      let pairs = try decoder.decode([WordPair].self, from: data)
      return pairs
    } catch {
      print(error.localizedDescription)
    }
    return []
  }

}
