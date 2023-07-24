//
//  CatText.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/22/22.
//

import Foundation
import SwiftUI

let fontStr = "AppleSDGothicNeo"

extension Text {

    func customPhotoTitle() -> some View {
        self.font(.system(size: 24).bold())
    }

    func customPhotoSubtitle() -> some View {
        self.font(.system(size: 22).italic())
    }

    func customPhotoBody() -> some View {
        self.font(.system(size: 20))
    }

    func customPhotoCell() -> some View {
        self.font(.system(size: 18))
    }
}
