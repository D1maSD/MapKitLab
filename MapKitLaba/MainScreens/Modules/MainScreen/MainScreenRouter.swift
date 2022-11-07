//
//  MainScreenRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.11.2022.
//  
//

import Foundation
import UIKit

class MainScreenRouter: PresenterToRouterMainScreenProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = MainScreenViewController()
        
        let presenter: ViewToPresenterMainScreenProtocol & InteractorToPresenterMainScreenProtocol = MainScreenPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MainScreenRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MainScreenInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
