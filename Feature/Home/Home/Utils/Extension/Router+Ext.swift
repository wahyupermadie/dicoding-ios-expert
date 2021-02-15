//
//  Router+Ext.swift
//  Home
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Core
import SwiftUI
import Resolver

public extension Router {
    func registerHomeRouter() {
        self.routerToHome = {
            AnyView(HomeView(viewModel: Resolver.resolve()))
        }
    }
}
