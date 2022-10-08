//
//  SignInViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.09.2022.
//

import UIKit
import SnapKit


class SignUpViewControllerTwo: UIViewController {
    
    private var tableView = UITableView()
    static var typeOf = Int()
    public var typeWith = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }
    func setupType(_ number: Int) {
        self.typeWith = number
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BaseDescriptionCell.self, forCellReuseIdentifier: "\(BaseDescriptionCell.self)")
        tableView.register(BaseTextFieldCell.self, forCellReuseIdentifier: "\(BaseTextFieldCell.self)")
        tableView.register(BaseButtonStyle.self, forCellReuseIdentifier: "\(BaseButtonStyle.self)")
        
    }
}



extension SignUpViewControllerTwo: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: BaseDescriptionCell = tableView.dequeueReusableCell(for: indexPath)
            cell.descLabel.text = "Sign up"
            return cell
        case 1:
            let cell: BaseTextFieldCell = tableView.dequeueReusableCell(for: indexPath)
            cell.model = "Login"
            return cell
        case 2:
            let cell: BaseTextFieldCell = tableView.dequeueReusableCell(for: indexPath)
            cell.model = "Email"
            return cell
        case 3:
            let cell: BaseTextFieldCell = tableView.dequeueReusableCell(for: indexPath)
            cell.model = "Password"
            return cell
        case 4:
            let cell: BaseTextFieldCell = tableView.dequeueReusableCell(for: indexPath)
            cell.model = "Confirm password"
            return cell
        case 5:
            let cell: BaseButtonStyle = tableView.dequeueReusableCell(for: indexPath)
            cell.button.setTitle("Sign Up", for: .normal)
            cell.button = UIButton(style: .sighUpButtonStyle)
            cell.button.backgroundColor = .darkRoundedButtonColor
            return cell
        case 6:
            let cell: AgreeWithRulesSwift = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 7:
            let cell: BaseButtonStyle = tableView.dequeueReusableCell(for: indexPath)
            cell.button.setTitle("Sign Up", for: .normal)
            cell.button = UIButton(style: .sighUpButtonStyle)
            cell.button.backgroundColor = .darkRoundedButtonColor
            return cell
        default:
            fatalError("Index out of range")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
}
