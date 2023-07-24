//
//  CatData.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/19/22.
//

import Foundation

class APIData: ObservableObject {

    @Published var cats: [CatModel] = []

    func fetchCats() {
        guard let url = URL(string:"https://raw.githubusercontent.com/natbujnoch/KindHeartRescueAPI/gh-pages/CatData.json") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let cats = try JSONDecoder().decode([CatModel].self, from: data)
                DispatchQueue.main.async {
                    print("cats", cats)
                    self?.cats = cats
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }

}
