//
//  HomeView.swift
//  Home
//
//  Created by Wahyu Permadi on 14/02/21.
//

import SwiftUI
import Core
import Resolver

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                if self.viewModel.loadingState {
                    LoadingView()
                } else {
                    if self.viewModel.games.isEmpty {
                        VStack {
                            Spacer()
                            Text("empty_game".localized(identifier: .bundleId))
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                    } else {
                        ForEach(self.viewModel.games, id: \.id) { game in
                            NavigationLink(
                                destination: Router.router.navigateToGameDetail(game.id)) {
                                GameView(game: game)
                            }
                        }
                    }
                }
            }.onAppear(perform: {
                self.viewModel.getGames(name: nil)
            }).navigationTitle("view_title".localized(identifier: .bundleId))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: Resolver.resolve())
    }
}
