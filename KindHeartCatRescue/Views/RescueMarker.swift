//
//  RescueMarker.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/23/22.
//

import SwiftUI

struct RescueMarker: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .symbolRenderingMode(.hierarchical)
                .frame(width: 30, height: 30)
                .padding(.bottom, 45)
        }

    }
}

struct RescueMarker_Previews: PreviewProvider {
    static var previews: some View {
        RescueMarker()
    }
}
