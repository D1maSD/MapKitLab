//
//  SheduleLabPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import Foundation

class SheduleLabPresenter: ViewToPresenterSheduleLabProtocol {

    // MARK: Properties
    var view: PresenterToViewSheduleLabProtocol?
    var interactor: PresenterToInteractorSheduleLabProtocol?
    var router: PresenterToRouterSheduleLabProtocol?
}

extension SheduleLabPresenter: InteractorToPresenterSheduleLabProtocol {
    
}
