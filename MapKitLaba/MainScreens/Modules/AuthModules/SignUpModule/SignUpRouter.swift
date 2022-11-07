//
//  SignUpRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit
enum TypesOfAlert {
    case emptyFields
    case accountExists
    case regSuccessful
    case passwordError
    case registrationFailed
    case randomSystemError
}
//                  Router Input (Presenter -> Router)
class SignUpRouter: RouterInputSignUpProtocol {
    
    weak var rootViewController: UIViewController?
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = SignUpViewController()
        
        let presenter: ViewInputSignUpProtocol & InteractorOutputSignUpProtocol = SignUpPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SignUpRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SignUpInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func openAuthScreen(with login: String) {
        
        print("openAuthScreen")
//        let viewController = SignInViewController()
        let viewController = SignInRouter.createModule()
        
        rootViewController?.present(viewController, animated: true, completion: {
            print("SignInViewController presented")
        })
    }
    
    
    
    func showAlert(error type: TypesOfAlert) {
        
        let viewController = SignUpViewController()
        
        print("signUpTapped  6  ")
        switch type {
        case .emptyFields:
            let alert = UIAlertController(
                title: "Error",
                message: "Not all fields are filled in",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            viewController.present(alert, animated: true, completion: nil)
//            self.rootViewController?.present(alert, animated: true)
            
        case .accountExists:
            let alert = UIAlertController(
                title: "Account Exists",
                message: "There is an account with this email address.",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            viewController.present(alert, animated: true, completion: nil)
            
        case .regSuccessful:
            let alert = UIAlertController(title: "Registration Successful", message: "You are redirected to the login page", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            viewController.present(alert, animated: true, completion: nil)
            print("Registration Successful")
            print("Registration Successful")
            print("Registration Successful")
            print("Registration Successful")
            print("Registration Successful")
            print("Registration Successful")
            self.openAuthScreen(with: "good")
//            SignInRouter.createModule()
            
            
        case .passwordError:
            let alert = UIAlertController(title: "Password Error", message: "Passwords do not match", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            viewController.present(alert, animated: true, completion: nil)
            
        case .registrationFailed:
            let alert = UIAlertController(title: "Registration failed", message: "Check email and password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            viewController.present(alert, animated: true, completion: nil)
            
        case .randomSystemError:
            let alert = UIAlertController(title: "Error", message: "Some system error. Please try again.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            viewController.present(alert, animated: true, completion: nil)
        }
    }

}
