//
//  ViewModel.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.09.2022.
//

import UIKit
import MapKit

struct ViewModel {
    
    var places: [MKAnnotation] = [
        Locations(title: "Lunacharskiy",
               annotation: "Theare",
               locationName: "проспект Нахимова, 6",
               coordinate: CLLocationCoordinate2D(
                latitude: 44.613924,
                longitude: 33.520454)),
          
          Locations(title: "Omega",
                 annotation: "Beach",
                 locationName: "Гагаринский район, Севастополь",
                 coordinate: CLLocationCoordinate2D(
                  latitude: 44.598002,
                  longitude: 33.443578)),
          
          Locations(title: "Муссон",
                 annotation: "торгово-развлекательный центр",
                 locationName: "​улица Вакуленчука, 29",
                 coordinate: CLLocationCoordinate2D(
                  latitude: 44.589421,
                  longitude: 33.488199)),
        
          Locations(title: "LAVANDA mall",
                 annotation: "торговый центр",
                 locationName: "​​улица Вакуленчука, 33а/5",
                 coordinate: CLLocationCoordinate2D(
                  latitude: 44.59022,
                  longitude: 33.485032))
        ]
}
