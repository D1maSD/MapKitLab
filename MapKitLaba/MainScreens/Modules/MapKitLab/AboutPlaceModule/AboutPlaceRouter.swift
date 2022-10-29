//
//  AboutPlaceRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

class AboutPlaceRouter: PresenterToRouterAboutPlaceProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = AboutPlaceViewController()
        
        let presenter: ViewToPresenterAboutPlaceProtocol & InteractorToPresenterAboutPlaceProtocol = AboutPlacePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AboutPlaceRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AboutPlaceInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
