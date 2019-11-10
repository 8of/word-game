//
//  WordPair.swift
//  WordGame
//
//  Created by Andrei Konstantinov on 02/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

struct WordPair {
  let textEng: String
  let textSpa: String
}

extension WordPair: Codable {

  private enum CodingKeys : String, CodingKey {
    case textEng = "text_eng", textSpa = "text_spa"
  }

}
