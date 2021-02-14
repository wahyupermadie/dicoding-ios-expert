//
//  Object+Mapper.swift
//  Core
//
//  Created by Wahyu Permadi on 14/02/21.
//

import Foundation
import RealmSwift

extension Array where Element == Game {
    func mapToModel() -> [GameModel] {
        self.map { (game) in
            return GameModel(
                id: game.gameId ?? 0,
                name: game.name ?? "",
                released: game.released,
                backgroundImage: game.backgroundImage ?? "",
                rating: game.rating ?? 0.0,
                description: game.description ?? "",
                playtime: game.playtime ?? 0,
                genres: game.getGenres(),
                gameClip: game.clip?.clip ?? ""
            )
        }
    }
}

extension GameResponse {
    func mapToModel() -> [GameModel] {
        self.results.map { (game) in
            return GameModel(
                id: game.gameId ?? 0,
                name: game.name ?? "",
                released: game.released,
                backgroundImage: game.backgroundImage ?? "",
                rating: game.rating ?? 0.0,
                description: game.description ?? "",
                playtime: game.playtime ?? 0,
                genres: game.getGenres(),
                gameClip: game.clip?.clip ?? ""
            )
        }
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array: [T] = []
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
}

extension Game {
    func getGenres() -> String {
        guard let genres = self.genres else { return ""}
        return genres.map { $0.name ?? "" }.joined(separator: ", ")
    }
}

extension LocalGameEntity {
    func convertObjectToModel() -> GameModel {
        return GameModel(
            id: self.id,
            name: self.name,
            released: self.released,
            backgroundImage: self.backgroundImage!,
            rating: self.rating,
            description: self.desc,
            playtime: self.playTime,
            genres: self.genres,
            gameClip: self.gameClip,
            isFavorite: self.isFavorite
        )
    }
}

extension Array where Element == LocalGameEntity {
    func mapToModel() -> [GameModel] {
        self.map { (game) in
            return GameModel(
                id: game.id,
                name: game.name,
                released: game.released,
                backgroundImage: game.backgroundImage!,
                rating: game.rating,
                description: game.desc,
                playtime: game.playTime,
                genres: game.genres,
                gameClip: game.gameClip,
                isFavorite: game.isFavorite
            )
        }
    }
}
