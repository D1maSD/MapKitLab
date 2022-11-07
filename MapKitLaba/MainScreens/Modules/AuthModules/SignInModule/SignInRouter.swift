//
//  SignInRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

class SignInRouter: RouterInputSignInProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = SignInViewController()
        
        let presenter: ViewInputSignInProtocol & InteractorOutputSignInProtocol = SignInPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SignInRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SignInInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
