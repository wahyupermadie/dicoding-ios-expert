//
//  DetailGameView.swift
//  Detail
//
//  Created by Wahyu Permadi on 16/02/21.
//

import SwiftUI

import SwiftUI
import Resolver
import Core

struct DetailGameView: View {
    @ObservedObject var viewModel: DetailViewModel
    let gameId: Int
    init(gameId: Int, viewModel: DetailViewModel) {
        self.gameId = gameId
        self.viewModel = viewModel
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                if self.viewModel.loadingState {
                    LoadingView()
                } else {
                    VStack(alignment: .leading) {
                        ImageView(url: self.viewModel.game?.backgroundImage ?? "")
                            .frame(height: 180)
                            .clipped()
                            .scaledToFill()
                        Text(viewModel.game?.name ?? "")
                            .fontWeight(.bold)
                            .font(.system(size: 24))
                            .padding([.leading, .trailing], 8)
                        Divider().background(Color.black)
                        HStack(alignment: .center, spacing: 16) {
                            Spacer()
                            VStack {
                                Text("Rating")
                                Text("\(String(format: "%.1f", viewModel.game?.rating ?? 0.0))")
                            }.frame(minWidth: 0, maxWidth: .infinity)
                            Divider().frame(height: 25).background(Color.black)
                            VStack {
                                Text("Duration")
                                Text("\(viewModel.game?.playtime ?? 0) min")
                            }.frame(minWidth: 0, maxWidth: .infinity)
                            Spacer()
                        }
                        Divider().background(Color.black)
                        Spacer()
                        if viewModel.game?.description.count ?? 0 != 0 {
                            Text(viewModel.game?.description ?? "").font(.system(size: 14))
                                .padding([.leading, .trailing], 8)
                        } else {
                            Text("Tidak ada deskripsi").font(.system(size: 14))
                                .padding([.leading, .trailing], 8)
                        }
                        Divider().background(Color.black)
                        if viewModel.game?.gameClip != nil {
                            Text("Short Clip")
                                .fontWeight(.bold)
                                .padding(.leading, 8)
                                .font(.system(size: 18))
                            VideoView(videoURL: URL(string: viewModel.game?.gameClip ?? "")!, previewLength: 60)
                                .cornerRadius(15)
                                .frame(width: nil, height: 200, alignment: .center)
                                .shadow(color: Color.black.opacity(0.5), radius: 30, x: 0, y: 2)
                                .padding(.horizontal, 8)
                                .padding(.top, 4)
                        }
                    }
                }
            }.onAppear(perform: {
                self.viewModel.getDetailGame(gameId: self.gameId)
            }).navigationBarTitle(
                Text("Detail Game"),
                displayMode: .inline
            ).navigationBarItems(trailing:
                Button(action: {
                    if viewModel.isFavorite {
                        self.viewModel.setFavorite(id: self.gameId, isFavorite: false)
                    } else {
                        self.viewModel.setFavorite(id: self.gameId, isFavorite: true)
                    }
                }) {
                    if self.viewModel.isFavorite {
                        Image.icFavoriteFilled
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    } else {
                        Image.icFavorite
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
            )
        }
    }
}

struct DetailGameView_Previews: PreviewProvider {
    static var previews: some View {
        DetailGameView(gameId: 123, viewModel: Resolver.resolve())
    }
}
