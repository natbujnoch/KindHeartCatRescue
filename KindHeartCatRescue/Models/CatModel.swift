//
//  CatModel.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/19/22.
//

import Foundation


struct CatModel: Codable, Hashable, Identifiable {

    let id: Int
    let breed: String
    let name: String
    let description: String
    let gender: String
    let spayedOrNeutered: String
    let age: String
    var isFavorite: Bool
    let url: String

}
