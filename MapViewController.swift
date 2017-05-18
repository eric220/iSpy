//
//  MapViewController.swift
//  iSpy
//
//  Created by Macbook on 5/9/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var loggedIn = true
    var locationManager = CLLocationManager()
    let location = (30.696828100000001,-88.045619000000002)
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        let coordinate = CLLocationCoordinate2D(latitude: location.0, longitude: location.1)
        centerZoomMap(mapView: mapView, locationPin: coordinate)
        addAnnotations()
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            if ((UIDevice.current.systemVersion as NSString).floatValue >= 8)
            {
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.startUpdatingLocation()
            print(locationManager.location?.coordinate as Any)
        } else {
                print("Location services are not enabled");
        }
    }
    
    func centerZoomMap(mapView: MKMapView, locationPin: CLLocationCoordinate2D?){
        let mapCenter = locationPin
        let longitudeDelta = CLLocationDegrees(5.0)
        let latitudeDelta = CLLocationDegrees(5.0)
        let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let savedRegion = MKCoordinateRegion(center: mapCenter!, span: span)
        mapView.setRegion(savedRegion, animated: true)
    }
    
    func addAnnotations(){
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: (TempData.PeoplePlaces.Susan.lat), longitude: (TempData.PeoplePlaces.Susan.lon))
        annotation.title = TempData.PeoplePlaces.Susan.name 
        mapView.addAnnotation(annotation)
    }
    //for development toggle between game and login
    @IBAction func toggleButton(_ sender: Any) {
        if (loggedIn) {
            loggedIn = false
            toggleButton.title = "Game"
        } else {
            loggedIn = true
            toggleButton.title = "login"
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            if (!loggedIn){
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController")
                self.navigationController!.pushViewController(controller!, animated: true)
            } else {
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                self.navigationController!.pushViewController(controller, animated: true)
            }
        }
    }
    
    //center map on annotation
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let mapCenter = CLLocationCoordinate2D.init(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)! )
        mapView.setCenter(mapCenter, animated: true)
    }

}

