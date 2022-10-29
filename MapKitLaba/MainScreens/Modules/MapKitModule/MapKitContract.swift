//
//  MapKitContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMapKitProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMapKitProtocol {
    
    var view: PresenterToViewMapKitProtocol? { get set }
    var interactor: PresenterToInteractorMapKitProtocol? { get set }
    var router: PresenterToRouterMapKitProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMapKitProtocol {
    
    var presenter: InteractorToPresenterMapKitProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMapKitProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMapKitProtocol {
    
}
