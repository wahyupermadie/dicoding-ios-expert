//
//  HomeUseCase.swift
//  Home
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Combine
import Core

protocol HomeUseCase {
    func getGames(keywords: String?) -> AnyPublisher<[GameModel], Error>
}

internal class HomeUseCaseImpl: HomeUseCase {
    private let homeRepository: HomeRepository
    init(homeRepos: HomeRepository) {
        self.homeRepository = homeRepos
    }
    func getGames(keywords: String?) -> AnyPublisher<[GameModel], Error> {
        return self.homeRepository.getGames(keywords: keywords)
    }
}
