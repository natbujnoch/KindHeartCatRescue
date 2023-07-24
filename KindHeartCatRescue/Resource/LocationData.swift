//
//  LocationData.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/23/22.
//

import Foundation
import CoreLocation

class LocationData {
    static let rescues: [LocationModel] = [
        LocationModel(id: 1, name: "Kind Heart Cat Rescue", city: "Richardson", address: "800 W Campbell Rd, Richardson, TX 75080", coordinate: CLLocationCoordinate2D(latitude: 32.9857,longitude: -96.7502), isInNetwork: true), LocationModel(id: 2, name: "Cat Friends Rescue", city: "Dallas" ,address: "16600 Hillcrest Rd, Dallas, TX 75248", coordinate: CLLocationCoordinate2D(latitude: 32.98118,longitude: -96.78677), isInNetwork: false), LocationModel(id: 3, name: "Cat Rescue of Dallas", city: "Plano" , address: "1900 W 15th St, Plano, TX 75075", coordinate: CLLocationCoordinate2D(latitude: 32.02207,longitude: -96.73127), isInNetwork: false), LocationModel(id: 4, name: "Kitty Guard Rescue of Dallas", city: "Plano", address: "701 Taylor Dr, Plano, TX 75074", coordinate: CLLocationCoordinate2D(latitude: 33.01237,longitude: -96.70382), isInNetwork: false), LocationModel(id: 5, name: "Cat Heart Friends Adoption Center", city: "Richardson", address: "1301 W Belt Line Rd, Richardson, TX 75080", coordinate: CLLocationCoordinate2D(latitude: 32.95101,longitude: -96.76607), isInNetwork: false)]
}

