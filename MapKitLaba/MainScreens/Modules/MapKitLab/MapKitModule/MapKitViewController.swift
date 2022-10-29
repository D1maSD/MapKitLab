//
//  MapKitViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import UIKit
import MapKit
import SnapKit


class MapKitViewController: ViewController {
    
    var mapView = MKMapView()
    private var locationManager: CLLocationManager!
    
    private var currentLocation = CLLocation(latitude: 44.605713, longitude: 33.535521)
    
    var viewModel: ViewModel?
    var aboutPlaceVC = AboutPlaceViewController()
    
    
    // MARK: - Properties
    var presenter: ViewToPresenterMapKitProtocol?
    
    
    var mussonImageArray = [
        UIImage(named: "musson1"),
        UIImage(named: "musson2"),
        UIImage(named: "musson3"),
        UIImage(named: "musson4"),
        UIImage(named: "musson5")
    ]
    
    var lamodaImageArray = [
        UIImage(named: "la1"),
        UIImage(named: "la2"),
        UIImage(named: "la3"),
        UIImage(named: "la4"),
        UIImage(named: "la5")
    ]
    
    var lunachImageArray = [
        UIImage(named: "lun1"),
        UIImage(named: "lun2"),
        UIImage(named: "lun3"),
        UIImage(named: "lun4"),
        UIImage(named: "lun5")
    ]
    
    var omegaImageArray = [
        UIImage(named: "om1"),
        UIImage(named: "om2"),
        UIImage(named: "om3"),
        UIImage(named: "om4"),
        UIImage(named: "om5")
    ]
    
    //musson1 lun1 om1 la1
    
