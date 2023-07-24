//
//  KindHeartCatRescueApp.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/19/22.
//

import SwiftUI

@main
struct KindHeartCatRescueApp: App {

    @StateObject private var modelView = ModelView()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelView)
        }
    }
}
