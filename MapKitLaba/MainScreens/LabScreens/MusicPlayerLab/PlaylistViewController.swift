//
//  Playlist.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit
import SnapKit


class PlaylistViewController: UIViewController, TracsImageCellProtocol {
    func didTapImageView(for cell: TracsCell) {
        
       
        
        let viewControllelr = PlayerViewController()
        
//        let navigationController = UINavigationController(rootViewController: viewControllelr)
        
//        navigationController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        
        viewControllelr.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(viewControllelr, animated: true, completion: nil)
        
//        self.navigationController?.pushViewController(navigationController, animated: true)
    }
    
    
    
    private var tableView = UITableView()
    static var typeOf = Int()
    public var typeWith = Int()
    let height = CGFloat(10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    func setupType(_ number: Int) {
        self.typeWith = number
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.additionalSafeAreaInsets.top = 0

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
        self.navigationController?.navigationBar.frame.size = (self.navigationController?.navigationBar.sizeThatFits(CGSize(width: (self.navigationController?.navigationBar.frame.size.width)!, height: 54)))!
        
        
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        print(navigationBarHeight)
        
//        self.navigationController?.navigationBar.sizeThatFits(CGSize()
    }
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TracsCell.self, forCellReuseIdentifier: "\(TracsCell.self)")
        
    }
}



extension PlaylistViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: TracsCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 1:
            let cell: TracsCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 2:
            let cell: TracsCell = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            return cell
        case 3:
            let cell: TracsCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 4:
            let cell: TracsCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        default:
            fatalError("Index out of range")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
        switch indexPath.row {
        case 0:
            let viewController = PlayerViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        default:
            let viewController = PlayerViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension PlayerViewController: TracsImageCellProtocol {
    func didTapImageView(for cell: TracsCell) {
        let viewControllelr = PlayerViewController()
        self.navigationController?.pushViewController(viewControllelr, animated: true)
    }

}
