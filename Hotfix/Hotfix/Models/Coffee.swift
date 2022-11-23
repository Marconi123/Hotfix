//
//  Coffee.swift
//  Hotfix
//
//  Created by Владислав on 16.11.22.
//

import Foundation
import Firebase

struct Coffee {
    let photoURL: String
    let name: String
    let price: String
    let description: String
    let ref: DatabaseReference!
    
    init(photoURL: String, name: String, price: String, description: String, ref: DatabaseReference!) {
        self.photoURL = photoURL
        self.name = name
        self.price = price
        self.description = description
        self.ref = nil
    }
    
    init?(snapshot: DataSnapshot) {
        guard let snapshotValue = snapshot.value as? [String: Any],
              let photoURL = snapshotValue[Constants.photoURLkey] as? String,
              let name = snapshotValue[Constants.nameKey] as? String,
              let price = snapshotValue[Constants.priceKey] as? String,
              let description = snapshotValue[Constants.descriptionKey] as? String else { return nil }
        self.photoURL = photoURL
        self.name = name
        self.price = price
        self.description = description
        ref = snapshot.ref
    }

    func convertToDictionary() -> [String: Any] {
        [Constants.photoURLkey: photoURL, Constants.nameKey: name, Constants.descriptionKey: description, Constants.priceKey: price]
    }

    // MARK: Private

    private enum Constants {
        static let photoURLkey = "photoURL"
        static let nameKey = "name"
        static let descriptionKey = "description"
        static let priceKey = "price"
    }
}
