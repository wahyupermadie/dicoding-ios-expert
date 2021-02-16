//
//  RouterManager.swift
//  App
//
//  Created by Wahyu Permadi on 14/02/21.
//

import Foundation
import Core
import Detail

public extension Router {
    func registerRouters() {
        self.registerFavoriteRouter()
        self.registerHomeRouter()
        self.registerDetailRouter()
    }
}
