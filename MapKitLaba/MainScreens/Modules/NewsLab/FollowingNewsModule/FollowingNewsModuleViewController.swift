//
//  FollowingNewsModuleViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import UIKit

class FollowingNewsModuleViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let scrollView = UIScrollView(frame: CGRect(x: 10, y: 10, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
        view.addSubview(scrollView)
        scrollView.backgroundColor = .systemBlue
        
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        let buttonTwo = UIButton(frame: CGRect(x: 10, y: 1000, width: 100, height: 100))
        
        scrollView.addSubview(button)
        scrollView.addSubview(buttonTwo)
        button.backgroundColor = .systemGray
        buttonTwo.backgroundColor = .systemGray
        
    }

    // MARK: - Properties
    var presenter: ViewToPresenterFollowingNewsModuleProtocol?
    
}

extension FollowingNewsModuleViewController: PresenterToViewFollowingNewsModuleProtocol{
    // TODO: Implement View Output Methods
}
