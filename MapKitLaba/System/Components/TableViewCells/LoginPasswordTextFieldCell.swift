////
////  LoginPasswordTextFieldCell.swift
////  MapKitLaba
////
////  Created by Мельник Дмитрий on 21.10.2022.
////
//
//import UIKit
//import CoreData
//
//class LoginPasswordTextFieldCell: Cell {
//
//    var signInButton = UIButton()
//    var signUpButton = UIButton()
//    var delegate: SignUpDelegate?
//
//    var orLabel = UILabel(style: .boldTextLabel.compose(with: ViewStyle<UILabel> {
//        $0.textAlignment = .center
//    }))
//
//
//    struct Model {
//        var style: ViewStyle<UIButton>
//        var title: String
//        var didTap: () -> Void
//    }
//
//
//    var model: String? {
//        didSet {
//            self.passwordTextField = BaseTextField(model ?? "")
//        }
//    }
//
//    var emailModel: String? {
//        didSet {
//            self.emailTextField = BaseTextField(emailModel ?? "")
//        }
//    }
//
//    var emailTextField: BaseTextField! {
//        didSet {
//            setup()
//        }
//    }
//
//    var passwordTextField = BaseTextField()
//
//
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        signInButton.setTitle("Sign In", for: .normal)
//        signInButton = UIButton(style: .sighUpButtonStyle)
//
//
//        signUpButton.setTitle("Sign Up", for: .normal)
//        signUpButton = UIButton(style: .sighUpButtonStyle)
//        orLabel.text = "Or"
//    }
//
//    private func setup() {
//
//
//
//
//        contentView.addSubview(emailTextField)
//        contentView.addSubview(passwordTextField)
//        contentView.addSubview(orLabel)
//
//        self.contentView.addSubview(signInButton)
//        self.contentView.addSubview(signUpButton)
//
//        signUpButton.translatesAutoresizingMaskIntoConstraints = false
//        signInButton.translatesAutoresizingMaskIntoConstraints = false
//        orLabel.translatesAutoresizingMaskIntoConstraints = false
//
//
//
//        emailTextField.snp.makeConstraints {
//            $0.left.equalToSuperview().offset(25)
//            $0.right.equalToSuperview().offset(-25)
//            $0.height.equalTo(52)
//            $0.top.equalToSuperview().offset(10)
//            $0.centerX.equalToSuperview()
//        }
//
//        passwordTextField.snp.makeConstraints {
//            $0.left.equalToSuperview().offset(25)
//            $0.right.equalToSuperview().offset(-25)
//            $0.height.equalTo(52)
//            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
//            $0.centerX.equalTo(emailTextField.snp.centerX)
//        }
//
//        signInButton.snp.makeConstraints {
//            $0.left.equalTo(contentView.snp.left).offset(25)
//            $0.right.equalTo(contentView.snp.right).offset(-25)
//            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
//            $0.height.equalTo(67)
//            $0.centerX.equalTo(contentView.snp.centerX)
//        }
//
//
//        orLabel.snp.makeConstraints {
//            $0.left.equalTo(contentView.snp.left).offset(25)
//            $0.right.equalTo(contentView.snp.right).offset(-25)
//            $0.top.equalTo(signInButton.snp.bottom).offset(30)
////            $0.bottom.equalToSuperview().offset(bottomOffset)
////            $0.centerX.centerY.equalToSuperview()
//        }
//
//        signUpButton.snp.makeConstraints {
//            $0.left.equalToSuperview().offset(25)
//            $0.right.equalToSuperview().offset(-25)
//            $0.top.equalTo(orLabel.snp.bottom).offset(15)
//            $0.height.equalTo(67)
//            $0.centerX.equalTo(emailTextField.snp.centerX)
//        }
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    @objc func signInTapped() {
//        delegate?.emailValidation(emailTextField, passwordTextField)
////        print(emailTextField.text)
////        print(passwordTextField.text)
//    }
//
//    @objc func prito() {
//
//        print("emailTextField.text")
//        print("passwordTextField.text")
//    }
//}
//
//import CoreData
//
//
//
//
//
//class SignUpDelegate {
//
//    var mailArray = [String]()
//    var passwordArray = [String]()
//
//
//    @objc func emailValidation(
//        _ emailField: UITextField,
//        _ passwordField: UITextField
//    ) {
//
//
//        // #1 link for AppDelegate
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        // #2 create context
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//        // #3 create entity description
//        let entityDescription = NSEntityDescription.entity(forEntityName: "UserEntitiy", in: context)
//
//        // #4 create object
//        let managedObject = NSManagedObject(entity: entityDescription ?? NSEntityDescription(), insertInto: context)
//
//        //#5 set value
//
//        managedObject.setValue("@mail.ru", forKey: "email")
//        managedObject.setValue(21, forKey: "age")
//
//        let mail = managedObject.value(forKey: "email")
//        let age = managedObject.value(forKey: "age")
////        print("\(mail)\(age)")
//
//        //#6 save data
//        appDelegate.saveContext()
//
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntitiy")
//
//
//        do {
//            let results = try context.fetch(fetchRequest)
//            for result in results as! [NSManagedObject] {
//                if let mail = result.value(forKey: "email") as? String {
//                    self.mailArray.append(mail)
//                }
//                if let password = result.value(forKey: "password") as? String {
//                    self.passwordArray.append(password)
//                }
//            }
//        } catch {
//            print(error)
//        }
//
//
//        if (mailArray.contains(emailField.text!)) {
//            let mailIndex = mailArray.firstIndex(where: {
//                $0 == emailField.text
//            })
//
//            if passwordArray[mailIndex!] == passwordField.text {
//                print("PRESENT SignUpViewController")
//                print("PRESENT SignUpViewController")
//                print("PRESENT SignUpViewController")
//                //                self.navigationController?.pushViewController(SignUpViewController(), animated: true)
//            }
//        }
//        else {
//            let alert = UIAlertController(
//                title: "Error",
//                message: "Not found user with this email",
//                preferredStyle: .alert
//            )
//            let action = UIAlertAction(title: "OK", style: .default)
//            alert.addAction(action)
//            print("PRESENT ALERT")
//            print("PRESENT ALERT")
//            print("PRESENT ALERT")
//            //            self.present(alert, animated: true, completion: nil)
//        }
//    }
//
//    func signUp(
//        _ emailField: UITextField,
//        _ passwordField: UITextField
//    ) {
//
//        let passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
//
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        let password = NSEntityDescription.insertNewObject(forEntityName: "UserEntitiy", into: context)
//        let mail = NSEntityDescription.insertNewObject(forEntityName: "UserEntitiy", into: context)
//
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntitiy")
//
//        do {
//            let results = try context.fetch(fetchRequest)
//
//            for result in results as! [NSManagedObject] {
//                if let mail = result.value(forKey: "email") {
//                    self.mailArray.append(mail as! String)
//                }
//            }
//        } catch {
//            print(error)
//        }
//
//        if(mailArray.contains(emailField.text!)) {
//            let alert = UIAlertController(title: "Account Exists", message: "There is an account with this email address.", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
//                    UIAlertAction in
//                    _ =
//                print("POP VIEW CONTROLLER")
////                self.navigationController?.popViewController(animated: true)
//                }
//            alert.addAction(okAction)
//            // SHOW ALERT
////            self.present(alert, animated: true, completion: nil)
//            // PRESENT ALERT
//            print("PRESENT ALERT")
//        } else {
//            if ((passwordField.text?.range(of: passwordPattern, options: .regularExpression) != nil) && (emailField.text?.range(of: emailRegEx, options: .regularExpression) != nil)) {
//
//                // VERIFY TEXTFIELDS
////                if (passwordField.text == verifyField.text) {
//                if (passwordField.text == "verifyField.text") {
//                    //create alert
//                    let alert = UIAlertController(title: "Registration Successful", message: "You are redirected to the login page", preferredStyle: .alert)
//                    // ADD ACTION
//                    let okAction = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
//
//
////                        password.setValue(self.passwordLabel.text, forKey: "password")
////                        mail.setValue(self.mailLable.text, forKey: "email")
//
//
////                        _ = self.navigationController?.popViewController(animated: true)
//                        // POP VIEWCONTROLLER
////                        self.navigationController?.popViewController(animated: true)
//                    }
//                    alert.addAction(okAction)
//
////                    self.present(alert, animated: true, completion: nil)
//                } else {
//                    let alert = UIAlertController(title: "Password Error", message: "Passwords do not match", preferredStyle: .alert)
//                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//                    alert.addAction(okAction)
//                    // showAlert
////                    self.present(alert, animated: true, completion: nil)
//                }
//            } else {
//                let alert = UIAlertController(title: "Registration failed", message: "Check email and password", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//                alert.addAction(okAction)
//                // PRESENT ALERT
////                self.present()
//            }
//        }
//    }
//
//}