    var places: [MKAnnotation] = [
        
        Lunacharskiy(title: NSLocalizedString("LUNACHARSKIY_TITLE", comment: "Театр Луначарского"),
                     annotation: NSLocalizedString("LUNACHARSKIY_SUBTITLE", comment: "Театр"),
                     locationName: NSLocalizedString("LUNACHARSKIY_LOCATIONNAME", comment: "проспект Нахимова, 6")
                     ,               coordinate: CLLocationCoordinate2D(
                        latitude: 44.613924,
                        longitude: 33.520454)),
        Locations(title: NSLocalizedString("OMEGA_TITLE", comment: "Omega"),
                  annotation: NSLocalizedString("OMEGA_SUBTITLE", comment: "Beach"),
                  locationName: NSLocalizedString("OMEGA_LOCATIONNAME", comment: "Гагаринский район, Севастополь"),
                  coordinate: CLLocationCoordinate2D(
                    latitude: 44.598002,
                    longitude: 33.443578)),
        Musson(title: NSLocalizedString("MUSSON_TITLE", comment: "Муссон"),
               annotation: NSLocalizedString("MUSSON_SUBTITLE", comment: "торгово-развлекательный центр"),
               locationName: NSLocalizedString("MUSSON_LOCATIONNAME", comment: "улица Вакуленчука, 29"),
               coordinate: CLLocationCoordinate2D(
                latitude: 44.589421,
                longitude: 33.488199)),
        Locations(title: NSLocalizedString("LAVANDA_TITLE", comment: "LAVANDA mall"),
                  annotation: NSLocalizedString("LAVANDA_SUBTITLE", comment: "торговый центр"),
                  locationName: NSLocalizedString("LAVANDA_LOCATIONNAME", comment: "Университетская, 33"),
                  coordinate: CLLocationCoordinate2D(
                    latitude: 44.59022,
                    longitude: 33.485032)),
        Locations(title: NSLocalizedString("SEAMALL_TITLE", comment: "Sea Mall"),
                  annotation: NSLocalizedString("SEAMALL_SUBTITLE", comment: "торгово-развлекательный центр"),
                  locationName: NSLocalizedString("SEAMALL_LOCATIONNAME", comment: "проспект Генерала Острякова, 260"),
                  coordinate: CLLocationCoordinate2D(
                    latitude: 44.552107,
                    longitude: 33.529241)),
        MalachovHill(title: NSLocalizedString("MALAHOW_TITLE", comment: "Малахов курган"),
                     annotation: NSLocalizedString("MALAHOW_SUBTITLE", comment: "мемориальный комплекс"),
                     locationName: NSLocalizedString("MALAHOW_LOCATIONNAME", comment: "Окопная, 1/2"),
                     coordinate: CLLocationCoordinate2D(
                        latitude: 44.603649,
                        longitude: 33.549038)),
        SubmergedShips(title: NSLocalizedString("SUBSHIPS_TITLE", comment: "Памятник затопленным кораблям"),
                       annotation: NSLocalizedString("SUBSHIPS_SUBTITLE", comment: "мемориал"),
                       locationName: NSLocalizedString("SUBSHIPS_LOCATIONNAME", comment: "Большая морская"),
                       coordinate: CLLocationCoordinate2D(
                        latitude: 44.618366,
                        longitude: 33.524321)),
        ChersonesTavr(title: NSLocalizedString("CHERSONES_TITLE", comment: "Херсонес Таврический"),
                      annotation: NSLocalizedString("CHERSONES_SUBTITLE", comment: "национальный музей-заповедник"),
                      locationName: NSLocalizedString("CHERSONES_LOCATIONNAME", comment: "Древняя улица, 1"),
                      coordinate: CLLocationCoordinate2D(
                        latitude: 44.610657,
                        longitude: 33.49189)),
        Panorama(title: NSLocalizedString("PANORAMA_TITLE", comment: "Панорама Оборона Севастополя 1854-1855 гг"),
                 annotation: NSLocalizedString("PANORAMA_SUBTITLE", comment: "Музеи"),
                 locationName: NSLocalizedString("PANORAMA_LOCATIONNAME", comment: "площадь Ушакова, 1/1"),
                 coordinate: CLLocationCoordinate2D(
                    latitude: 44.595362,
                    longitude: 33.522789)),
        Cementary(title: NSLocalizedString("CEMENTARY_TITLE", comment: "Старое городское кладбищег"),
                  annotation: NSLocalizedString("CEMENTARY_SUBTITLE", comment: "Кладбище"),
                  locationName: NSLocalizedString("CEMENTARY_LOCATIONNAME", comment: "улица Пожарова, 7"),
                  coordinate: CLLocationCoordinate2D(
                    latitude: 44.602334,
                    longitude: 33.505197)),
        SevSU(title: NSLocalizedString("SEVSU_TITLE", comment: "Севастопольский Государственный Университет"),
              annotation: NSLocalizedString("SEVSU_SUBTITLE", comment: "Университет"),
              locationName: NSLocalizedString("SEVSU_LOCATIONNAME", comment: "Университетская, 33"),
              coordinate: CLLocationCoordinate2D(
                latitude: 44.594801,
                longitude: 33.476118))
    ]
    
    let lunTheatre = Locations(title: "Lunacharskiy",
                               annotation: "Theare",
                               locationName: "проспект Нахимова, 6",
                               coordinate: CLLocationCoordinate2D(
                                latitude: 44.613924,
                                longitude: 33.520454)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        enabledLocationManager()
        setUpMapViewCamera()
        setUpMapView()
        registerMapAnnotatonView()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    // MARK: - setUpLayout
    
    override func setupLayout() {
        self.view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.left.equalTo(view)
            $0.right.equalTo(view)
            $0.top.equalTo(view)
            $0.bottom.equalTo(view)
        }
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("Region was selected")
    }
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("didSelect annotation deselect")
    }
    
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("didSelect annotation selected")
    }
    
    // MARK: - setUpCamera
    
    func setUpMapViewCamera() {
        mapView.searchRadius(currentLocation, radius: 1000)
        let cameraCenter = CLLocation(latitude: 44.605713, longitude: 33.535521)
        let region = MKCoordinateRegion(center: cameraCenter.coordinate,
                                        latitudinalMeters: 10000,
                                        longitudinalMeters: 10000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        mapView.setCameraZoomRange(MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 30000), animated: true)
        //        guard let places = viewModel?.places else { fatalError("no found places")}
        mapView.addAnnotations(places)
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
    
    func registerMapAnnotatonView() {
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(Lunacharskiy.self))
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(Musson.self))
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(MalachovHill.self))
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(SubmergedShips.self))
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(ChersonesTavr.self))
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(Panorama.self))
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(Cementary.self))
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(SevSU.self))
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(Omega.self))
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(SeaMall.self))
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

