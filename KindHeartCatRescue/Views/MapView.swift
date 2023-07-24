//
//  RescueMapView.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/19/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject private var modelView: ModelView
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $modelView.mapRegion, annotationItems: modelView.rescues, annotationContent: { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        RescueMarker()
                            .shadow(radius: 10)
                            .scaleEffect(modelView.mapLocation == location ? 1 : 0.7)
                    }
                })
                .ignoresSafeArea()
                VStack(spacing: 0) {
                    VStack {
                        Button(action: modelView.toggleLocationsList) {
                            Text(modelView.mapLocation.name + ", " + modelView.mapLocation.city)
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.red)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .overlay(alignment: .leading) {
                                    Image(systemName: "arrow.down")
                                        .font(.headline)
                                        .foregroundColor(.red)
                                        .padding()
                                        .rotationEffect(Angle(degrees: modelView.showLocationsList ? 180 : 0))
                                }
                        }
                        if modelView.showLocationsList {
                            List {
                                ForEach(modelView.rescues) { location in
                                    if location.isInNetwork {
                                        NavigationLink {
                                            RescueView()
                                        } label: {
                                            RescueCell(location: location)
                                        }
                                    } else {
                                        RescueCell(location: location)
                                    }
                                }
                            }
                            .listStyle(PlainListStyle())                    }
                    }
                    .background(.thickMaterial)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
                    .padding()
                    Spacer()
                }
            }
            .navigationTitle("Select Rescue in Network")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}
