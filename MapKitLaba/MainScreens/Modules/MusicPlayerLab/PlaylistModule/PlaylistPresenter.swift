//
//  PlaylistPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

class PlaylistPresenter: ViewToPresenterPlaylistProtocol {

    // MARK: Properties
    var view: PresenterToViewPlaylistProtocol?
    var interactor: PresenterToInteractorPlaylistProtocol?
    var router: PresenterToRouterPlaylistProtocol?
}

extension PlaylistPresenter: InteractorToPresenterPlaylistProtocol {
    
}
