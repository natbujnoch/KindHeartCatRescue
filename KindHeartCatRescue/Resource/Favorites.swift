//
//  Favorites.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/24/22.
//

import SwiftUI
import CoreData
import Foundation

class Favorites: ObservableObject {
    
    let userFavorites = UserDefaults.standard
    private var cats: [String]
    private let saveKey = "Favorites"

    init() {
        self.cats = (UserDefaults.standard.array(forKey: saveKey) ?? []) as [String]
    }

    func contains(_ cat: CatModel) -> Bool {
        cats.contains(cat.name)
    }

    func add(cat: CatModel) {
        objectWillChange.send()
        cats.append(cat.name)
        save()
    }

    func remove(_ cat: CatModel) {
        objectWillChange.send()
        cats.remove(at: cats.firstIndex(where: {$0 == cat.name}) ?? 0)
        save()
    }

    func save() {
        userFavorites.set(cats, forKey: saveKey)
    }

}
