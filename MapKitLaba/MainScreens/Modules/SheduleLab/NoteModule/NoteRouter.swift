//
//  NoteRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.11.2022.
//  
//

import Foundation
import UIKit

class NoteRouter: PresenterToRouterNoteProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = NoteViewController()
        
        let presenter: ViewToPresenterNoteProtocol & InteractorToPresenterNoteProtocol = NotePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = NoteRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = NoteInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
