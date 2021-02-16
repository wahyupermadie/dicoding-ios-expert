//
//  Router.swift
//  Core
//
//  Created by Wahyu Permadi on 14/02/21.
//

import Foundation
import SwiftUI

public class Router {

    public static var router = Router()

    public var routerToHome: (() -> AnyView)?
    public func navigateToHome() -> AnyView? {
        return self.routerToHome?()
    }
    public var routerToFavorite: (() -> AnyView)?
    public func navigateToFavorite() -> AnyView? {
        return self.routerToFavorite?()
    }
    public var routerToGameDetail: ((_ gameId: Int) -> AnyView)?
    public func navigateToGameDetail(_ gameId: Int) -> AnyView? {
        return self.routerToGameDetail?(gameId)
    }
}
