//
//  SignUpViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import UIKit
import SnapKit
import CoreData

class SignUpViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orLabel.text = "Or"
        passwordModel = "Password"
        model = "Email"
        loginModel = "Login"
        confirmPasswordModel = "Confirm password"
        //            emailValidation(cell.emailTextField, cell.passwordTextField)
        
        
        signInButton = UIButton(style: .sighUpButtonStyle)
        signUpButton = UIButton(style: .sighUpButtonStyle)
        
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signInButton.setTitle("Sign In", for: .normal)
        
        //        passwordTextField.isSecureTextEntry = true
        //        confirmPasswordTextField.isSecureTextEntry = true
        
        self.view.backgroundColor = .white
        setup()
    }
    
    // MARK: - Properties
    // MARK: View Input (View -> Presenter)
    var presenter: ViewInputSignUpProtocol?
    
    // MARK: View Input (View -> Output)
    var output: ViewOutputSignUpProtocol?
    
    
    
    struct Model {
        var style: ViewStyle<UIButton>
        var title: String
        var didTap: () -> Void
    }
    
    var signInButton = UIButton()
    var signUpButton = UIButton()
    var switcher = UISwitch()
    var agreeWith = UILabel(text: "Agree with rules")
    
    var passwordArray = [String]()
    var mailArray = [String]()
    
    var orLabel = UILabel(style: .boldTextLabel.compose(with: ViewStyle<UILabel> {
        $0.textAlignment = .center
    }))
    
    var model: String? {
        didSet {
            self.emailTextField = BaseTextField(model ?? "")
        }
    }
    
    var loginModel: String? {
        didSet {
            self.loginTextField = BaseTextField(loginModel ?? "")
        }
    }
    
    var passwordModel: String? {
        didSet {
            self.passwordTextField = BaseTextField(passwordModel ?? "")
        }
    }
    
    var confirmPasswordModel: String? {
        didSet {
            self.confirmPasswordTextField = BaseTextField(confirmPasswordModel ?? "")
        }
    }
    
    var loginTextField = BaseTextField()
    
    var emailTextField = BaseTextField()
    
    var passwordTextField = BaseTextField()
    
    var confirmPasswordTextField = BaseTextField()
    
    

    // MARK: - signInTapped
    @objc func signInTapped() {
        self.navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    
    // MARK: - setUpLayout
    private func setup() {
        
        view.addSubview(loginTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(orLabel)
        view.addSubview(switcher)
        view.addSubview(agreeWith)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        switcher.translatesAutoresizingMaskIntoConstraints = false
        
        loginTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.height.equalTo(52)
            $0.top.equalToSuperview().offset(120)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(loginTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(loginTextField.snp.centerX)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(loginTextField.snp.centerX)
        }
        
        confirmPasswordTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(loginTextField.snp.centerX)
        }
        
        agreeWith.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(35)
            $0.left.equalTo(view.snp.left).offset(20)
            $0.width.equalTo(200)
        }
        
        switcher.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(35)
            $0.right.equalTo(view.snp.right).offset(-20)
            $0.width.equalTo(50)
            $0.height.equalTo(30)
        }
        
        signUpButton.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(25)
            $0.right.equalTo(view.snp.right).offset(-25)
            $0.top.equalTo(switcher.snp.bottom).offset(30)
            $0.height.equalTo(67)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        
        orLabel.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(25)
            $0.right.equalTo(view.snp.right).offset(-25)
            $0.top.equalTo(signUpButton.snp.bottom).offset(30)
            //            $0.bottom.equalToSuperview().offset(bottomOffset)
            //            $0.centerX.centerY.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.top.equalTo(orLabel.snp.bottom).offset(15)
            $0.height.equalTo(67)
            $0.centerX.equalTo(loginTextField.snp.centerX)
        }
    }
}


extension SignUpViewController: ViewOutputSignUpProtocol {
    // TODO: Implement View Output Methods
    
    // MARK: - signUpTapped
    
    @objc func signUpTapped() {
        //        delegate?.emailValidation(loginTextField, emailTextField)
        
        print("signUpTapped  1  ")

        
        presenter?.signUp(loginField: loginTextField.text ?? "", emailField: emailTextField.text ?? "", passwordField: passwordTextField.text ?? "", confirmField: confirmPasswordTextField.text ?? "")

    }
    
    func showAlert(error type: TypesOfAlert) {
                
        print("signUpTapped  7  ")
        switch type {
        case .emptyFields:
            let alert = UIAlertController(
                title: "Error",
                message: "Not all fields are filled in",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        case .accountExists:
            let alert = UIAlertController(
                title: "Account Exists",
                message: "There is an account with this email address.",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        case .regSuccessful:
            let alert = UIAlertController(title: "Registration Successful", message: "You are redirected to the login page", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            print("Registration Successful")
            print("Registration Successful")
            print("Registration Successful")
            print("Registration Successful")
            print("Registration Successful")
            print("Registration Successful")
//            self.openAuthScreen(with: "good")
//            SignInRouter.createModule()
            
            
        case .passwordError:
            let alert = UIAlertController(title: "Password Error", message: "Passwords do not match", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        case .registrationFailed:
            let alert = UIAlertController(title: "Registration failed", message: "Check email and password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        case .randomSystemError:
            let alert = UIAlertController(title: "Error", message: "Some system error. Please try again.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
