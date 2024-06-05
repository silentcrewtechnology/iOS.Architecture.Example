//  Extension + UIViewController.swift
//  PaymentSocialServices
//
//  Created by firdavs on 07.05.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

extension UIViewController {

    func setTabBarTitle(with title: String?){
        tabBarItem.title = title
    }
    
    func setTabBarImage(with image: UIImage){
        tabBarItem.image = image
    }
    
    func setTabBar(with tabs: TabBarVCService.Tabs){
        tabBarItem.image = tabs.image()
        tabBarItem.title = tabs.name()
    }
    
    func setTitle(with title: NSAttributedString){
        let navLabel = UILabel()
        navLabel.attributedText = title
        navigationItem.titleView = navLabel
    }
}
