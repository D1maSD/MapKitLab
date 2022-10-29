//
//  FollowingNewsModuleRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation
import UIKit

class FollowingNewsModuleRouter: PresenterToRouterFollowingNewsModuleProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = FollowingNewsModuleViewController()
        
        let presenter: ViewToPresenterFollowingNewsModuleProtocol & InteractorToPresenterFollowingNewsModuleProtocol = FollowingNewsModulePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = FollowingNewsModuleRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = FollowingNewsModuleInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
