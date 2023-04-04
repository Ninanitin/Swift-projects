//
//  RenterView.swift
//  CarRental
//
//  Created by Nina Kamble on 3/19/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let latitude: Double
    let longitude: Double
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        view.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        view.addAnnotation(annotation)
    }
}

struct RenterView: View {
    let latitude = 37.33233141
    let longitude = -122.0312186
    
    var body: some View {
        MapView(latitude: latitude, longitude: longitude)
            .frame(height: 300)
    }
}

struct RenterView_Previews: PreviewProvider {
    static var previews: some View {
        RenterView()
    }
}

