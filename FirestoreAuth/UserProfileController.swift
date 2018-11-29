//
//  UserProfileController.swift
//  FirebaseAuthentication
//
//  Created by Alex Nagy on 14/02/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit
import TinyConstraints
import JGProgressHUD

class UserProfileController: UIViewController {
    
    let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .light)
        hud.interactionType = .blockAllTouches
        return hud
    }()
    
    let profileImageViewHeight: CGFloat = 78
    lazy var profileImageView: UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = Service.baseColor
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = profileImageViewHeight / 2
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "User's Name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let uidLabel: UILabel = {
        let label = UILabel()
        label.text = "User's Uid"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "User's Email"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "User Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(handleSignOutButtonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Fetch User", style: .done, target: self, action: #selector(handleFetchUserButtonTapped))
        
        setupViews()
        fetchCurrentUser()
    }
    
    @objc func handleFetchUserButtonTapped() {
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
        
    }
    
    @objc func handleSignOutButtonTapped() {
        let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive) { (action) in
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        SparkService.showAlert(style: .actionSheet, title: nil, message: nil, actions: [signOutAction, cancelAction], completion: nil)
    }
    
    fileprivate func setupViews() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(uidLabel)
        view.addSubview(emailLabel)
        
        profileImageView.topToSuperview(offset: 10, usingSafeArea: true)
        profileImageView.leftToSuperview(offset: 10, usingSafeArea: true)
        profileImageView.width(profileImageViewHeight)
        profileImageView.height(profileImageViewHeight)
        
        nameLabel.topToSuperview(offset: 10, usingSafeArea: true)
        nameLabel.leftToRight(of: profileImageView, offset: 10)
        nameLabel.rightToSuperview(offset: 10, usingSafeArea: true)
        
        uidLabel.topToBottom(of: nameLabel, offset: 8)
        uidLabel.leftToRight(of: profileImageView, offset: 10)
        uidLabel.rightToSuperview(offset: 10, usingSafeArea: true)
        
        emailLabel.topToBottom(of: uidLabel, offset: 4)
        emailLabel.leftToRight(of: profileImageView, offset: 10)
        emailLabel.rightToSuperview(offset: 10, usingSafeArea: true)
        
    }
    
    
}

