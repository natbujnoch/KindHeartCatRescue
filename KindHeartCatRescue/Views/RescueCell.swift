//
//  RescueCell.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/23/22.
//

import SwiftUI

struct RescueCell: View {

    var location: LocationModel

    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                    .padding(1)
                Text(location.address)
                    .font(.subheadline)
                    .padding(1)
            }
            .foregroundColor(location.isInNetwork ? .black : Color("lighterred"))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}

