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
    
    
    let currentLocation = CLLocation(latitude: 44.605713, longitude: 33.535521)
        
    let lunTheatre = Places(title: "Lunacharskiy",
                            annotation: "Theare",
                            locationName: "проспект Нахимова, 6",
                            coordinate: CLLocationCoordinate2D(
                                latitude: 44.613924,
                                longitude: 33.520454)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        setUpLayout()
        mapView.searchRadius(currentLocation, radius: 1000)
        
        let cameraCenter = CLLocation(latitude: 44.605713, longitude: 33.535521)
        let region = MKCoordinateRegion(center: cameraCenter.coordinate,
                                        latitudinalMeters: 10000,
                                        longitudinalMeters: 10000)
//        mapView.region = region
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        mapView.setCameraZoomRange(MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 30000), animated: true)
        mapView.addAnnotation(lunTheatre)
    }
    
    func setUpLayout() {
        self.view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.left.equalTo(view)
            $0.right.equalTo(view)
            $0.top.equalTo(view)
            $0.bottom.equalTo(view)
        }
    }
}

extension MKMapView {
    func searchRadius(_ location: CLLocation, radius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
        setRegion(coordinateRegion, animated: true)
    }
}


extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? Places else {
            return nil
        }
        // create identifier
        // create MarkevView
        let identifier = "identirier"
        let view: MKMarkerAnnotationView
        
        // create dequeued view as? MKMarkerAnnotationView
        if let dequeueAnnotation = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeueAnnotation.annotation = annotation
            view = dequeueAnnotation
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}
