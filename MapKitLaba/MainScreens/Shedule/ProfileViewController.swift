//
//  ProfileViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 10.10.2022.
//

import UIKit


class ProfileViewController: UIViewController {
    
    var welcomeLabel = UILabel(text: "Sveik! Hello!")
    var personImageView = RoundView()
    
//    var signUpButton = UIButton(title: "Sign up", titleColor: UIColor.blackColor(), backgroundColor: UIColor.whiteColor(), font: UIFont.avenir20()!, shadow: true)
    
    var nameLabel = UILabel(text: "Имя")
    var dateLabel = UILabel(text: "Дата")
    var agePasswordLabel = UILabel(text: "Возраст")
    var sexPasswordLabel = UILabel(text: "Пол")
    var instagramPasswordLabel = UILabel(text: "instagram")
    
    let nameTextField = OneLineTextField(text: "")
    let dateTextField = OneLineTextField(text: "")
    let agePasswordTextField = OneLineTextField(text: "")
    let sexTextField = OneLineTextField(text: "")
    let instagramTextField = OneLineTextField(text: "")
    
    let changePhotoButton = UIButton(title: "Изменить фото", titleColor: .systemGreen, backgroundColor: .clear, font: .systemFont(ofSize: 20), shadow: false)
    let cancelButton = UIButton(title: "Отмена", titleColor: .systemGreen, backgroundColor: .clear, font: .systemFont(ofSize: 20), shadow: false)
    let addButton = UIButton(title: "Добавить", titleColor: .systemGreen, backgroundColor: .clear, font: .systemFont(ofSize: 20), shadow: false)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpConstraints()
        personImageView.backgroundColor = .systemGreen
//        buttonsTapped()
        
    }
    
//    func buttonsTapped() {
//        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
//    }
//
//    @objc func signUpButtonTapped() {
//        print(#function)
//
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
//    }
//
//
//    func showAlert(alertTitle: String, actionTitle: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let alertAction = UIAlertAction(title: actionTitle, style: .default, handler: nil)
//        alert.addAction(alertAction)
//        present(alert, animated: true, completion: nil)
//
//    }
//
    
    func setUpConstraints() {
        
        let firstStackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        firstStackView.axis = .vertical
        firstStackView.spacing = 15
        self.view.addSubview(firstStackView)
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let secondStackView = UIStackView(arrangedSubviews: [dateLabel, dateTextField])
        secondStackView.axis = .vertical
        secondStackView.spacing = 15
        self.view.addSubview(secondStackView)
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let thirdStackView = UIStackView(arrangedSubviews: [agePasswordLabel, agePasswordTextField])
        thirdStackView.axis = .vertical
        thirdStackView.spacing = 15
        self.view.addSubview(thirdStackView)
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let fourStackView = UIStackView(arrangedSubviews: [sexPasswordLabel, sexTextField])
        fourStackView.axis = .vertical
        fourStackView.spacing = 15
        self.view.addSubview(fourStackView)
        fourStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let fiveStackView = UIStackView(arrangedSubviews: [instagramPasswordLabel, instagramTextField])
        fiveStackView.axis = .vertical
        fiveStackView.spacing = 15
        self.view.addSubview(fiveStackView)
        fiveStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [firstStackView, secondStackView, thirdStackView, fourStackView, fiveStackView])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        self.view.addSubview(stackView)
        self.view.addSubview(personImageView)
        self.view.addSubview(changePhotoButton)
        self.view.addSubview(cancelButton)
        self.view.addSubview(addButton)
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        changePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            personImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            personImageView.heightAnchor.constraint(equalToConstant: 150),
            personImageView.widthAnchor.constraint(equalToConstant: 150),
            personImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            changePhotoButton.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 20),
            changePhotoButton.heightAnchor.constraint(equalToConstant: 30),
            changePhotoButton.widthAnchor.constraint(equalToConstant: 200),
            changePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalToConstant: 120),
            addButton.leftAnchor.constraint(equalTo: view.leftAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            cancelButton.heightAnchor.constraint(equalToConstant: 30),
            cancelButton.widthAnchor.constraint(equalToConstant: 120),
            cancelButton.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}




//import SwiftUI
//
//struct ProfileViewController: PreviewProvider {
//
//    static var previews: some View {
//        ContainerView().edgesIgnoringSafeArea(.all)
//    }
//
//    struct ContainerView: UIViewControllerRepresentable {
//
//        let viewController = SignUpScreenViewController()
//
//        func makeUIViewController(context: UIViewControllerRepresentableContext<LogInScreenViewControllerProvider.ContainerView>) -> some UIViewController {
//            return viewController
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<LogInScreenViewControllerProvider.ContainerView>) {
//
//        }
//    }
//}
