//
//  SheduleLabRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import Foundation
import UIKit

class SheduleLabRouter: PresenterToRouterSheduleLabProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = SheduleLabViewController()
        
        let presenter: ViewToPresenterSheduleLabProtocol & InteractorToPresenterSheduleLabProtocol = SheduleLabPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SheduleLabRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SheduleLabInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
