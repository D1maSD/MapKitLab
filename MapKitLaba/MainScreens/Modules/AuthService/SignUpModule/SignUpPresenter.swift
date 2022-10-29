//
//  SignUpPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

class SignUpPresenter: ViewToPresenterSignUpProtocol {

    // MARK: Properties
    var view: PresenterToViewSignUpProtocol?
    var interactor: PresenterToInteractorSignUpProtocol?
    var router: PresenterToRouterSignUpProtocol?
}

extension SignUpPresenter: InteractorToPresenterSignUpProtocol {
    
}
