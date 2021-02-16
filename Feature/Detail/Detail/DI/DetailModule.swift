//
//  DetailModule.swift
//  Detail
//
//  Created by Wahyu Permadi on 16/02/21.
//

import Foundation
import Core
import Resolver

public extension Resolver {
    static func registerDetailModule() {
        register {
            DetailRepositoryImpl(localDS: resolve()) as DetailRepository
        }
        register {
            DetailUseCaseImpl(detailRepo: resolve()) as DetailUseCase
        }
        register {
            DetailViewModel(detailUC: resolve())
        }
    }
}
