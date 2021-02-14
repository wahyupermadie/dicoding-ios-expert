//
//  GameResponse.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation

// MARK: - Games
public struct GameResponse: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Game] = []
}

enum Language: String, Codable {
    case eng = "eng"
}
