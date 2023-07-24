//
//  CatDetail.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/22/22.
//

import SwiftUI

struct CatDetail: View {

    @EnvironmentObject var favorites: Favorites
    var cat: CatModel
    @StateObject var apiData = APIData()
    @State var isFavorite: Bool = false
    @State private var showingAdopt = false
    var modelView: ModelView = ModelView()

    private var _trailingView: some View {
        Image(systemName: favorites.contains(cat) ? "heart.fill" : "heart")
            .foregroundColor(.red)
            .frame(width: 36, height: 36)
            .background(.white)
            .cornerRadius(18)
            .onTapGesture {
                if self.favorites.contains(self.cat) {
                    self.favorites.remove(self.cat)
                } else {
                    self.favorites.add(cat: self.cat)
                }
            }
    }
    
    var body: some View {
        ScrollView {
            VStack() {
                ScrollView(.vertical, showsIndicators: true) {
                    URLImage(url: cat.url, w: 300, h: 300)
                        .offset(y: -15)
                        .padding()
                    HStack(spacing: 20) {
                        BoxCell(heading: "Age", subheading: cat.age)
                        BoxCell(heading: "Sex", subheading: cat.gender)
                        BoxCell(heading: cat.gender == "female" ? "Spayed?" : "Neutered?", subheading: cat.spayedOrNeutered)
                    }
                    .padding(.top, 10)

                    HStack {
                        Text(cat.name)
                            .font(.system(size: 18, weight: .medium))
                        Spacer()
                        Text(modelView.getBreedName(breedAbrevation: cat.breed))
                            .font(.system(size: 18, weight: .regular))
                    }
                    .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)

                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.red)
                            .symbolRenderingMode(.hierarchical)
                        Text("Kind Heart Cat Rescue, US")
                            .font(.system(size: 14))
                            .foregroundColor(Color("lightred"))
                        Spacer()
                    }
                    .padding(.top, 1)
                    .padding(.leading)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("About")
                            .font(.system(size: 18, weight: .medium))
                        Text(cat.description)
                            .font(.system(size: 16, weight: .regular))
                            .lineSpacing(0.5)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack {
                    Button(action: {
                        showingAdopt.toggle()
                    }) {
                        HStack {
                            Image("cat.white")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Adopt")
                                .font(.system(size: 18, weight: .medium))
                        }
                        .padding(14)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(15)
                    }
                    .sheet(isPresented: $showingAdopt) {
                        AdoptionView()
                    }
                }
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
                .edgesIgnoringSafeArea(.top)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: _trailingView)
                .padding()
            }
        }
    }
}

