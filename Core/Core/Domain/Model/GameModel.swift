//
//  GameModel.swift
//  Core
//
//  Created by Wahyu Permadi on 14/02/21.
//

public struct GameModel {
    public var id: Int
    public var name: String
    public var released: Date? = nil
    public var backgroundImage: String = ""
    public var rating: Double = 0.0
    public var description: String = ""
    public var playtime: Int = 0
    public var genres: String = ""
    public var gameClip: String = ""
    public var isFavorite: Bool = false
}
