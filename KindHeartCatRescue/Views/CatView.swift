//
//  CatView.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/22/22.
//

import SwiftUI

struct CatView: View {

    @EnvironmentObject var favorites: Favorites
    var cat: CatModel
    @State var isFavorite: Bool = false
    var modelView: ModelView = ModelView()

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                URLImage(url: cat.url, w: 160, h: 160)

                Button(action: {
                    if self.favorites.contains(self.cat) {
                        self.favorites.remove(self.cat)
                    } else {
                        self.favorites.add(cat: self.cat)
                    }
                }) {
                     Image(systemName: favorites.contains(cat) ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .padding()
                }
            }
            HStack {
                Text(cat.age)
                    .frame(width: 70, height: 22)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.red)
                    .background(Color("lighterred"))
                    .cornerRadius(10)
                    .padding(10)
                Spacer()
                Image(systemName: cat.gender == "female" ?  "f.circle.fill" : "m.circle.fill")
                .foregroundColor(.red)
                .symbolRenderingMode(.hierarchical)
            }
            VStack() {
                Text(cat.name)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.black)
                Text(modelView.getBreedName(breedAbrevation: cat.breed))
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(4)
        }
        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lighterred"), lineWidth: 0.5))
        .padding(.leading)
        .padding(.trailing)
    }

}


