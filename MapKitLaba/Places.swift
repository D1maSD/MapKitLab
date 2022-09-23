//
//  Places.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 22.09.2022.
//

import UIKit
import MapKit


class Places: NSObject, MKAnnotation {
    
   let a = MKAnnotationView()
    var title: String?
    var annotation: String?
    var locationName: String?
    let coordinate: CLLocationCoordinate2D
    var subtitle: String? {
        return locationName
    }
    
    init(title: String?,
         annotation: String?,
         locationName: String?,
         coordinate: CLLocationCoordinate2D)
    {
        self.title = title
        self.annotation = annotation
        self.locationName = locationName
        self.coordinate = coordinate
        super.init()
    }
}

