//
//  GameModel.swift
//  Core
//
//  Created by Wahyu Permadi on 14/02/21.
//

struct GameModel {
    var id: Int
    var name: String
    var released: Date? = nil
    var backgroundImage: String = ""
    var rating: Double = 0.0
    var description: String = ""
    var playtime: Int = 0
    var genres: String = ""
    var gameClip: String = ""
    var isFavorite: Bool = false
}
