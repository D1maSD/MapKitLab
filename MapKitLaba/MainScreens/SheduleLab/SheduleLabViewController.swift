//
//  SheduleLabViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import UIKit

class SheduleLabViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterSheduleLabProtocol?
    
}

extension SheduleLabViewController: PresenterToViewSheduleLabProtocol{
    // TODO: Implement View Output Methods
}
