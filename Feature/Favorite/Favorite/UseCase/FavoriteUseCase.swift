//
//  FavoriteUseCase.swift
//  Favorite
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Core
import Combine

protocol FavoriteUseCase {
    func getFavorite() -> AnyPublisher<[GameModel], Error>
}
class FavoriteUseCaseImpl: FavoriteUseCase {
    private let repository: FavoriteRepository
    init(repository: FavoriteRepository) {
        self.repository = repository
    }
    func getFavorite() -> AnyPublisher<[GameModel], Error> {
        return self.repository.getFavorite()
    }
}
