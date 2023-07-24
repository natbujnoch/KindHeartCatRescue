//
//  AdoptionView.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/19/22.
//

import SwiftUI

struct RescueView: View {
    
    @ObservedObject var favorites = Favorites()
    @StateObject var apiData = APIData()
    @State private var searchText = ""

    var filteredCats: [CatModel] {
        if searchText.isEmpty {
            return apiData.cats
        } else {
            return apiData.cats.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(filteredCats) {
                            cat in
                            NavigationLink {
                                CatDetail(cat: cat)
                            } label: {
                                CatView(cat: cat)
                            }
                        }
                        Spacer()
                    }
                }
            }
            .searchable(text: $searchText, prompt: "search for a new friend")
        }
        .onAppear() {
            apiData.fetchCats()
            print(apiData.cats)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Kind Heart Animal Rescue")
        .navigationBarTitleDisplayMode(.inline)
        .environmentObject(favorites)
    }

}

