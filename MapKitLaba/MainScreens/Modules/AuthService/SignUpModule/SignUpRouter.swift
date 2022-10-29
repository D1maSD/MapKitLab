//
//  SignUpRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

class SignUpRouter: PresenterToRouterSignUpProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = SignUpViewController()
        
        let presenter: ViewToPresenterSignUpProtocol & InteractorToPresenterSignUpProtocol = SignUpPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SignUpRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SignUpInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
