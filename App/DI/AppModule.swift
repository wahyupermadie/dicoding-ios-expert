//
//  AppModule.swift
//  App
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Resolver
import Core
import Home

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        self.registerCoreModule()
        self.registerHomeModule()
        self.registerFavoriteModule()
        self.registerDetailModule()
    }
}
