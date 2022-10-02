//
//  AboutPlaceViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.09.2022.
//

import UIKit
import SnapKit


class AboutPlaceViewController: UIViewController {
    
    private var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        print("viewDidLoad()")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
        print("viewDidLayoutSubviews()")
    }
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AboutPlaceCell.self, forCellReuseIdentifier: "\(AboutPlaceCell.self)")
    }
}

extension AboutPlaceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
          let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
          return cell
        default:
          let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
          return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
}
