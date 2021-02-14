//
//  Genre.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name, slug: String?
    let gamesCount: Int?
    let imageBackground: String?
    let language: Language?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case language
    }
}
