//
//  DetailViewModel.swift
//  Detail
//
//  Created by Wahyu Permadi on 16/02/21.
//

import Foundation
import Combine
import Core

class DetailViewModel: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    @Published var loadingState: Bool = false
    @Published var errorMessage: String = ""
    @Published var game: GameModel? = nil
    @Published var isFavorite: Bool = false
    private let detailUseCase: DetailUseCase
    init(detailUC: DetailUseCase) {
        self.detailUseCase = detailUC
    }
    func setFavorite(id: Int, isFavorite: Bool) {
        detailUseCase.setFavorite(id: id, isFavorite: isFavorite)
            .receive(on: RunLoop.main)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("finished")
                }
            } receiveValue: { (result) in
                if result == true && isFavorite == true {
                    self.isFavorite = true
                } else if result == true && isFavorite == false {
                    self.isFavorite = false
                }
            }.store(in: &cancellables)

    }
    func getDetailGame(gameId: Int) {
        self.loadingState = true
        detailUseCase.getDetailGame(gameId: gameId)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    case .finished:
                        self.loadingState = false
                }
            } receiveValue: { game in
                self.isFavorite = game.isFavorite
                self.game = game
            }.store(in: &cancellables)

    }
}
