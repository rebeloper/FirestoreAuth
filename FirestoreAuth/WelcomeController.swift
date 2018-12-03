//
//  WelcomeController.swift
//  TestingFirestoreAuth
//
//  Created by Alex Nagy on 28/11/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit
import JGProgressHUD
import TinyConstraints

class WelcomeController: UIViewController {
    
    let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .light)
        hud.interactionType = .blockAllTouches
        return hud
    }()
    
    lazy var signInWithFacebookButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Login with Facebook", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: Service.buttonTitleFontSize)
        button.setTitleColor(Service.buttonTitleColor, for: .normal)
        button.backgroundColor = Service.buttonBackgroundColorSignInWithFacebook
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Service.buttonCornerRadius
        
        button.setImage(#imageLiteral(resourceName: "FacebookButton").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleAspectFit
        
        button.addTarget(self, action: #selector(handleSignInWithFacebookButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func handleSignInWithFacebookButtonTapped() {
        hud.textLabel.text = "Signing in with Facebook..."
        hud.show(in: view)
        Spark.signInWithFacebook(in: self) { (message, err, sparkUser) in
            if let err = err {
                SparkService.dismissHud(self.hud, text: "Error", detailText: "\(message) \(err.localizedDescription)", delay: 3)
                return
            }
            guard let sparkUser = sparkUser else {
                SparkService.dismissHud(self.hud, text: "Error", detailText: "Failed to fetch user", delay: 3)
                return
            }
            
            print("Successfully signed in with Facebook with Spark User: \(sparkUser)")
            SparkService.dismissHud(self.hud, text: "Success", detailText: "Successfully signed in with Facebook", delay: 3)
            let when = DispatchTime.now() + 3
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.dismiss(animated: true, completion: nil)
            })
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Wellcome"
        setupViews()
    }
    
    fileprivate func setupViews() {
        view.addSubview(signInWithFacebookButton)
        signInWithFacebookButton.centerInSuperview()
        signInWithFacebookButton.width(view.frame.width * 0.8)
        signInWithFacebookButton.height(50)
    }
}


