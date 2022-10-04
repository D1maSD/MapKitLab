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
        tableView.register(AboutPlaceCell.self, forCellReuseIdentifier: "\(AboutPlaceCell.self)")
    }
}

extension AboutPlaceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            switch typeWith {
            case 0:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                return cell
            case 1:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                cell.shortNameLabel.text = NSLocalizedString("LUNACHARSKIY_TITLE", comment: "Flower annotation")
                cell.fullNameLabel.text = NSLocalizedString("LUNACHARSKIY_SUBTITLE", comment: "Flower annotation")
                cell.adressLabel.text = NSLocalizedString("LUNACHARSKIY_LOCATIONNAME", comment: "Flower annotation")
                return cell
            case 2:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                cell.shortNameLabel.text = NSLocalizedString("MUSSON_TITLE", comment: "Flower annotation")
                cell.fullNameLabel.text = NSLocalizedString("MUSSON_SUBTITLE", comment: "Flower annotation")
                cell.adressLabel.text = NSLocalizedString("MUSSON_LOCATIONNAME", comment: "Flower annotation")
                return cell
            case 3:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                cell.shortNameLabel.text = NSLocalizedString("MALAHOW_TITLE", comment: "Flower annotation")
                cell.fullNameLabel.text = NSLocalizedString("MALAHOW_SUBTITLE", comment: "Flower annotation")
                cell.adressLabel.text = NSLocalizedString("MALAHOW_LOCATIONNAME", comment: "Flower annotation")
                return cell
            case 4:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                cell.shortNameLabel.text = NSLocalizedString("SUBSHIPS_TITLE", comment: "Flower annotation")
                cell.fullNameLabel.text = NSLocalizedString("SUBSHIPS_SUBTITLE", comment: "Flower annotation")
                cell.adressLabel.text = NSLocalizedString("SUBSHIPS_LOCATIONNAME", comment: "Flower annotation")
                return cell
            case 5:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                cell.shortNameLabel.text = NSLocalizedString("CHERSONES_TITLE", comment: "Flower annotation")
                cell.fullNameLabel.text = NSLocalizedString("CHERSONES_SUBTITLE", comment: "Flower annotation")
                cell.adressLabel.text = NSLocalizedString("CHERSONES_LOCATIONNAME", comment: "Flower annotation")
                return cell
            case 6:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                cell.shortNameLabel.text = NSLocalizedString("PANORAMA_TITLE", comment: "Flower annotation")
                cell.fullNameLabel.text = NSLocalizedString("PANORAMA_SUBTITLE", comment: "Flower annotation")
                cell.adressLabel.text = NSLocalizedString("PANORAMA_LOCATIONNAME", comment: "Flower annotation")
                return cell
            case 7:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                cell.shortNameLabel.text = NSLocalizedString("CEMENTARY_TITLE", comment: "Flower annotation")
                cell.fullNameLabel.text = NSLocalizedString("CEMENTARY_SUBTITLE", comment: "Flower annotation")
                cell.adressLabel.text = NSLocalizedString("CEMENTARY_LOCATIONNAME", comment: "Flower annotation")
                return cell
            case 8:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                cell.shortNameLabel.text = NSLocalizedString("SEVSU_TITLE", comment: "Flower annotation")
                cell.fullNameLabel.text = NSLocalizedString("SEVSU_SUBTITLE", comment: "Flower annotation")
                cell.adressLabel.text = NSLocalizedString("SEVSU_LOCATIONNAME", comment: "Flower annotation")
                return cell
            case 9:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                cell.shortNameLabel.text = NSLocalizedString("OMEGA_TITLE", comment: "Flower annotation")
                cell.fullNameLabel.text = NSLocalizedString("OMEGA_SUBTITLE", comment: "Flower annotation")
                cell.adressLabel.text = NSLocalizedString("OMEGA_LOCATIONNAME", comment: "Flower annotation")
                return cell
            case 10:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                cell.shortNameLabel.text = NSLocalizedString("SEAMALL_TITLE", comment: "Flower annotation")
                cell.fullNameLabel.text = NSLocalizedString("SEAMAL_SUBTITLE", comment: "Flower annotation")
                cell.adressLabel.text = NSLocalizedString("SEAMAL_LOCATIONNAME", comment: "Flower annotation")
                return cell
            default:
                let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
                return cell
            }
        default:
          let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
          return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
}
