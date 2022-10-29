//
//  NewsLabViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import UIKit

class NewsLabViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.logoTitleFont,
            
        ]
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }

    
    // MARK: - Properties
    var presenter: ViewToPresenterNewsLabProtocol?
    private var tableView = UITableView()
    
}

extension NewsLabViewController: PresenterToViewNewsLabProtocol{
    // TODO: Implement View Output Methods
}

extension NewsLabViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 1:
            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 2:
            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 3:
            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 4:
            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        default:
            fatalError("Index out of range")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
}

extension NewsLabViewController {
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BaseDescriptionCell.self, forCellReuseIdentifier: "\(BaseDescriptionCell.self)")
        tableView.register(BaseTextFieldCell.self, forCellReuseIdentifier: "\(BaseTextFieldCell.self)")
        tableView.register(SheduleCell.self, forCellReuseIdentifier: "\(SheduleCell.self)")
    }
}
