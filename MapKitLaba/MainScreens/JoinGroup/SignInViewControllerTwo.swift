//
//  SignInViewControllerTwo.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 24.10.2022.
//

import UIKit
import SnapKit
import CoreData


class SignInViewControllerTwo: UIViewController {
    
    var signInButton = UIButton()
    var signUpButton = UIButton()
    var delegate: SignUpDelegate?
    var result = NSArray()
    
    var passwordArray = [String]()
    var mailArray = [String]()
    
    var orLabel = UILabel(style: .boldTextLabel.compose(with: ViewStyle<UILabel> {
        $0.textAlignment = .center
    }))
    
    
    struct Model {
        var style: ViewStyle<UIButton>
        var title: String
        var didTap: () -> Void
    }
    
    
    var model: String? {
        didSet {
            self.passwordTextField = BaseTextField(model ?? "")
        }
    }
    
    var emailModel: String? {
        didSet {
            self.emailTextField = BaseTextField(emailModel ?? "")
        }
    }
    
    var emailTextField = BaseTextField()
    var passwordTextField = BaseTextField()
    
    override func viewDidLoad() {
        
        
        model = "Password"
        emailModel = "Email"
        
        orLabel.text = "Or"
        
        signInButton = UIButton(style: .sighUpButtonStyle)
        signUpButton = UIButton(style: .sighUpButtonStyle)
        
        //        signInButton.addTarget(self, action: #selector(prito), for: .touchUpInside)
        //        signUpButton.addTarget(self, action: #selector(prito), for: .touchUpInside)
        
        signInButton.setTitle("Sign In", for: .normal)
        signUpButton.setTitle("Sign Up", for: .normal)
        passwordTextField.isSecureTextEntry = true
        view.backgroundColor = .white
        setup()
    }
    
    
    private func setup() {
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(orLabel)
        
        self.view.addSubview(signInButton)
        self.view.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.height.equalTo(52)
            $0.top.equalToSuperview().offset(140)
            $0.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(emailTextField.snp.centerX)
        }
        
        signInButton.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(25)
            $0.right.equalTo(view.snp.right).offset(-25)
            $0.bottom.equalTo(orLabel.snp.top).offset(-30)
            $0.height.equalTo(67)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        orLabel.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(25)
            $0.right.equalTo(view.snp.right).offset(-25)
            $0.bottom.equalTo(signUpButton.snp.top).offset(-15)
        }
        
        signUpButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            //            $0.top.equalTo(orLabel.snp.bottom).offset(15)
            $0.bottom.equalTo(view.snp.bottom).offset(-150)
            $0.height.equalTo(67)
            $0.centerX.equalTo(emailTextField.snp.centerX)
        }
    }
    
    @objc func signInTapped() {
        
        checkForUserNameAndPasswordMatch(emailField: emailTextField.text ?? "", passwordField: passwordTextField.text ?? "")
    }
    
    // MARK: emailValidation() signIn

    func checkForUserNameAndPasswordMatch(emailField: String, passwordField: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // #2 create context
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate(format: "userName = %@", emailField)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntitiy")
        
        //        fetchRequest.predicate = predicate
        
        
        do {
            
            let results = try managedObjectContext.fetch(fetchRequest)
            
            if results.count > 0 {
                
                
                for result in results as! [NSManagedObject] {
                    
                    let email = result.value(forKey: "email") as! String
                    let password = result.value(forKey: "password") as! String
                    
                    if emailField == email || passwordField == password {
                        
                        let alert = UIAlertController(title: "Account Exists", message: "There is an account with this email address.", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(okAction)
                        // showAlert
                        self.present(alert, animated: true, completion: nil)
                        
                        
                        
                        
                        if email == result.value(forKey: "email") as? String {
                            if emailTextField.text == email {
                                if password == result.value(forKey: "password") as? String {
                                    if passwordTextField.text == password {
                                        
                                        let alert = UIAlertController(
                                            title: "Success",
                                            message: "Authorization complete",
                                            preferredStyle: .alert
                                        )
                                        let action = UIAlertAction(title: "OK", style: .default)
                                        alert.addAction(action)
                                        self.present(alert, animated: true, completion: nil)
                                        
                                    } else {
                                        
                                        let alert = UIAlertController(
                                            title: "Error",
                                            message: "Wrong email or password",
                                            preferredStyle: .alert
                                        )
                                        let action = UIAlertAction(title: "OK", style: .default)
                                        alert.addAction(action)
                                        self.present(alert, animated: true, completion: nil)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch {
            let alert = UIAlertController(
                title: "Error",
                message: "Technical issue. Try again",
                preferredStyle: .alert
            )
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