extension MapKitViewController: MKMapViewDelegate {
    
    func setupLunTheatreAnnotation(for annotation: MKAnnotation, on annotationView: MKMapView) -> MKAnnotationView {
        var identifier = NSStringFromClass(Lunacharskiy.self)
//        let lunIdentifier = NSStringFromClass(Lunacharskiy.self)
//        let omegaIdentifier = NSStringFromClass(Panorama.self)
//        let subShipsIdentifier = NSStringFromClass(SubmergedShips.self)
        
        if let _ = annotation as? Lunacharskiy {
            identifier = NSStringFromClass(Lunacharskiy.self)
        }
        if let _ = annotation as? Musson {
            identifier = NSStringFromClass(Musson.self)
        }
        if let _ = annotation as? Panorama {
            identifier = NSStringFromClass(Musson.self)
        }
        if let _ = annotation as? SubmergedShips {
            identifier = NSStringFromClass(Musson.self)
        }
        
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
        if let marketAnnotationView = view as? MKMarkerAnnotationView {
            marketAnnotationView.animatesWhenAdded = true
            marketAnnotationView.canShowCallout = true
            marketAnnotationView.markerTintColor = UIColor(named: "internationalOrange")
            
            let rightButton = UIButton(type: .detailDisclosure)
            marketAnnotationView.rightCalloutAccessoryView = rightButton
        }
        return view
    }
    
    enum Annotations {
        case Lunacharskiy
        case Musson
    }
    
//    switch Annotations: MKAnnotation {
//    case Lunacharskiy:
//        return self
//
//    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if let annotation = view.annotation, annotation.isKind(of: Lunacharskiy.self) {
            print("lunacharskiy tapped")
            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
            aboutPlaceVC.typeWith = 1
        }
        
        if let annotation = view.annotation, annotation.isKind(of: Musson.self) {
            print("Musson tapped")
            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
            aboutPlaceVC.typeWith = 2
        }
        
        if let annotation = view.annotation, annotation.isKind(of: MalachovHill.self) {
            print("MalachovHill tapped")
            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
            aboutPlaceVC.typeWith = 3
        }
        
        if let annotation = view.annotation, annotation.isKind(of: SubmergedShips.self) {
            print("SubmergedShips tapped")
            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
            aboutPlaceVC.typeWith = 4
        }
        
        if let annotation = view.annotation, annotation.isKind(of: ChersonesTavr.self) {
            print("ChersonesTavr tapped")
            self.navigationController?.pushViewController(aboutPlaceVC, animated: true)
            aboutPlaceVC.typeWith = 5
            print(AboutPlaceViewController.typeOf)
        }
        
        if let annotation = view.annotation, annotation.isKind(of: Panorama.self) {
            print("Panorama tapped")
            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
            aboutPlaceVC.typeWith = 6
            print(AboutPlaceViewController.typeOf)
            print(AboutPlaceViewController.typeOf)
            print(AboutPlaceViewController.typeOf)
            print(AboutPlaceViewController.typeOf)
            print(AboutPlaceViewController.typeOf)
            print(AboutPlaceViewController.typeOf)
            print(AboutPlaceViewController.typeOf)
            print(AboutPlaceViewController.typeOf)
        }
        
        if let annotation = view.annotation, annotation.isKind(of: Cementary.self) {
            print("Cementary tapped")
            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
            aboutPlaceVC.typeWith = 7
        }
        
        if let annotation = view.annotation, annotation.isKind(of: SevSU.self) {
            print("SevSU tapped")
            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
            aboutPlaceVC.typeWith = 8
        }
        
        if let annotation = view.annotation, annotation.isKind(of: Omega.self) {
            print("Omega tapped")
            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
            aboutPlaceVC.typeWith = 9
        }
        
        if let annotation = view.annotation, annotation.isKind(of: SeaMall.self) {
            print("SeaMall tapped")
            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
            aboutPlaceVC.typeWith = 10
        }
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        var annotationView: MKAnnotationView?
        
