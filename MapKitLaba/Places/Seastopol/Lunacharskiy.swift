//
//  Lunacharskiy.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 30.09.2022.
//

import UIKit
import MapKit


class Lunacharskiy: NSObject, Places {
    
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

class SubmergedShips: NSObject, Places {
    
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

class SevSU: NSObject, Places {
    
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

class Musson: NSObject, Places {
    
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

class Cementary: NSObject, Places {
    
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

class ChersonesTavr: NSObject, Places {
    
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

class Panorama: NSObject, Places {
    
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

class Omega: NSObject, Places {
    
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

class SeaMall: NSObject, Places {
    
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

class MalachovHill: NSObject, Places {
    
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
