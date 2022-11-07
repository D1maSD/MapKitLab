//
//  SignInContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol ViewOutputSignInProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewInputSignInProtocol {
    
    var view: ViewOutputSignInProtocol? { get set }
    var interactor: InteractorInputSignInProtocol? { get set }
    var router: RouterInputSignInProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol InteractorInputSignInProtocol {
    
    var presenter: InteractorOutputSignInProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorOutputSignInProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol RouterInputSignInProtocol {
    
}
