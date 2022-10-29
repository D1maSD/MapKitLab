//
//  PlaylistContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewPlaylistProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterPlaylistProtocol {
    
    var view: PresenterToViewPlaylistProtocol? { get set }
    var interactor: PresenterToInteractorPlaylistProtocol? { get set }
    var router: PresenterToRouterPlaylistProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPlaylistProtocol {
    
    var presenter: InteractorToPresenterPlaylistProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPlaylistProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPlaylistProtocol {
    
}