//        if let annotation = annotation as? Lunacharskiy {
//            annotationView = setupLunTheatreAnnotation(for: annotation, on: mapView)
//        }
        if let annotation = annotation as? MKAnnotation {
            annotationView = setupLunTheatreAnnotation(for: annotation, on: mapView)
        }
        return annotationView
    }
}



// MARK: - CLLocationManagerDelegate

extension MapKitViewController: CLLocationManagerDelegate {
    
    
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

extension MapKitViewController: PresenterToViewMapKitProtocol {
    // TODO: Implement View Output Methods
}














































//import UIKit
//
//import MapKit
//import SnapKit
//
//class MapViewController: ViewController {
//
//    var mapView = MKMapView()
//    private var locationManager: CLLocationManager!
//
//    private var currentLocation = CLLocation(latitude: 44.605713, longitude: 33.535521)
//
//    var viewModel: ViewModel?
//    var aboutPlaceVC = AboutPlaceViewController()
//
//    var mussonImageArray = [
//        UIImage(named: "musson1"),
//        UIImage(named: "musson2"),
//        UIImage(named: "musson3"),
//        UIImage(named: "musson4"),
//        UIImage(named: "musson5")
//    ]
//
//    var lamodaImageArray = [
//        UIImage(named: "la1"),
//        UIImage(named: "la2"),
//        UIImage(named: "la3"),
//        UIImage(named: "la4"),
//        UIImage(named: "la5")
//    ]
//
//    var lunachImageArray = [
//        UIImage(named: "lun1"),
//        UIImage(named: "lun2"),
//        UIImage(named: "lun3"),
//        UIImage(named: "lun4"),
//        UIImage(named: "lun5")
//    ]
//
//    var omegaImageArray = [
//        UIImage(named: "om1"),
//        UIImage(named: "om2"),
//        UIImage(named: "om3"),
//        UIImage(named: "om4"),
//        UIImage(named: "om5")
//    ]
//
//    //musson1 lun1 om1 la1
//
//    var places: [MKAnnotation] = [
//
//        Lunacharskiy(title: NSLocalizedString("LUNACHARSKIY_TITLE", comment: "Театр Луначарского"),
//                     annotation: NSLocalizedString("LUNACHARSKIY_SUBTITLE", comment: "Театр"),
//                     locationName: NSLocalizedString("LUNACHARSKIY_LOCATIONNAME", comment: "проспект Нахимова, 6")
//                     ,               coordinate: CLLocationCoordinate2D(
//                        latitude: 44.613924,
//                        longitude: 33.520454)),
//        Locations(title: NSLocalizedString("OMEGA_TITLE", comment: "Omega"),
//                  annotation: NSLocalizedString("OMEGA_SUBTITLE", comment: "Beach"),
//                  locationName: NSLocalizedString("OMEGA_LOCATIONNAME", comment: "Гагаринский район, Севастополь"),
//                  coordinate: CLLocationCoordinate2D(
//                    latitude: 44.598002,
//                    longitude: 33.443578)),
//        Musson(title: NSLocalizedString("MUSSON_TITLE", comment: "Муссон"),
//               annotation: NSLocalizedString("MUSSON_SUBTITLE", comment: "торгово-развлекательный центр"),
//               locationName: NSLocalizedString("MUSSON_LOCATIONNAME", comment: "улица Вакуленчука, 29"),
//               coordinate: CLLocationCoordinate2D(
//                latitude: 44.589421,
//                longitude: 33.488199)),
//        Locations(title: NSLocalizedString("LAVANDA_TITLE", comment: "LAVANDA mall"),
//                  annotation: NSLocalizedString("LAVANDA_SUBTITLE", comment: "торговый центр"),
//                  locationName: NSLocalizedString("LAVANDA_LOCATIONNAME", comment: "Университетская, 33"),
//                  coordinate: CLLocationCoordinate2D(
//                    latitude: 44.59022,
//                    longitude: 33.485032)),
//        Locations(title: NSLocalizedString("SEAMALL_TITLE", comment: "Sea Mall"),
//                  annotation: NSLocalizedString("SEAMALL_SUBTITLE", comment: "торгово-развлекательный центр"),
//                  locationName: NSLocalizedString("SEAMALL_LOCATIONNAME", comment: "проспект Генерала Острякова, 260"),
//                  coordinate: CLLocationCoordinate2D(
//                    latitude: 44.552107,
//                    longitude: 33.529241)),
//        MalachovHill(title: NSLocalizedString("MALAHOW_TITLE", comment: "Малахов курган"),
//                     annotation: NSLocalizedString("MALAHOW_SUBTITLE", comment: "мемориальный комплекс"),
//                     locationName: NSLocalizedString("MALAHOW_LOCATIONNAME", comment: "Окопная, 1/2"),
//                     coordinate: CLLocationCoordinate2D(
//                        latitude: 44.603649,
//                        longitude: 33.549038)),
//        SubmergedShips(title: NSLocalizedString("SUBSHIPS_TITLE", comment: "Памятник затопленным кораблям"),
//                       annotation: NSLocalizedString("SUBSHIPS_SUBTITLE", comment: "мемориал"),
//                       locationName: NSLocalizedString("SUBSHIPS_LOCATIONNAME", comment: "Большая морская"),
//                       coordinate: CLLocationCoordinate2D(
//                        latitude: 44.618366,
//                        longitude: 33.524321)),
//        ChersonesTavr(title: NSLocalizedString("CHERSONES_TITLE", comment: "Херсонес Таврический"),
//                      annotation: NSLocalizedString("CHERSONES_SUBTITLE", comment: "национальный музей-заповедник"),
//                      locationName: NSLocalizedString("CHERSONES_LOCATIONNAME", comment: "Древняя улица, 1"),
//                      coordinate: CLLocationCoordinate2D(
//                        latitude: 44.610657,
//                        longitude: 33.49189)),
//        Panorama(title: NSLocalizedString("PANORAMA_TITLE", comment: "Панорама Оборона Севастополя 1854-1855 гг"),
//                 annotation: NSLocalizedString("PANORAMA_SUBTITLE", comment: "Музеи"),
//                 locationName: NSLocalizedString("PANORAMA_LOCATIONNAME", comment: "площадь Ушакова, 1/1"),
//                 coordinate: CLLocationCoordinate2D(
//                    latitude: 44.595362,
//                    longitude: 33.522789)),
//        Cementary(title: NSLocalizedString("CEMENTARY_TITLE", comment: "Старое городское кладбищег"),
//                  annotation: NSLocalizedString("CEMENTARY_SUBTITLE", comment: "Кладбище"),
//                  locationName: NSLocalizedString("CEMENTARY_LOCATIONNAME", comment: "улица Пожарова, 7"),
//                  coordinate: CLLocationCoordinate2D(
//                    latitude: 44.602334,
//                    longitude: 33.505197)),
//        SevSU(title: NSLocalizedString("SEVSU_TITLE", comment: "Севастопольский Государственный Университет"),
//              annotation: NSLocalizedString("SEVSU_SUBTITLE", comment: "Университет"),
//              locationName: NSLocalizedString("SEVSU_LOCATIONNAME", comment: "Университетская, 33"),
//              coordinate: CLLocationCoordinate2D(
//                latitude: 44.594801,
//                longitude: 33.476118))
//    ]
//
//    let lunTheatre = Locations(title: "Lunacharskiy",
//                               annotation: "Theare",
//                               locationName: "проспект Нахимова, 6",
//                               coordinate: CLLocationCoordinate2D(
//                                latitude: 44.613924,
//                                longitude: 33.520454)
//    )
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        locationManager = CLLocationManager()
//        enabledLocationManager()
//        setUpMapViewCamera()
//        setUpMapView()
//        registerMapAnnotatonView()
//
//        locationManager.requestAlwaysAuthorization()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    }
//
//
//    // MARK: - setUpLayout
//
//    override func setupLayout() {
//        self.view.addSubview(mapView)
//        mapView.snp.makeConstraints {
//            $0.left.equalTo(view)
//            $0.right.equalTo(view)
//            $0.top.equalTo(view)
//            $0.bottom.equalTo(view)
//        }
//    }
//
//    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
//        print("Region was selected")
//    }
//    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
//        print("didSelect annotation deselect")
//    }
//
//
//
//    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//        print("didSelect annotation selected")
//    }
//
//    // MARK: - setUpCamera
//
//    func setUpMapViewCamera() {
//        mapView.searchRadius(currentLocation, radius: 1000)
//        let cameraCenter = CLLocation(latitude: 44.605713, longitude: 33.535521)
//        let region = MKCoordinateRegion(center: cameraCenter.coordinate,
//                                        latitudinalMeters: 10000,
//                                        longitudinalMeters: 10000)
//        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
//        mapView.setCameraZoomRange(MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 30000), animated: true)
//        //        guard let places = viewModel?.places else { fatalError("no found places")}
//        mapView.addAnnotations(places)
//    }
//
//    // MARK: - setUpMapView
//
//    func setUpMapView() {
//        mapView.delegate = self
//        mapView.mapType = .standard
//        mapView.isZoomEnabled = true
//        mapView.isScrollEnabled = true
//        //
//        //        if let coor = mapView.userLocation.location?.coordinate {
//        //            mapView.setCenter(coor, animated: true)
//        //        }
//    }
//
//    func registerMapAnnotatonView() {
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(Lunacharskiy.self))
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(Musson.self))
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(MalachovHill.self))
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(SubmergedShips.self))
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(ChersonesTavr.self))
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(Panorama.self))
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(Cementary.self))
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(SevSU.self))
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(Omega.self))
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(SeaMall.self))
//    }
//
//    func enabledLocationManager() {
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.requestWhenInUseAuthorization()
//            locationManager.startUpdatingLocation()
//            print("locationServicesEnabled() locationServicesEnabled()locationServicesEnabled()")
//        }
//    }
//
//}
//
//extension MKMapView {
//
//    // MARK: - searchRadius
//
//    func searchRadius(_ location: CLLocation, radius: CLLocationDistance = 1000) {
//        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
//        setRegion(coordinateRegion, animated: true)
//    }
//}
//
//
//// MARK: - MKMapViewDelegate
//
//extension MapViewController: MKMapViewDelegate {
//
//    func setupLunTheatreAnnotation(for annotation: MKAnnotation, on annotationView: MKMapView) -> MKAnnotationView {
//        var identifier = NSStringFromClass(Lunacharskiy.self)
////        let lunIdentifier = NSStringFromClass(Lunacharskiy.self)
////        let omegaIdentifier = NSStringFromClass(Panorama.self)
////        let subShipsIdentifier = NSStringFromClass(SubmergedShips.self)
//
//        if let _ = annotation as? Lunacharskiy {
//            identifier = NSStringFromClass(Lunacharskiy.self)
//        }
//        if let _ = annotation as? Musson {
//            identifier = NSStringFromClass(Musson.self)
//        }
//        if let _ = annotation as? Panorama {
//            identifier = NSStringFromClass(Musson.self)
//        }
//        if let _ = annotation as? SubmergedShips {
//            identifier = NSStringFromClass(Musson.self)
//        }
//
//        let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
//        if let marketAnnotationView = view as? MKMarkerAnnotationView {
//            marketAnnotationView.animatesWhenAdded = true
//            marketAnnotationView.canShowCallout = true
//            marketAnnotationView.markerTintColor = UIColor(named: "internationalOrange")
//
//            let rightButton = UIButton(type: .detailDisclosure)
//            marketAnnotationView.rightCalloutAccessoryView = rightButton
//        }
//        return view
//    }
//
//    enum Annotations {
//        case Lunacharskiy
//        case Musson
//    }
//
////    switch Annotations: MKAnnotation {
////    case Lunacharskiy:
////        return self
////
////    }
//
//
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//
//        if let annotation = view.annotation, annotation.isKind(of: Lunacharskiy.self) {
//            print("lunacharskiy tapped")
//            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
//            aboutPlaceVC.typeWith = 1
//        }
//
//        if let annotation = view.annotation, annotation.isKind(of: Musson.self) {
//            print("Musson tapped")
//            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
//            aboutPlaceVC.typeWith = 2
//        }
//
//        if let annotation = view.annotation, annotation.isKind(of: MalachovHill.self) {
//            print("MalachovHill tapped")
//            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
//            aboutPlaceVC.typeWith = 3
//        }
//
//        if let annotation = view.annotation, annotation.isKind(of: SubmergedShips.self) {
//            print("SubmergedShips tapped")
//            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
//            aboutPlaceVC.typeWith = 4
//        }
//
//        if let annotation = view.annotation, annotation.isKind(of: ChersonesTavr.self) {
//            print("ChersonesTavr tapped")
//            self.navigationController?.pushViewController(aboutPlaceVC, animated: true)
//            aboutPlaceVC.typeWith = 5
//            print(AboutPlaceViewController.typeOf)
//        }
//
//        if let annotation = view.annotation, annotation.isKind(of: Panorama.self) {
//            print("Panorama tapped")
//            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
//            aboutPlaceVC.typeWith = 6
//            print(AboutPlaceViewController.typeOf)
//            print(AboutPlaceViewController.typeOf)
//            print(AboutPlaceViewController.typeOf)
//            print(AboutPlaceViewController.typeOf)
//            print(AboutPlaceViewController.typeOf)
//            print(AboutPlaceViewController.typeOf)
//            print(AboutPlaceViewController.typeOf)
//            print(AboutPlaceViewController.typeOf)
//        }
//
//        if let annotation = view.annotation, annotation.isKind(of: Cementary.self) {
//            print("Cementary tapped")
//            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
//            aboutPlaceVC.typeWith = 7
//        }
//
//        if let annotation = view.annotation, annotation.isKind(of: SevSU.self) {
//            print("SevSU tapped")
//            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
//            aboutPlaceVC.typeWith = 8
//        }
//
//        if let annotation = view.annotation, annotation.isKind(of: Omega.self) {
//            print("Omega tapped")
//            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
//            aboutPlaceVC.typeWith = 9
//        }
//
//        if let annotation = view.annotation, annotation.isKind(of: SeaMall.self) {
//            print("SeaMall tapped")
//            self.navigationController?.pushViewController(AboutPlaceViewController(), animated: true)
//            aboutPlaceVC.typeWith = 10
//        }
//    }
//
//
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        guard !annotation.isKind(of: MKUserLocation.self) else {
//            return nil
//        }
//        var annotationView: MKAnnotationView?
//
////        if let annotation = annotation as? Lunacharskiy {
////            annotationView = setupLunTheatreAnnotation(for: annotation, on: mapView)
////        }
//        if let annotation = annotation as? MKAnnotation {
//            annotationView = setupLunTheatreAnnotation(for: annotation, on: mapView)
//        }
//        return annotationView
//    }
//}
//
//
//
//// MARK: - CLLocationManagerDelegate
//
//extension MapViewController: CLLocationManagerDelegate {
//
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        //        if let location = locations.last {
//        //            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        //            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        //            self.mapView.setRegion(region, animated: true)
//        //        }
//        guard let location = manager.location, let lastLocation = locations.last else { fatalError("Can't found location") }
//
//        let center = CLLocationCoordinate2D(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude)
//
//        let locValue: CLLocationCoordinate2D = location.coordinate
//        mapView.mapType = .standard
//
//        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//        let region = MKCoordinateRegion(center: center, span: span)
//        mapView.setRegion(region, animated: true)
//
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = locValue
//        annotation.title = "You"
//        annotation.subtitle = "current location"
//        mapView.addAnnotation(annotation)
//    }
//}
