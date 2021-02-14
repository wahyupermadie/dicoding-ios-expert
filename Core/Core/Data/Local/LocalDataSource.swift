//
//  LocalDataSource.swift
//  Core
//
//  Created by Wahyu Permadi on 14/02/21.
//

import Foundation
import RealmSwift
import Combine

protocol LocalDataSource {
    func getFavorites() -> AnyPublisher<[LocalGameEntity], Error>
    func setFavorite(id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error>
    func getLocalData(query: String?) -> AnyPublisher<[LocalGameEntity], Error>
    func setLocalData(games: [GameModel]) -> AnyPublisher<Bool, Error>
    func getDetailGame(gameId: Int) -> AnyPublisher<LocalGameEntity, Error>
}

class LocalDataSourceImpl: LocalDataSource {
    let realm: Realm?
    init(realm: Realm) {
        self.realm = realm
    }
    func getDetailGame(gameId: Int) -> AnyPublisher<LocalGameEntity, Error> {
        return Future<LocalGameEntity, Error> { completion in
            if let realm = self.realm {
                let game = realm.objects(LocalGameEntity.self).filter("id= %@", gameId).first
                if game != nil {
                    completion(.success(game!))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    func getFavorites() -> AnyPublisher<[LocalGameEntity], Error> {
        return Future<[LocalGameEntity], Error> { completion in
            if let realm = self.realm {
                let games: Results<LocalGameEntity> = {
                    realm.objects(LocalGameEntity.self).filter("isFavorite= true")
                }()
                let gamesData = games.toArray(ofType: LocalGameEntity.self)
                completion(.success(gamesData))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    func setFavorite(id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                let game = realm.objects(LocalGameEntity.self).filter("id = %@", id).first
                
                do {
                    try realm.write {
                        game?.isFavorite = isFavorite
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
                
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }

    func getLocalData(query: String?) -> AnyPublisher<[LocalGameEntity], Error> {
        return Future<[LocalGameEntity], Error> { completion in
            if let realm = self.realm {
                let games: Results<LocalGameEntity> = {
                    realm.objects(LocalGameEntity.self)
                }()
                let gamesData = games.toArray(ofType: LocalGameEntity.self)
                completion(.success(gamesData))
            } else {
                completion(.failure(DatabaseError.requestFailed))
            }
        }.eraseToAnyPublisher()
    }

    func setLocalData(games: [GameModel]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for game in games {
                            let local = LocalGameEntity()
                            local.id = game.id
                            local.name = game.name
                            local.playTime = game.playtime
                            local.backgroundImage = game.backgroundImage
                            local.released = game.released
                            local.rating = game.rating
                            local.genres = game.genres
                            local.gameClip = game.gameClip
                            local.desc = game.description
                            realm.add(local, update: .all)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
}
