//
//  HomeRepository.swift
//  Home
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Combine
import Alamofire
import Core

protocol HomeDataSource {
    func getGames(keyword: String?) -> AnyPublisher<GameResponse, Error>?
}

internal class HomeDataSourceImpl: HomeDataSource {
    func getGames(keyword: String?) -> AnyPublisher<GameResponse, Error>? {
        guard let url = URL(string: "\(BASE_URL)games") else {
            return nil
        }
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        if keyword != nil {
            let queryItems = [URLQueryItem(name: "search", value: keyword)]
            urlComponents.queryItems = queryItems
        }
        return Future<GameResponse, Error> { completion in
            if let finalUrl = urlComponents.url {
                AF.request(finalUrl)
                    .validate()
                    .responseDecodable(of: GameResponse.self) { response in
                        switch response.result {
                            case .success(let data):
                                completion(.success(data))
                            case .failure(let error):
                                completion(.failure(error))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}
