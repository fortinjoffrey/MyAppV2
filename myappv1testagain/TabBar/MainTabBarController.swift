//
//  MainTabBarController.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 16/04/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        let trainingsNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: TrainingsController())
        
        let timerNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: TimerController())
        
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .purple
        let profileNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: vc3)
        
        
        tabBar.tintColor = .black
        
        viewControllers = [trainingsNavController,
                           timerNavController,
                           profileNavController]
        
        // modify tab bar item insets
        guard let items = tabBar.items else { return }
        for item in items {
            // push down icons 4 pixels from the top
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    private func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController  = UIViewController()) -> UINavigationController {
        
        let navController = CustomNavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
