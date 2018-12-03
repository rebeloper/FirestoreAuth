//
//  RootViewController.swift
//  FirestoreAuth
//
//  Created by Alex Nagy on 29/11/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit
import FirebaseAuth

class RootViewController: UITabBarController {
    
    var handler: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        setupViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handler = Auth.auth().addStateDidChangeListener({ (auth, user) in
            self.checkLoggedInUserStatus()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let handler = handler else { return }
        Auth.auth().removeStateDidChangeListener(handler)
    }
    
    
    fileprivate func checkLoggedInUserStatus() {
        DispatchQueue.main.async {
            if Auth.auth().currentUser == nil {
                let controller = WelcomeController()
                let navController = UINavigationController(rootViewController: controller)
                self.present(navController, animated: true, completion: nil)
                return
            }
        }
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


