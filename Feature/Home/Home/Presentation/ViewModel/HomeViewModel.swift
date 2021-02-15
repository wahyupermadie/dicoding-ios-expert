//
//  HomeViewModel.swift
//  Home
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Combine
import Core

class HomeViewModel: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    @Published var loadingState: Bool = false
    @Published var errorMessage: String = ""
    @Published var games: [GameModel] = []
    private let homeUseCase: HomeUseCase
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    func getGames(name: String?) {
        self.loadingState = true
        homeUseCase.getGames(keywords: name)
          .receive(on: RunLoop.main)
          .sink(receiveCompletion: { completion in
            switch completion {
            case .failure:
              self.errorMessage = String(describing: completion)
            case .finished:
              self.loadingState = false
            }
          }, receiveValue: { games in
            self.games = games
          })
          .store(in: &cancellables)
      }
}
