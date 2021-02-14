//
//  ErrorState.swift
//  Core
//
//  Created by Wahyu Permadi on 14/02/21.
//

import Foundation

enum DatabaseError: LocalizedError {
    case requestFailed
    case invalidInstance

    var errorDescription: String? {
        switch self {
        case .requestFailed:
            return "Request failed"
        case .invalidInstance:
            return "Invalid database instance"
        }
    }
}
