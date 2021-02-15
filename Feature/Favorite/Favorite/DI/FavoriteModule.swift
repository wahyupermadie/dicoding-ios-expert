//
//  FavoriteModule.swift
//  Favorite
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Core
import Resolver

extension Resolver {
    public static func registerFavoriteModule() {
        register {
            FavoriteRepositoryimpl(localDS: resolve()) as FavoriteRepository
        }
        register {
            FavoriteUseCaseImpl(repository: resolve()) as FavoriteUseCase
        }
        register {
            FavoriteViewModel(useCase: resolve())
        }
    }
}
