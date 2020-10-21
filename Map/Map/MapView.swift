//
//  MapView.swift
//  Map
//
//  Created by Nitin Bhatt on 10/21/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  
  var locationManager = CLLocationManager()
    
  func setupManager() {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestAlwaysAuthorization()
  }
  
  func makeUIView(context: Context) -> MKMapView {
    setupManager()
    let map = MKMapView(frame: UIScreen.main.bounds)
    map.showsUserLocation = true
    map.userTrackingMode = .follow
    return map
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
  }
}

final class Coordinates: NSObject, MKAnnotation {
  let title: String?
  let coordinate: CLLocationCoordinate2D

  init(title: String?, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.coordinate = coordinate
  }
}

struct MapViewWithCoordinates: UIViewRepresentable {
  @Binding var coordiantes: [Coordinates]

  func makeUIView(context: Context) -> MKMapView {
       MKMapView()
  }

  func updateUIView(_ uiView: MKMapView, context: Context) {
    uiView.addAnnotations(coordiantes)
  }
}
