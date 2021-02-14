//
//  HomeRepository.swift
//  Home
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Combine
import Core
import Alamofire

protocol HomeRepository {
    func getGames(keywords: String?) -> AnyPublisher<[GameModel], Error>
}

class HomeRepositoryImpl: HomeRepository {
    
    var homeDataSource: HomeDataSource
    var localDataSource: LocalDataSource
    init(homeDS: HomeDataSource, localDS: LocalDataSource) {
        self.homeDataSource = homeDS
        self.localDataSource = localDS
    }
    func getGames(keywords: String?) -> AnyPublisher<[GameModel], Error> {
        self.localDataSource.getLocalData(query: keywords)
            .flatMap { result -> AnyPublisher<[GameModel], Error> in
                if result.isEmpty {
                    return self.homeDataSource.getGames(keyword: keywords)!
                        .map {
                            $0.mapToModel()
                        }.flatMap {
                            self.localDataSource.setLocalData(games: $0)
                        }.flatMap { _ in
                            self.localDataSource.getLocalData(query: keywords)
                        }.map {
                            $0.mapToModel()
                        }.eraseToAnyPublisher()
                } else {
                    return self.localDataSource.getLocalData(query: keywords)
                        .map {
                            $0.mapToModel()
                        }.eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
