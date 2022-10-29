//
//  NewsLabPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation

class NewsLabPresenter: ViewToPresenterNewsLabProtocol {
   
    
    // MARK: Properties
    var view: PresenterToViewNewsLabProtocol?
    var interactor: PresenterToInteractorNewsLabProtocol?
    var router: PresenterToRouterNewsLabProtocol?
    var newsNubers: Int? = 5
    
    
    
    // MARK: - Inputs from view
    
    func numberOfRowsInSection() -> Int {
        guard let newsNubers = self.newsNubers else {
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
}

extension NewsLabPresenter: InteractorToPresenterNewsLabProtocol {
    
}
