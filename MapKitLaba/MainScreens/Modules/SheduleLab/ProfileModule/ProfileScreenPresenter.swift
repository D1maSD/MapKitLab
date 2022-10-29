//
//  ProfileScreenPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

class ProfileScreenPresenter: ViewToPresenterProfileScreenProtocol {

    // MARK: Properties
    var view: PresenterToViewProfileScreenProtocol?
    var interactor: PresenterToInteractorProfileScreenProtocol?
    var router: PresenterToRouterProfileScreenProtocol?
}

extension ProfileScreenPresenter: InteractorToPresenterProfileScreenProtocol {
    
}
