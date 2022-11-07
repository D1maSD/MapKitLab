//
//  MainScreenViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.11.2022.
//  
//

import UIKit

//class MainScreenViewController: UIViewController {
//    
//    // MARK: - Lifecycle Methods
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    // MARK: - Properties
//    var presenter: ViewToPresenterMainScreenProtocol?
//    
//}
//
//extension MainScreenViewController: PresenterToViewMainScreenProtocol{
//    // TODO: Implement View Output Methods
//}













class MainScreenViewController: UIViewController, StartsFlowProtocol, SomeProtocol, PlayerCellProtocol{
    func didTapImageView(for cell: PlayerCell) {
        print(cell)
    }
    
    
    
    @objc func didTapFlow(for cell: Cell) {
        print(cell)
    }
    
//    @objc func didTapImageView(for cell: PlayerCell) {
//        print("PlayerCellProtocol")
//    }
    
    func didTapImageView(for flow: StartsFlow) {
        print("Tap")
        switch flow {
        case .shedule:
            print("Tap")
            let vc = SheduleLabRouter.createModule()
            self.navigationController?.pushViewController(vc, animated: true)
        case .player:
            print("Tap")
            let vc = PlayerRouter.createModule()
            self.navigationController?.pushViewController(vc, animated: true)
        case .map:
            print("Tap")
            let vc = MapKitRouter.createModule()
            self.navigationController?.pushViewController(vc, animated: true)
        case .news:
            print("Tap")
            let vc = NewsLabRouter.createModule()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
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
    var presenter: ViewToPresenterMainScreenProtocol?
    private var tableView = UITableView()
    
}

extension MainScreenViewController: PresenterToViewMainScreenProtocol{
    // TODO: Implement View Output Methods
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: MapCell = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            return cell
        case 1:
            let cell: PlayerCell = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
//            cell.delegateTwo = self
            return cell
        case 2:
            let cell: SheduleCellTwo = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            return cell
        case 3:
            let cell: ContactsCell = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            return cell
        
        default:
            fatalError("Index out of range")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
}

extension MainScreenViewController {
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MapCell.self, forCellReuseIdentifier: "\(MapCell.self)")
        tableView.register(SheduleCellTwo.self, forCellReuseIdentifier: "\(SheduleCellTwo.self)")
        tableView.register(PlayerCell.self, forCellReuseIdentifier: "\(PlayerCell.self)")
        tableView.register(ContactsCell.self, forCellReuseIdentifier: "\(ContactsCell.self)")
    }
}

















//class MainScreenViewController: UIViewController {
//
//    private var tableView = UITableView()
//    static var typeOf = Int()
//    public var typeWith = Int()
//
//    let navigation = UINavigationBar.appearance()
//
////    let attrs = [
////        NSAttributedString.Key.foregroundColor: UIColor.red,
////        NSAttributedString.Key.font: UIFont.logoTitleFont
////    ]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureTableView()
//        title = "More for you"
//
//        self.navigationController?.navigationBar.titleTextAttributes = [
//            NSAttributedString.Key.font: UIFont.logoTitleFont,
//
//        ]
////        self.navigationController?.navigationBar.titlea
////        UINavigationBar.appearance().titleTextAttributes = attrs
//
//
////        navigation.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.logoTitleFont]
//
//
//    }
//    func setupType(_ number: Int) {
//        self.typeWith = number
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = self.view.bounds
//    }
//
//    func configureTableView() {
//        self.view.addSubview(tableView)
//        tableView.separatorStyle = .none
//        tableView.allowsSelection = false
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(NewsCell.self, forCellReuseIdentifier: "\(NewsCell.self)")
//
//    }
//}
//
//extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.row {
//        case 0:
//            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
//            return cell
//        case 1:
//            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
//            return cell
//        case 2:
//            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
//            return cell
//        case 3:
//            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
//            return cell
//        case 4:
//            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
//            return cell
//        default:
//            fatalError("Index out of range")
//        }
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        5
//    }
//}
//
//
//
