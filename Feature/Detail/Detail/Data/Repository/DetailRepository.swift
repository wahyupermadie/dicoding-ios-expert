//
//  DetailReposiory.swift
//  Detail
//
//  Created by Wahyu Permadi on 16/02/21.
//

import Foundation
import Combine
import Core

protocol DetailRepository {
    func setFavorite(id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error>
    func getDetailGame(gameId: Int) -> AnyPublisher<GameModel, Error>
}
internal class DetailRepositoryImpl: DetailRepository {
    private let localDS: LocalDataSource
    init(localDS: LocalDataSource) {
        self.localDS = localDS
    }
    func setFavorite(id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error> {
        return self.localDS.setFavorite(id: id, isFavorite: isFavorite)
    }
    func getDetailGame(gameId: Int) -> AnyPublisher<GameModel, Error> {
        return self.localDS.getDetailGame(gameId: gameId)
            .map {
                $0.convertObjectToModel()
            }.eraseToAnyPublisher()
    }
}
