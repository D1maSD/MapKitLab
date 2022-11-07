//
//  MainScreenPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.11.2022.
//  
//

import Foundation

class MainScreenPresenter: ViewToPresenterMainScreenProtocol {
    
    
    func numberOfRowsInSection() -> Int {
        guard let newsNubers = self.cellCount else {
            return 0
        }
        return newsNubers
    }
    
    func didSelectRowAt(index: Int) {
        print(index)
    }
    
    func deselectRowAt(index: Int) {
        print(index)
    }
    

    // MARK: Properties
    var view: PresenterToViewMainScreenProtocol?
    var interactor: PresenterToInteractorMainScreenProtocol?
    var router: PresenterToRouterMainScreenProtocol?
    var cellCount: Int? = 4
}

extension MainScreenPresenter: InteractorToPresenterMainScreenProtocol {
    
}
