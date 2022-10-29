//
//  NewsLabContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewNewsLabProtocol: AnyObject {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNewsLabProtocol {
    
    var view: PresenterToViewNewsLabProtocol? { get set }
    var interactor: PresenterToInteractorNewsLabProtocol? { get set }
    var router: PresenterToRouterNewsLabProtocol? { get set }
    
    func numberOfRowsInSection() -> Int
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNewsLabProtocol {
    
    var presenter: InteractorToPresenterNewsLabProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNewsLabProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNewsLabProtocol {
    
}
