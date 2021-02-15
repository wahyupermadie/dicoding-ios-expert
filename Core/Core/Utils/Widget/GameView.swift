//
//  GameView.swift
//  Core
//
//  Created by Wahyu Permadi on 15/02/21.
//

import SwiftUI

public struct GameView: View {
    private let game: GameModel
    public init(game: GameModel) {
        self.game = game
    }
    public var body: some View {
        HStack {
            ImageView(url: self.game.backgroundImage)
                .clipped()
                .frame(width: 85, height: 85)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(game.name)
                    .font(.title)
                    .foregroundColor(.black)
                Text(game.genres)
                    .foregroundColor(.gray)
            }
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                alignment: .topLeading
        ).padding([.leading, .trailing], 16)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: GameModel(
            id: 1234,
            name: "Wahyu",
            genres: "Action, Horor"
        ))
    }
}
