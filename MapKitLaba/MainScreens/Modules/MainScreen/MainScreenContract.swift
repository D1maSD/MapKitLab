//
//  MainScreenContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.11.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMainScreenProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMainScreenProtocol {
    
    var view: PresenterToViewMainScreenProtocol? { get set }
    var interactor: PresenterToInteractorMainScreenProtocol? { get set }
    var router: PresenterToRouterMainScreenProtocol? { get set }
    
    func numberOfRowsInSection() -> Int
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMainScreenProtocol {
    
    var presenter: InteractorToPresenterMainScreenProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMainScreenProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMainScreenProtocol {
    
}
