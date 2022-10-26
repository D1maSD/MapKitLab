//
//  SignInViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.09.2022.
//

import UIKit
import SnapKit
import CoreData


class SignUpViewControllerTwo: UIViewController {
    
    var signInButton = UIButton()
    var signUpButton = UIButton()
    var delegate: SignUpDelegate?
    var switcher = UISwitch()
    var agreeWith = UILabel(text: "Agree with rules")
    
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
    
    
    override func viewDidLoad() {
        
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
    
    
    @objc func signUpTapped() {
        //        delegate?.emailValidation(loginTextField, emailTextField)
        signUp(loginField: loginTextField, emailField: emailTextField, passwordField: passwordTextField, confirmField: confirmPasswordTextField)
        
        print(loginTextField.text)
        print(emailTextField.text)
        print(confirmPasswordTextField.text)
        print(passwordTextField.text)
    }
    
    @objc func signInTapped() {
        self.navigationController?.pushViewController(SignInViewControllerTwo(), animated: true)
    }
    
    // MARK: emailValidation()
    
    func signUp(
        loginField: UITextField,
        emailField: UITextField,
        passwordField: UITextField,
        confirmField: UITextField
    ) {
        
        let passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserEntitiy", into: context)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntitiy")
        
        
        //MARK: Check fields are not empty
        
        guard emailField.text !=  "" || passwordField.text !=  "" || loginField.text !=  "" || confirmField.text != "" else {
            
            let alert = UIAlertController(
                title: "Error",
                message: "Not all fields are filled in",
                preferredStyle: .alert
            )
            
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        
        
        
        
        //        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserEntitiy", into: context) as NSManagedObject
        //        newUser.setValue(loginField.text, forKey: "id")
        //        newUser.setValue(passwordField.text, forKey: "password")
        
 
        
        
        //MARK: Check fields are not empty
        
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                
                let mail = result.value(forKey: "email") as? String
                let password = result.value(forKey: "password") as? String
                
                if emailField.text == mail || passwordField.text == password {
                    
                    
                    let alert = UIAlertController(title: "Account Exists", message: "There is an account with this email address.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okAction)
                    // showAlert
                    self.present(alert, animated: true, completion: nil)
                    
                }
            }
            
            
            if ((passwordField.text?.range(of: passwordPattern, options: .regularExpression) != nil) && (emailField.text?.range(of: emailRegEx, options: .regularExpression) != nil)) {
                
                //MARK: if passwordField == confirmField
                if (passwordField.text == confirmField.text) {
                    
                    
                    //MARK: password.setValue  mail.setValue
                    newUser.setValue(passwordField.text, forKey: "password")
                    newUser.setValue(emailField.text, forKey: "email")
                    newUser.setValue(loginField.text, forKey: "id")
                    try context.save()
                    
                    print(newUser)
                    print("OBJECT SAVED.")
                    
                    let alert = UIAlertController(title: "Registration Successful", message: "You are redirected to the login page", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                        
//                        _ = self.navigationController?.popViewController(animated: true)
                        
                    }
                    
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    //MARK: alert Password Error
                } else {
                    let alert = UIAlertController(title: "Password Error", message: "Passwords do not match", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okAction)
                    // showAlert
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
            else {
                
                let alert = UIAlertController(title: "Registration failed", message: "Check email and password", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                // PRESENT ALERT
                self.present(alert, animated: true, completion: nil)
            }
            
        } catch let error as NSError {
            
            let alert = UIAlertController(title: "Error", message: "Some system error. Please try again.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            // showAlert
            self.present(alert, animated: true, completion: nil)
            
            print(error.localizedDescription)
            print(error.localizedDescription)
            print(error.localizedDescription)
        }
        
    }
}
