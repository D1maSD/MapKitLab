//
//  SignUpPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

class SignUpPresenter: ViewInputSignUpProtocol {

    // MARK: Properties
    //         View Output (Presenter -> View)
    var view: ViewOutputSignUpProtocol?
    var interactor: InteractorInputSignUpProtocol?
    var router: RouterInputSignUpProtocol?
    
    
}

//                         View Output (Presenter -> View)
extension SignUpPresenter: ViewOutputSignUpProtocol {
    func showAlert(error type: TypesOfAlert) {
        print("ViewOutputSignUpProtocol")
    }
    
    // events form view come to this protocol
    func signUp(loginField: String, emailField: String, passwordField: String, confirmField: String) {
        print("signUpTapped  2  ")
        interactor?.createAccount(login: loginField, email: emailField, password: passwordField, confirmPassword: confirmField)
    }
}


extension SignUpPresenter: InteractorOutputSignUpProtocol {
    func didRecieve(error: TypesOfAlert) {
        print("signUpTapped  5  ")
//        router?.showAlert(error: error)
        view?.showAlert(error: error)
    }
    
    func didCreateAccount(with Login: String) {
        view?.showAlert(error: .regSuccessful)
        
        router?.openAuthScreen(with: Login)
        print("didCreateAccount(with Login: String)")
    }
    
}
