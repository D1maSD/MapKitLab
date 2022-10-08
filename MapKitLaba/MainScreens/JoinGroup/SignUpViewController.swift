//
//  JoinScreenViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.10.2022.
//


import UIKit

class SignUpViewController: UIViewController {
    
    var welcomeLabel = UILabel(text: "Sveik! Hello!")
    
    
    var signUpButton = UIButton(title: "Sign up", titleColor: UIColor.black, backgroundColor: UIColor.white, font: UIFont.avenir20()!, shadow: true)
    var switcher = UISwitch()
    
    var emailLabel = UILabel(text: "Email")
    var passwordLabel = UILabel(text: "Password")
    var confirmPasswordLabel = UILabel(text: "Confirm password")
    var agreeWith = UILabel(text: "Agree with rules")
    
    let emailTextField = OneLineTextField(text: "")
    let passwordTextField = OneLineTextField(text: "")
    let confirmPasswordTextField = OneLineTextField(text: "")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpConstraints()
//        buttonsTapped()
        
    }
    
//    func buttonsTapped() {
//        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
//    }
    
    @objc func signUpButtonTapped() {
        print(#function)

//        AuthService.shared.signUpUser(email: emailTextField.text, password: passwordTextField.text, confirmPassword: confirmPasswordTextField.text, completion: { result in
//
//            switch result {
//            case .success(let success):
//                self.showAlert(alertTitle: "Success", actionTitle: "OK", message: "User was registered")
//            case .failure(let error):
//                self.showAlert(alertTitle: "Failure", actionTitle: "OK", message: error.localizedDescription)
//                print(error.localizedDescription)
//            }
//        })
    }
    
    
    func showAlert(alertTitle: String, actionTitle: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func setUpConstraints() {
        
        let firstStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        firstStackView.axis = .vertical
        firstStackView.spacing = 15
        self.view.addSubview(firstStackView)
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let secondStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
        secondStackView.axis = .vertical
        secondStackView.spacing = 15
        self.view.addSubview(secondStackView)
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let thirdStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField, ])
        thirdStackView.axis = .vertical
        thirdStackView.spacing = 15
        self.view.addSubview(thirdStackView)
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [firstStackView, secondStackView, thirdStackView])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        self.view.addSubview(stackView)
        self.view.addSubview(signUpButton)
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(agreeWith)
        self.view.addSubview(switcher)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        agreeWith.translatesAutoresizingMaskIntoConstraints = false
        switcher.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            agreeWith.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 35),
            agreeWith.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            agreeWith.widthAnchor.constraint(equalToConstant: 200)
//            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            switcher.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            switcher.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            switcher.heightAnchor.constraint(equalToConstant: 30),
            switcher.widthAnchor.constraint(equalToConstant: 50),
//            switcher.centerXAnchor.constraint(equalTo: agreeWith.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: agreeWith.bottomAnchor, constant: 80),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}




import SwiftUI

struct LogInScreenViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SignUpViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LogInScreenViewControllerProvider.ContainerView>) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<LogInScreenViewControllerProvider.ContainerView>) {
            
        }
    }
}


