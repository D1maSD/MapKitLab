//
//  AboutPlaceContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewAboutPlaceProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAboutPlaceProtocol {
    
    var view: PresenterToViewAboutPlaceProtocol? { get set }
    var interactor: PresenterToInteractorAboutPlaceProtocol? { get set }
    var router: PresenterToRouterAboutPlaceProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAboutPlaceProtocol {
    
    var presenter: InteractorToPresenterAboutPlaceProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAboutPlaceProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAboutPlaceProtocol {
    
}
