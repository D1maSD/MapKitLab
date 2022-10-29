//
//  SignInPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

class SignInPresenter: ViewToPresenterSignInProtocol {

    // MARK: Properties
    var view: PresenterToViewSignInProtocol?
    var interactor: PresenterToInteractorSignInProtocol?
    var router: PresenterToRouterSignInProtocol?
}

extension SignInPresenter: InteractorToPresenterSignInProtocol {
    
}
