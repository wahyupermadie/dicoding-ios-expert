//
//  CoreModule.swift
//  Core
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import Resolver
import RealmSwift

extension Resolver {
    public static func registerCoreModule() {
        register {
            LocalDataSourceImpl(realm: try? Realm()) as LocalDataSource
        }
    }
}
