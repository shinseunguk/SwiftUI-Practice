//
//  MapView38.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/23/24.
//

import Foundation
import MapKit
import SwiftUI

struct MapView38: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    @Binding var showsUserLocation: Bool
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.region = region
        uiView.showsUserLocation = showsUserLocation
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView38
        
        init(_ parent: MapView38) {
            self.parent = parent
        }
    }
}
