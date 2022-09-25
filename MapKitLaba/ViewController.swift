//
//  ViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 21.09.2022.
//

import UIKit
import MapKit
import SnapKit

class ViewController: UIViewController {
    
    var mapView = MKMapView()
    
    private var locationManager: CLLocationManager!
    
    private var currentLocation = CLLocation(latitude: 44.605713, longitude: 33.535521)
        
    let lunTheatre = Places(title: "Lunacharskiy",
                            annotation: "Theare",
                            locationName: "проспект Нахимова, 6",
                            coordinate: CLLocationCoordinate2D(
                                latitude: 44.613924,
                                longitude: 33.520454)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        view.backgroundColor = .systemRed
        setUpLayout()
        enabledLocationManager()
        setUpMapViewCamera()
        setUpMapView()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

    }
    
    
    // MARK: - setUpLayout
    
    func setUpLayout() {
        self.view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.left.equalTo(view)
            $0.right.equalTo(view)
            $0.top.equalTo(view)
            $0.bottom.equalTo(view)
        }
    }
    
    // MARK: - setUpCamera
    
    func setUpMapViewCamera() {
//        mapView.searchRadius(currentLocation, radius: 1000)
//        let cameraCenter = CLLocation(latitude: 44.605713, longitude: 33.535521)
//        let region = MKCoordinateRegion(center: cameraCenter.coordinate,
//                                        latitudinalMeters: 10000,
//                                        longitudinalMeters: 10000)
//        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
//        mapView.setCameraZoomRange(MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 30000), animated: true)
//        mapView.addAnnotation(lunTheatre)
    }
    
    // MARK: - setUpMapView
    
    func setUpMapView() {
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
//
//        if let coor = mapView.userLocation.location?.coordinate {
//            mapView.setCenter(coor, animated: true)
//        }
    }
    
    func enabledLocationManager() {
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            print("locationServicesEnabled() locationServicesEnabled()locationServicesEnabled()")
        }
    }
    
}

extension MKMapView {
    
    // MARK: - searchRadius
    
    func searchRadius(_ location: CLLocation, radius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
        setRegion(coordinateRegion, animated: true)
    }
}


// MARK: - MKMapViewDelegate

extension ViewController: MKMapViewDelegate {


//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        guard let annotation = annotation as? Places else {
//            return nil
//        }
//        // create identifier
//        // create MarkevView
//        let identifier = "identirier"
//        let view: MKMarkerAnnotationView
//
//        // create dequeued view as? MKMarkerAnnotationView
//        if let dequeueAnnotation = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
//            dequeueAnnotation.annotation = annotation
//            view = dequeueAnnotation
//        } else {
//            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            view.canShowCallout = true
//            view.calloutOffset = CGPoint(x: -5, y: 5)
//            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        }
//        return view
//    }
}


// MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last {
//            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//            self.mapView.setRegion(region, animated: true)
//        }
        guard let location = manager.location, let lastLocation = locations.last else { fatalError("Can't found location") }
        
            let center = CLLocationCoordinate2D(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude)
        
        let locValue: CLLocationCoordinate2D = location.coordinate
        mapView.mapType = .standard

        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "You"
        annotation.subtitle = "current location"
        mapView.addAnnotation(annotation)
    }
}
