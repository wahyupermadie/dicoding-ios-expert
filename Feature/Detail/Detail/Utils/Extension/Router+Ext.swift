//
//  Router+Ext.swift
//  Detail
//
//  Created by Wahyu Permadi on 16/02/21.
//

import Foundation
import Core
import SwiftUI
import Resolver

public extension Router {
    func registerDetailRouter() {
        self.routerToGameDetail = { gameId in
            AnyView(DetailGameView(gameId: gameId, viewModel: Resolver.resolve()))
        }
    }
}
