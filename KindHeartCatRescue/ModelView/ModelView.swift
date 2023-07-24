//
//  BreedNames.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/23/22.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI
import Firebase
import UIKit


class ModelView: ObservableObject {

    @Published var rescues: [LocationModel]
    @Published var mapLocation: LocationModel {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList: Bool = false
    
    init() {
        let rescues = LocationData.rescues
        self.rescues = rescues
        self.mapLocation = rescues.first!
        self.updateMapRegion(location: rescues.first!)
    }
    
    private func updateMapRegion(location: LocationModel) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinate, span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func isValidPhone(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    func getBreedName(breedAbrevation: String) -> String {
        
        switch breedAbrevation {
        case "abys": return  "Abyssian"
        case "aege": return  "Aegean"
        case "abob": return  "American Bobtail"
        case "acur": return  "American Curl"
        case "asho": return  "American Shorthair"
        case "awir": return  "American Wirehair"
        case "amau": return  "American Mau"
        case "amis": return  "Australian Mist"
        case "bali": return  "Balinese"
        case "bamb": return  "Bambino"
        case "beng": return  "Bengal"
        case "birm": return  "Birman"
        case "bomb": return  "Bombay"
        case "bslo": return  "British Longhair"
        case "bsho": return  "British Shorthair"
        case "bure": return  "Burmese"
        case "buri": return  "Burmilla"
        case "cspa": return  "California Spangled"
        case "ctif": return  "Chantilly-Tiffany"
        case "char": return  "Chartreux"
        case "chau": return  "Chausie"
        case "chee": return  "Cheetoh"
        case "csho": return  "Colorpoint Shorthair"
        case "crex": return  "Cornish Rex"
        case "cymr": return  "Cymric"
        case "cypr": return  "Cyprus"
        case "drex": return  "Devon Rex"
        case "dons": return  "Donskoy"
        case "lihu": return  "Dragon li"
        case "emau": return  "Egyptian mau"
        case "ebur": return  "European burmese"
        case "esho": return  "Exotic Shorthair"
        case "hbro": return  "Havana Brown"
        case "hima": return  "Himalayan"
        case "jbob": return  "Japanese Shorthair"
        case "khao": return  "Khao Manee"
        case "kora": return  "Korat"
        case "kuri": return  "Kurilian"
        case "mcoo": return  "Maine Coon"
        case "mala": return  "Malayan"
        case "muni": return  "Munchkin"
        case "nebe": return  "Nebelung"
        case "norw": return  "Norwegian Forest Cat"
        case "ocic": return  "Ocicat"
        case "orie": return  "Oriental"
        case "pers": return  "Persian"
        case "pixi": return  "Pixie-bob"
        case "raga": return  "Ragamuffin"
        case "ragd": return  "Ragdoll"
        case "rblu": return  "Russian Blue"
        case "sava": return  "Savannah"
        case "sfol": return  "Scottish Fold"
        case "srex": return  "Selkirk Rex"
        case "siam": return  "Siamese"
        case "side": return  "Siberian"
        case "sing": return  "Singapura"
        case "snow": return  "Snowshoe"
        case "soma": return  "Somali"
        case "sphy": return  "Sphynx"
        case "tonk": return  "Tontines"
        case "toyg": return  "Toyger"
        case "tvan": return  "Turkish"
        case "ycho": return  "York Chocolate"
        default: return "None"
        }
    }

}

