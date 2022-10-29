//
//  SheduleLabContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSheduleLabProtocol: AnyObject {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSheduleLabProtocol: AnyObject {
    
    var view: PresenterToViewSheduleLabProtocol? { get set }
    var interactor: PresenterToInteractorSheduleLabProtocol? { get set }
    var router: PresenterToRouterSheduleLabProtocol? { get set }
    
    
    func numberOfRowsInSection() -> Int
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
    
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSheduleLabProtocol: AnyObject {
    
    var presenter: InteractorToPresenterSheduleLabProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSheduleLabProtocol: AnyObject {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSheduleLabProtocol: AnyObject {
    
}
