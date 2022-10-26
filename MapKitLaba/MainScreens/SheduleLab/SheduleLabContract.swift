//
//  SheduleLabContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSheduleLabProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSheduleLabProtocol {
    
    var view: PresenterToViewSheduleLabProtocol? { get set }
    var interactor: PresenterToInteractorSheduleLabProtocol? { get set }
    var router: PresenterToRouterSheduleLabProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSheduleLabProtocol {
    
    var presenter: InteractorToPresenterSheduleLabProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSheduleLabProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSheduleLabProtocol {
    
}
