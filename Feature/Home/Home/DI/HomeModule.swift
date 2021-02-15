//
//  HomeModule.swift
//  Home
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Resolver

extension Resolver {
    public static func registerHomeModule() {
        register {
            HomeDataSourceImpl() as HomeDataSource
        }
        register {
            HomeRepositoryImpl(homeDS: resolve(), localDS: resolve()) as HomeRepository
        }
        register {
            HomeUseCaseImpl(homeRepos: resolve()) as HomeUseCase
        }
        register {
            HomeViewModel(homeUseCase: resolve())
        }
    }
}
