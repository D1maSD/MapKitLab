//
//  CurrentNewsPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation

class CurrentNewsPresenter: ViewToPresenterCurrentNewsProtocol {

    // MARK: Properties
    var view: PresenterToViewCurrentNewsProtocol?
    var interactor: PresenterToInteractorCurrentNewsProtocol?
    var router: PresenterToRouterCurrentNewsProtocol?
}

extension CurrentNewsPresenter: InteractorToPresenterCurrentNewsProtocol {
    
}
