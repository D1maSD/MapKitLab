//
//  SignUpInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
//                      Interactor Input (Presenter -> Interactor)
class SignUpInteractor: InteractorInputSignUpProtocol {
    var presenter: InteractorOutputSignUpProtocol?
    
    func createAccount(
        login: String,
        email: String,
        password: String,
        confirmPassword: String
    ) {
        print("createAccount")
        
        print("signUpTapped  3  ")
        
        let response = SignUpService.signUp(
            loginField: login,
            emailField: email,
            passwordField: password,
            confirmField: confirmPassword
        )
         
         presenter?.didRecieve(error: response)
        
        // MARK: - signUp
//        func signUp(
//            loginField: String,
//            emailField: String,
//            passwordField: String,
//            confirmField: String
//        ) {
//
//
//
//    }


    // MARK: Properties
    //             Interactor Output (Interactor -> Presenter)
    }
}
