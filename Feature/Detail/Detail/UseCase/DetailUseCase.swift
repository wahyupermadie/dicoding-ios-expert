//
//  DetailUseCase.swift
//  Detail
//
//  Created by Wahyu Permadi on 16/02/21.
//

import Foundation
import Core
import Combine

protocol DetailUseCase {
    func getDetailGame(gameId: Int) -> AnyPublisher<GameModel, Error>
    func setFavorite(id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error>
}

internal class DetailUseCaseImpl : DetailUseCase {
    private let detailRepo: DetailRepository
    init(detailRepo: DetailRepository) {
        self.detailRepo = detailRepo
    }
    func getDetailGame(gameId: Int) -> AnyPublisher<GameModel, Error> {
        return self.detailRepo.getDetailGame(gameId: gameId)
    }
    
    func setFavorite(id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error> {
        return self.detailRepo.setFavorite(id: id, isFavorite: isFavorite)
    }
}
