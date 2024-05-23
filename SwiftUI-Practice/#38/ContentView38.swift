//
//  ContentView38.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/23/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView38: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            MapView38(
                region: $locationManager.region,
                showsUserLocation: $locationManager.showsUserLocation
            )
                            .edgesIgnoringSafeArea(.all)
            
            HStack {
                VStack {
                    Button(action: {
                        locationManager.requestPermission()
                    }) {
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .overlay {
                                Image(systemName: "location.fill")
                                    .foregroundColor(.blue)
                            }
                    }
                    Spacer()
                        .frame(height: 30)
                }
                Spacer()
                    .frame(width: 10)
            }
        }
    }
}

#Preview {
    ContentView38()
}
