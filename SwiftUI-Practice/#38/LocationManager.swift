//
//  LocationManager.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/23/24.
//

import MapKit
import UIKit

enum MapConstants {
    // default: 서울역
    static var defaultLatitude: CLLocationDegrees = 37.554555
    static var defaultLongitude: CLLocationDegrees = 126.970779
    static var latitudeDelta: CLLocationDegrees = 0.05
    static var longitudeDelta: CLLocationDegrees = 0.05
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()

    @Published var showsUserLocation: Bool = false
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: MapConstants.defaultLatitude, longitude: MapConstants.defaultLongitude),
        span: MKCoordinateSpan(latitudeDelta: MapConstants.latitudeDelta, longitudeDelta: MapConstants.longitudeDelta)
    )
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            DispatchQueue.main.async {
                self.region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                )
            }
            
            showsUserLocation = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            startUpdatingLocation()
        case .denied, .restricted:
            // Handle denied or restricted state if needed
            break
        default:
            break
        }
    }
}
