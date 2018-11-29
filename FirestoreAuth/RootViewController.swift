//
//  RootViewController.swift
//  FirestoreAuth
//
//  Created by Alex Nagy on 29/11/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        setupViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    fileprivate func checkLoggedInUserStatus() {
    }
    
    fileprivate func setupViewControllers() {
        tabBar.unselectedItemTintColor = Service.unselectedItemColor
        tabBar.tintColor = Service.darkBaseColor
        
        let homeController = HomeController()
        let homeNavigationController = UINavigationController(rootViewController: homeController)
        homeNavigationController.tabBarItem.image = #imageLiteral(resourceName: "MainTabBarItemHome").withRenderingMode(.alwaysTemplate)
        homeNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "MainTabBarItemHome").withRenderingMode(.alwaysTemplate)
        
        let userProfileController = UserProfileController()
        let userProfileNavigationController = UINavigationController(rootViewController: userProfileController)
        userProfileNavigationController.tabBarItem.image = #imageLiteral(resourceName: "MainTabBarItemProfile").withRenderingMode(.alwaysTemplate)
        userProfileNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "MainTabBarItemProfile").withRenderingMode(.alwaysTemplate)
        
        viewControllers = [homeNavigationController, userProfileNavigationController]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}


