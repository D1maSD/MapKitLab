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
    var sheduleNubers: Int? = 8
    
    
    // MARK: - Inputs from view
    func numberOfRowsInSection() -> Int {
        guard let sheduleNubers = self.sheduleNubers else {
            return 0
        }
        return sheduleNubers
    }
    
    func didSelectRowAt(index: Int) {
        print(index)
    }
    
    func deselectRowAt(index: Int) {
        print(index)
    }
    

    
}

extension SheduleLabPresenter: InteractorToPresenterSheduleLabProtocol {
    
}
