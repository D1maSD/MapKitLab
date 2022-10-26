//
//  TodayViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit
import SnapKit


class TodayViewController: UIViewController {
    
    private var tableView = UITableView()
    static var typeOf = Int()
    public var typeWith = Int()
    
    let navigation = UINavigationBar.appearance()
    
//    let attrs = [
//        NSAttributedString.Key.foregroundColor: UIColor.red,
//        NSAttributedString.Key.font: UIFont.logoTitleFont
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "More for you"
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.logoTitleFont,
            
        ]
//        self.navigationController?.navigationBar.titlea
//        UINavigationBar.appearance().titleTextAttributes = attrs
        
        
//        navigation.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.logoTitleFont]

        
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
        tableView.register(NewsCell.self, forCellReuseIdentifier: "\(NewsCell.self)")
        
    }
}

extension TodayViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        5
    }
}
