//
//  NoteContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.11.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewNoteProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNoteProtocol {
    
    var view: PresenterToViewNoteProtocol? { get set }
    var interactor: PresenterToInteractorNoteProtocol? { get set }
    var router: PresenterToRouterNoteProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNoteProtocol {
    
    var presenter: InteractorToPresenterNoteProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNoteProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNoteProtocol {
    
}
