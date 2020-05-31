//
//  GetLocationViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 31/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit
import MapKit

class GetLocationViewController: UIViewController {
    @IBOutlet weak var mapView:MKMapView!
    fileprivate let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpMapView()
    }
    
    func setUpMapView() {
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.delegate = self
        mapView.isZoomEnabled = true
        mapView.mapType = .standard
        self.getUsercurrentLocation()
    }
    func getUsercurrentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if #available(iOS 11.0, *) {
            locationManager.showsBackgroundLocationIndicator = true
        }
        locationManager.startUpdatingLocation()
    }
    func addAnnotationsOnMapView(cordinates: CLLocationCoordinate2D) {
        let london = MKPointAnnotation()
        london.title = "Annotation"
        london.subtitle = "Sub Annotation"
        london.coordinate = cordinates
        mapView.addAnnotation(london)
    }
    

    

}

extension GetLocationViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        let currentLocation = location.coordinate
        self.addAnnotationsOnMapView(cordinates: currentLocation)
        self.addAnnotationsOnMapView(cordinates: CLLocationCoordinate2D(latitude: currentLocation.latitude + 0.0005, longitude: currentLocation.longitude + 0.0005))
        let coordinateRegion = MKCoordinateRegion(center: currentLocation, latitudinalMeters: 800, longitudinalMeters: 800)
        mapView.setRegion(coordinateRegion, animated: true)
       // locationManager.stopUpdatingLocation()
    }
}
extension GetLocationViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
}
