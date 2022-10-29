//
//  SignUpContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSignUpProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSignUpProtocol {
    
    var view: PresenterToViewSignUpProtocol? { get set }
    var interactor: PresenterToInteractorSignUpProtocol? { get set }
    var router: PresenterToRouterSignUpProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSignUpProtocol {
    
    var presenter: InteractorToPresenterSignUpProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSignUpProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSignUpProtocol {
    
}
