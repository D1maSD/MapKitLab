//
//  SheduleViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit
import SnapKit


class SheduleViewController: UIViewController {
    
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
        tableView.register(SheduleCell.self, forCellReuseIdentifier: "\(SheduleCell.self)")
        
    }
}



extension SheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        8
    }
}
