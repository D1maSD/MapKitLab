//
//  PlaylistRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

class PlaylistRouter: PresenterToRouterPlaylistProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = PlaylistViewController()
        
        let presenter: ViewToPresenterPlaylistProtocol & InteractorToPresenterPlaylistProtocol = PlaylistPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = PlaylistRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PlaylistInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
