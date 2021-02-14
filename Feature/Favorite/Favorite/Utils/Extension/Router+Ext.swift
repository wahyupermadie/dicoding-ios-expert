//
//  Router+Ext.swift
//  Favorite
//
//  Created by Wahyu Permadi on 14/02/21.
//

import Foundation
import SwiftUI
import Core

public extension Router {
    func registerFavoriteRouter() {
        self.routerToFavorite = {
            AnyView(FavoriteView())
        }
    }
}
