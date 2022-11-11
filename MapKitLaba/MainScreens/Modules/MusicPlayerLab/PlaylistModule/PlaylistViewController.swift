//
//  PlaylistViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import UIKit

class PlaylistViewController: UIViewController, TracsImageCellProtocol {
    
    
    func didTapImageView(for cell: Cell) {
        
        switch cell {
        case is TracsCell:
            print("some")
        default:
            print("no")
        }
        
        
//        print("Tap")
//        if let cel == cell as? TracsCell {
//
//            print("Tap")
//            let vc = SheduleLabRouter.createModule()
//            self.navigationController?.pushViewController(vc, animated: true)
             
        
//        print("didTapImageView")
//        let viewControllelr = PlayerViewController()
//        self.navigationController?.pushViewController(viewControllelr, animated: true)
    }
    
    
    //    @objc func didTapImageView(for cell: Cell) {
    //        <#code#>
    //    }
    //
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
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
    }
    
    
    //    @objc func didTapImageView(for cell: TracsCell) {
    //
    //        print("didTapImageView")
    //        let viewControllelr = PlayerViewController()
    //        self.navigationController?.pushViewController(viewControllelr, animated: true)
    //    }
    
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TracsCell.self, forCellReuseIdentifier: "\(TracsCell.self)")
        
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterPlaylistProtocol?
    
    private var tableView = UITableView()
    static var typeOf = Int()
    public var typeWith = Int()
    let height = CGFloat(10)
    
}

extension PlaylistViewController: PresenterToViewPlaylistProtocol{
    // TODO: Implement View Output Methods
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
            //            let viewController = PlayerViewController()
            //            self.navigationController?.pushViewController(viewController, animated: true)
            print("didSelectRowAt")
        case 1:
            //            let viewController = PlayerViewController()
            //            self.navigationController?.pushViewController(viewController, animated: true)
            print("didSelectRowAt")
        case 2:
            //            let viewController = PlayerViewController()
            //            self.navigationController?.pushViewController(viewController, animated: true)
            print("didSelectRowAt")
        default:
            //            let viewController = PlayerViewController()
            //            self.navigationController?.pushViewController(viewController, animated: true)
            print("didSelectRowAt")
        }
    }
}

//extension PlayerViewController: TracsImageCellProtocol {
//    func didTapImageView(for cell: TracsCell) {
//        let viewControllelr = PlayerViewController()
//        self.navigationController?.pushViewController(viewControllelr, animated: true)
//    }
//}






//@objc protocol DidTappedCell {
//    func cellDidTapped()
//}
//
//
//class SomeViewController: UIViewController, DidTappedCell {
//
//    func cellDidTapped() {
//        print("Cell was tapped")
//    }
//}
//
//class SomeCell: UITableViewCell {
//
//    weak var delegate: DidTappedCell?
//}
