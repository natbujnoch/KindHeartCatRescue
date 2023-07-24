//
//  LocationModel.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/23/22.
//

import Foundation
import CoreLocation

struct LocationModel: Identifiable, Equatable  {

    static func == (lhs: LocationModel, rhs: LocationModel) -> Bool {
        return lhs.name == rhs.name && lhs.address == rhs.address && lhs.isInNetwork == rhs.isInNetwork && lhs.city == rhs.city && lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    let city: String
    let address: String
    let coordinate: CLLocationCoordinate2D
    let isInNetwork: Bool

}
