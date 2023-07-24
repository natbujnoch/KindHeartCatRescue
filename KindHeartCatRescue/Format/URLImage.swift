//
//  URLImage.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/22/22.
//

import SwiftUI

struct URLImage: View {

    let url: String
    let w: CGFloat?
    let h: CGFloat?
    @State var data: Data?

    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: w, height: h)
                .cornerRadius(15)
        } else {
            Image("")
                .resizable()
                .frame(width: w, height: h)
                .cornerRadius(15)
                .onAppear() {
                    fetchData()
                }
        }
    }

    private func fetchData() {
        guard let url = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }

}
