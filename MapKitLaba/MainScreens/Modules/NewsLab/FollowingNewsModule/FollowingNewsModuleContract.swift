//
//  FollowingNewsModuleContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewFollowingNewsModuleProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterFollowingNewsModuleProtocol {
    
    var view: PresenterToViewFollowingNewsModuleProtocol? { get set }
    var interactor: PresenterToInteractorFollowingNewsModuleProtocol? { get set }
    var router: PresenterToRouterFollowingNewsModuleProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorFollowingNewsModuleProtocol {
    
    var presenter: InteractorToPresenterFollowingNewsModuleProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterFollowingNewsModuleProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterFollowingNewsModuleProtocol {
    
}
