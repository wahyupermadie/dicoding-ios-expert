//
//  Date+Ext.swift
//  Core
//
//  Created by Wahyu Permadi on 14/02/21.
//

import Foundation

extension Date {
    func convertToString(format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
