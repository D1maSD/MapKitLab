//
//  CurrentNewsRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation
import UIKit

class CurrentNewsRouter: PresenterToRouterCurrentNewsProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = CurrentNewsViewController()
        
        let presenter: ViewToPresenterCurrentNewsProtocol & InteractorToPresenterCurrentNewsProtocol = CurrentNewsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CurrentNewsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CurrentNewsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
