//
//  LocalGameEntity.swift
//  Core
//
//  Created by Wahyu Permadi on 14/02/21.
//

import Foundation
import RealmSwift

class LocalGameEntity: Object {

    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var backgroundImage: String? = ""
    @objc dynamic var playTime: Int = 0
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var desc: String = ""
    @objc dynamic var released: Date? = nil
    @objc dynamic var isFavorite: Bool = false
    @objc dynamic var genres: String = ""
    @objc dynamic var gameClip: String = ""
    override static func primaryKey() -> String? {
        return "id"
    }
 
}
