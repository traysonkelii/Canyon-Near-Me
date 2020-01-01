//
//  NavigationMapView.swift
//  Canyon Project
//
//  Created by Trayson Keli'i on 12/31/19.
//  Copyright © 2019 Trayson Keli'i. All rights reserved.
//

import SwiftUI
import MapKit
import GoogleMaps

struct NavigationMapView: UIViewRepresentable {
    let marker : GMSMarker = GMSMarker()
    var coordinates: [Double]
    var trailName: String
    /// Creates a `UIView` instance to be presented.
    func makeUIView(context: Self.Context) -> GMSMapView {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: coordinates[1], longitude: coordinates[0], zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)

        return mapView
    }

    /// Updates the presented `UIView` (and coordinator) to the latest
    /// configuration.
    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
        // Creates a marker in the center of the map.
        marker.position = CLLocationCoordinate2D(latitude: coordinates[1], longitude: coordinates[0])
        marker.title = trailName
        marker.map = mapView
    }

}

//struct NavigationMapView: UIViewRepresentable {
//
//    var sourceCoordinate: [Double]
//    var destinationCoordinate: [Double]
//
//    func makeCoordinator() -> NavigationMapView.Coordinator {
//        NavigationMapView.Coordinator()
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<NavigationMapView>) -> MKMapView {
//
//        let map = MKMapView()
//        let source = CLLocationCoordinate2D(latitude: sourceCoordinate[1], longitude: sourceCoordinate[0])
//        let destination = CLLocationCoordinate2D(latitude: destinationCoordinate[1], longitude: destinationCoordinate[0])
//
//        let sourcePin = MKPointAnnotation()
//        sourcePin.coordinate = source
//        sourcePin.title = "Start"
//        map.addAnnotation(sourcePin)
//
//        let destinationPin = MKPointAnnotation()
//        destinationPin.coordinate = destination
//        destinationPin.title = "Finish"
//        map.addAnnotation(destinationPin)
//
//        let region = MKCoordinateRegion(center: source, latitudinalMeters: 100000, longitudinalMeters: 100000)
//
//        map.region = region
//        map.delegate = context.coordinator
//
//        let req = MKDirections.Request()
//        req.source = MKMapItem(placemark: MKPlacemark(coordinate: source))
//        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
//
//        let directions = MKDirections(request: req)
//
//        directions.calculate { (direct, err) in
//
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }
//
//            let polyline = direct?.routes.first?.polyline
//            map.addOverlay(polyline!)
//            map.setRegion(MKCoordinateRegion(polyline!.boundingMapRect), animated: true)
//        }
//
//        return map
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<NavigationMapView>) {
//
//    }
//
//    class Coordinator : NSObject, MKMapViewDelegate {
//
//        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//
//            let render = MKPolylineRenderer(overlay: overlay)
//            render.strokeColor = .red
//            render.lineWidth = 4
//            return render
//        }
//    }
//}

//struct NavigationMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationMapView()
//    }
//}
