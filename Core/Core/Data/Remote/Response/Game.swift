//
//  Game.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation

// MARK: - Result
public struct Game: Codable {
    let gameId: Int?
    let name: String?
    let released: Date?
    let backgroundImage: String?
    let rating: Double?
    var description: String?
    let playtime: Int?
    let genres: [Genre]?
    let moviesCount: Int?
    let clip: Clip?

    enum CodingKeys: String, CodingKey {
        case gameId = "id"
        case name, released
        case moviesCount = "movies_count"
        case description = "description_raw"
        case backgroundImage = "background_image"
        case rating, playtime, genres, clip
    }
        
    init(gameId: Int?, name: String?, description: String?, rating: Double?, backgroundImage: String?, released: Date?, playtime: Int?, genres: [Genre]?, clip: Clip?, movieCount: Int?) {
        self.gameId = gameId
        self.name = name
        self.description = description
        self.rating = rating
        self.backgroundImage = backgroundImage
        self.released = released
        self.playtime = playtime
        self.genres = genres
        self.clip = clip
        self.moviesCount = movieCount
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        moviesCount = try? container.decode(Int.self, forKey: .moviesCount)
        gameId = try? container.decode(Int.self, forKey: .gameId)
        name = try? container.decode(String.self, forKey: .name)
        description = try? container.decode(String.self, forKey: .description)
        released = try? container.decode(String.self, forKey: .released).convertToDate()
        backgroundImage = try? container.decode(String.self, forKey: .backgroundImage)
        rating = try? container.decode(Double.self, forKey: .rating)
        playtime = try? container.decode(Int.self, forKey: .playtime)
        genres = try? container.decode([Genre].self, forKey: .genres)
        clip = try? container.decode(Clip.self, forKey: .clip)
    }
}
