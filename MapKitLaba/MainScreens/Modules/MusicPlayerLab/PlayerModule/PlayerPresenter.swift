//
//  PlayerPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

class PlayerPresenter: ViewToPresenterPlayerProtocol {

    // MARK: Properties
    var view: PresenterToViewPlayerProtocol?
    var interactor: PresenterToInteractorPlayerProtocol?
    var router: PresenterToRouterPlayerProtocol?
}

extension PlayerPresenter: InteractorToPresenterPlayerProtocol {
    
}
