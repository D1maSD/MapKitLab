//
//  SignInViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.09.2022.
//

import UIKit
import CoreData
import SnapKit


class SignInViewController: UIViewController {
    
    private var tableView = UITableView()
    static var typeOf = Int()
    public var typeWith = Int()
    var signInButton = UIButton()
    var signUpButton = UIButton()
    var delegate: SignUpDelegate?
    
    var mailArray = [String]()
    var passwordArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setup()
        
    }
    
    func setupType(_ number: Int) {
        self.typeWith = number
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = self.view.bounds
        
    }
    
    func configureTableView() {
        view.backgroundColor = .white
        self.view.addSubview(tableView)
        
        //        tableView.snp.makeConstraints {
        //            $0.height.equalTo(400)
        //            $0.left.equalToSuperview()
        //            $0.right.equalToSuperview()
        //            $0.top.equalToSuperview()
        //        }
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BaseDescriptionCell.self, forCellReuseIdentifier: "\(BaseDescriptionCell.self)")
        tableView.register(BaseTextFieldCell.self, forCellReuseIdentifier: "\(BaseTextFieldCell.self)")
        tableView.register(BaseButtonStyle.self, forCellReuseIdentifier: "\(BaseButtonStyle.self)")
        tableView.register(LoginPasswordTextFieldCell.self, forCellReuseIdentifier: "\(LoginPasswordTextFieldCell.self)")
        
        
    }
    
    func setup() {
        
        //        signInButton.setTitle("Sign In", for: .normal)
        //        signInButton = UIButton(style: .sighUpButtonStyle)
        //        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        //
        //        view.addSubview(signInButton)
        //        signInButton.translatesAutoresizingMaskIntoConstraints = false
        //
        //        signInButton.snp.makeConstraints {
        //            $0.left.equalToSuperview().offset(25)
        //            $0.right.equalToSuperview().offset(-25)
        //            $0.top.equalTo(tableView.snp.bottom).offset(15)
        //            $0.height.equalTo(67)
        //            $0.centerX.equalToSuperview()
        //        }
        //
        //
        //
        //        signUpButton.setTitle("Sign Up", for: .normal)
        //        signUpButton = UIButton(style: .sighUpButtonStyle)
        //        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        //
        //        view.addSubview(signUpButton)
        //        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        //
        //        signUpButton.snp.makeConstraints {
        //            $0.left.equalToSuperview().offset(25)
        //            $0.right.equalToSuperview().offset(-25)
        //            $0.top.equalTo(signInButton.snp.bottom).offset(15)
        //            $0.height.equalTo(67)
        //            $0.centerX.equalTo(signInButton.center.x)
        //        }
    }
    
    @objc func signUpButtonTapped() {
        
    }
    
    @objc func signInButtonTapped() {
        
        
        //        emailValidation()
        
    }
    
    
}

extension SignInViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: BaseDescriptionCell = tableView.dequeueReusableCell(for: indexPath)
            cell.descLabel.text = "Sign in"
            return cell
            
        case 1:
            let cell: LoginPasswordTextFieldCell = tableView.dequeueReusableCell(for: indexPath)
            cell.model = "Password"
            cell.model = "Email"
            //            emailValidation(cell.emailTextField, cell.passwordTextField)
            
            cell.signInButton.setTitle("Sign In", for: .normal)
            cell.signInButton = UIButton(style: .sighUpButtonStyle)
            
            cell.signInButton.addTarget(self, action: #selector(cell.signInTapped), for: .touchUpInside)
            cell.signUpButton.addTarget(self, action: #selector(cell.signInTapped), for: .touchUpInside)
            
            cell.signUpButton.setTitle("Sign Up", for: .normal)
            cell.signUpButton = UIButton(style: .sighUpButtonStyle)
            return cell
            
        default:
            fatalError("Index out of range")
        }
    }
    
    @objc func emailVa() {
        
    }
    
    @objc func emailValidation(_ emailField: UITextField, _ passwordField: UITextField) {
        
        
        // #1 link for AppDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // #2 create context
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        // #3 create entity description
        let entityDescription = NSEntityDescription.entity(forEntityName: "UserEntitiy", in: context)
        
        // #4 create object
        let managedObject = NSManagedObject(entity: entityDescription ?? NSEntityDescription(), insertInto: context)
        
        //#5 set value
        
        managedObject.setValue("@mail.ru", forKey: "email")
        managedObject.setValue(21, forKey: "age")
        
        let mail = managedObject.value(forKey: "email")
        let age = managedObject.value(forKey: "age")
        print("\(mail)\(age)")
        
        //#6 save data
        appDelegate.saveContext()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntitiy")
        
        
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let mail = result.value(forKey: "email") as? String {
                    self.mailArray.append(mail)
                }
                if let password = result.value(forKey: "password") as? String {
                    self.passwordArray.append(password)
                }
            }
        } catch {
            print(error)
        }
        
        
        if (mailArray.contains(emailField.text!)) {
            let mailIndex = mailArray.firstIndex(where: {
                $0 == emailField.text
            })
            
            if passwordArray[mailIndex!] == passwordField.text {
                self.navigationController?.pushViewController(SignUpViewController(), animated: true)
            }
        }
        else {
            let alert = UIAlertController(
                title: "Error",
                message: "Not found user with this email",
                preferredStyle: .alert
            )
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
}
