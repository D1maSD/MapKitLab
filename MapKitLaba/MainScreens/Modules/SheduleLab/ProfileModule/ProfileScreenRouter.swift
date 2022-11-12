//
//  ProfileScreenRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

class ProfileScreenRouter: PresenterToRouterProfileScreenProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = ProfileScreenViewController()
        
        let presenter: ViewToPresenterProfileScreenProtocol & InteractorToPresenterProfileScreenProtocol = ProfileScreenPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ProfileScreenRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ProfileScreenInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

4244f74d617ff44b0839a83f95af93a3cad8b8d7
