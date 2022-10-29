//
//  SheduleLabViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import UIKit

class SheduleLabViewController: UIViewController {
    
    
    // MARK: - Properties
    var presenter: ViewToPresenterSheduleLabProtocol?
    private var tableView = UITableView()
    static var typeOf = Int()
    public var typeWith = Int()
    
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }

}

extension SheduleLabViewController: PresenterToViewSheduleLabProtocol{
    // TODO: Implement View Output Methods
}


extension SheduleLabViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: SheduleCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 1:
            let cell: SheduleCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 2:
            let cell: SheduleCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 3:
            let cell: SheduleCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 4:
            let cell: SheduleCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 5:
            let cell: SheduleCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 6:
            let cell: SheduleCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 7:
            let cell: SheduleCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        default:
            fatalError("Index out of range")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
}

extension SheduleLabViewController {
    
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
