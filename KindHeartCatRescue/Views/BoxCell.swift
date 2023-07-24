//
//  BoxCell.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/22/22.
//

import SwiftUI

struct BoxCell: View {

    let heading: String
    let subheading: String
    
    var body: some View {
        VStack {
            Text(heading)
                .font(.system(size: 14, weight: .regular))
            Text(subheading)
                .font(.system(size: 16, weight: .medium))
        }
        .padding()
        .foregroundColor(.black)
        .frame(width: 110, height: 65, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lightred"), style: StrokeStyle(dash: [20,5])))
    }
}

