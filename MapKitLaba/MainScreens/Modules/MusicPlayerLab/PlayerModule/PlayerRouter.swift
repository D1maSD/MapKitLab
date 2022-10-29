//
//  PlayerRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

class PlayerRouter: PresenterToRouterPlayerProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = PlayerViewController()
        
        let presenter: ViewToPresenterPlayerProtocol & InteractorToPresenterPlayerProtocol = PlayerPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = PlayerRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PlayerInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
