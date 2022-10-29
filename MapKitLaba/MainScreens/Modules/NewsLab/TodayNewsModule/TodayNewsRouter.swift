//
//  NewsLabRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation
import UIKit

class NewsLabRouter: PresenterToRouterNewsLabProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = NewsLabViewController()
        
        let presenter: ViewToPresenterNewsLabProtocol & InteractorToPresenterNewsLabProtocol = NewsLabPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = NewsLabRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = NewsLabInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
