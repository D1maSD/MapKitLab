//
//  NotePresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.11.2022.
//  
//

import Foundation

class NotePresenter: ViewToPresenterNoteProtocol {

    // MARK: Properties
    var view: PresenterToViewNoteProtocol?
    var interactor: PresenterToInteractorNoteProtocol?
    var router: PresenterToRouterNoteProtocol?
}

extension NotePresenter: InteractorToPresenterNoteProtocol {
    
}
