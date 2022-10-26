//
//  MapKitLabaPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import Foundation

class MapKitLabaPresenter {

    // MARK: Properties

    weak var view: MapKitLabaView?
    var router: MapKitLabaWireframe?
    var interactor: MapKitLabaUseCase?
}

extension MapKitLabaPresenter: MapKitLabaPresentation {
    // TODO: implement presentation methods
}

extension MapKitLabaPresenter: MapKitLabaInteractorOutput {
    // TODO: implement interactor output methods
}
