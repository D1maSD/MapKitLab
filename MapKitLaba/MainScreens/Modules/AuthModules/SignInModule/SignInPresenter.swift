//
//  SignInPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

class SignInPresenter: ViewInputSignInProtocol {

    // MARK: Properties
    var view: ViewOutputSignInProtocol?
    var interactor: InteractorInputSignInProtocol?
    var router: RouterInputSignInProtocol?
}

extension SignInPresenter: InteractorOutputSignInProtocol {
    
}
