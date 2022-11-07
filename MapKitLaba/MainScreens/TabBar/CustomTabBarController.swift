//
//  CustomTabBarController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit


// create tabBarController

class CustomTabBarController: UITabBarController {
    
    let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        middleButton()
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.backgroundColor = .systemGray
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = UIScreen.main.bounds.width / 4
//        self.tabBar.items?[1].titlePositionAdjustment = UIOffset(horizontal: -15, vertical: 0)
//        self.tabBar.items?[2].titlePositionAdjustment = UIOffset(horizontal: 15, vertical: 0)
        
        
//        self.tabBar.isTranslucent = true
        
        viewControllers = [
            generateNavigationController(controller: NewsLabRouter.createModule(), image: UIImage(named: "today") ?? UIImage()),
            generateNavigationController(controller: PlaylistViewController(), image: UIImage(named: "gridicons") ?? UIImage()),
            generateNavigationController(controller: MapKitRouter.createModule(), image: UIImage(named: "zond") ?? UIImage()),
            generateNavigationController(controller: SheduleLabRouter.createModule(), image: UIImage(named: "zond") ?? UIImage()),
            generateNavigationController(controller: ProfileScreenViewController(), image: UIImage(named: "zond") ?? UIImage()),
            generateNavigationController(controller: PlayerViewController(), image: UIImage(named: "zond") ?? UIImage()),
            generateNavigationController(controller: CurrentNewsRouter.createModule(), image: UIImage(named: "zond") ?? UIImage()),
            generateNavigationController(controller: FollowingNewsModuleRouter.createModule(), image: UIImage(named: "zond") ?? UIImage()),
            generateNavigationController(controller: SignUpRouter.createModule(), image: UIImage(named: "today") ?? UIImage()),
            generateNavigationController(controller: SignInRouter.createModule(), image: UIImage(named: "gridicons") ?? UIImage()),
            generateNavigationController(controller: SheduleLabRouter.createModule(), image: UIImage(named: "today") ?? UIImage()),
            generateNavigationController(controller: MainScreenRouter.createModule(), image: UIImage(named: "gridicons") ?? UIImage())
            
        ]
    }
    
    func middleButton() {
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 25, y: 10, width: 60, height: 60))
        middleButton.setBackgroundImage(UIImage(named: "middleButton"), for: .normal)
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.1
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.tabBar.bringSubviewToFront(middleButton)
        middleButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
    }
    
    func generateNavigationController(controller: UIViewController,
                                      image: UIImage) ->
    UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.tabBarItem.image = image
        return navigationController
    }
}
