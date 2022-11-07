//
//  SignUpContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol ViewOutputSignUpProtocol {
    
    func showAlert(error type: TypesOfAlert)
}


// MARK: View Input (View -> Presenter)
protocol ViewInputSignUpProtocol {
    
    var view: ViewOutputSignUpProtocol? { get set }
    var interactor: InteractorInputSignUpProtocol? { get set }
    var router: RouterInputSignUpProtocol? { get set }
    
    func signUp(
        loginField: String,
        emailField: String,
        passwordField: String,
        confirmField: String
    )
    
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol InteractorInputSignUpProtocol {
    
    var presenter: InteractorOutputSignUpProtocol? { get set }
    // Interactor must have a method to create account
    func createAccount(
        login: String,
        email: String,
        password: String,
        confirmPassword: String
    )
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorOutputSignUpProtocol {
    //iteractor returns a response to createAcc func
    func didRecieve(error: TypesOfAlert)
    // in success
    func didCreateAccount(with Login: String)
}


// MARK: Router Input (Presenter -> Router)
protocol RouterInputSignUpProtocol {
    func openAuthScreen(with login: String)
    func showAlert(error type: TypesOfAlert)
}
