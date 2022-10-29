//
//  ProfileScreenContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewProfileScreenProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterProfileScreenProtocol {
    
    var view: PresenterToViewProfileScreenProtocol? { get set }
    var interactor: PresenterToInteractorProfileScreenProtocol? { get set }
    var router: PresenterToRouterProfileScreenProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorProfileScreenProtocol {
    
    var presenter: InteractorToPresenterProfileScreenProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterProfileScreenProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterProfileScreenProtocol {
    
}
