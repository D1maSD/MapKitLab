//
//  Places.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 22.09.2022.
//

import UIKit
import MapKit


protocol Places: MKAnnotation {
    var title: String? { get set }
    var annotation: String? { get set }
    var locationName: String? { get set }
    var coordinate: CLLocationCoordinate2D { get set }
    var subtitle: String? { get }
}

class Locations: NSObject, Places {
    
    var title: String?
    var annotation: String?
    var locationName: String?
    var coordinate: CLLocationCoordinate2D
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

