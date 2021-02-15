//
//  FavoriteRepository.swift
//  Favorite
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Core
import Combine

protocol FavoriteRepository {
    func getFavorite() -> AnyPublisher<[GameModel], Error>
}
internal class FavoriteRepositoryimpl: FavoriteRepository {
    private let localDS: LocalDataSource
    init(localDS: LocalDataSource) {
        self.localDS = localDS
    }
    func getFavorite() -> AnyPublisher<[GameModel], Error> {
        return self.localDS.getFavorites()
            .map {
                $0.mapToModel()
            }.eraseToAnyPublisher()
    }
}
