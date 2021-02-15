//
//  FavoriteViewModel.swift
//  Favorite
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Core
import Combine

class FavoriteViewModel: ObservableObject {
    private var cancelable: Set<AnyCancellable> = []
    private let useCase: FavoriteUseCase
    @Published var loadingState: Bool = false
    @Published var errorMessage: String = ""
    @Published var games: [GameModel] = []
    init(useCase: FavoriteUseCase) {
        self.useCase = useCase
    }
    func getFavorite() {
        self.loadingState = true
        self.useCase.getFavorite()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    self.loadingState = false
                }
            } receiveValue: { (data) in
                self.games = data
            }.store(in: &cancelable)

    }
}
