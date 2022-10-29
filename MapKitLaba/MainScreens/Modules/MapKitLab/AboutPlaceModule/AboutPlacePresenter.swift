//
//  AboutPlacePresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

class AboutPlacePresenter: ViewToPresenterAboutPlaceProtocol {

    // MARK: Properties
    var view: PresenterToViewAboutPlaceProtocol?
    var interactor: PresenterToInteractorAboutPlaceProtocol?
    var router: PresenterToRouterAboutPlaceProtocol?
}

extension AboutPlacePresenter: InteractorToPresenterAboutPlaceProtocol {
    
}
