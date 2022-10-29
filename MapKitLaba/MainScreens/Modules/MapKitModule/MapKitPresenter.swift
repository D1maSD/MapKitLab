//
//  MapKitPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation

class MapKitPresenter: ViewToPresenterMapKitProtocol {

    // MARK: Properties
    var view: PresenterToViewMapKitProtocol?
    var interactor: PresenterToInteractorMapKitProtocol?
    var router: PresenterToRouterMapKitProtocol?
}

extension MapKitPresenter: InteractorToPresenterMapKitProtocol {
    
}
