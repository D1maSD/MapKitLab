//
//  SignInContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSignInProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSignInProtocol {
    
    var view: PresenterToViewSignInProtocol? { get set }
    var interactor: PresenterToInteractorSignInProtocol? { get set }
    var router: PresenterToRouterSignInProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSignInProtocol {
    
    var presenter: InteractorToPresenterSignInProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSignInProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSignInProtocol {
    
}
