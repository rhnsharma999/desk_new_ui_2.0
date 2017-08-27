//
//  TabViewController.swift
//  Desk UI 2.0
//
//  Created by Rohan Lokesh Sharma on 27/08/17.
//  Copyright © 2017 webarch. All rights reserved.
//

import UIKit
import BATabBarController
class TabViewController: BATabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarBackgroundColor = Reusable.uparBg
        tabBarItemStrokeColor = .white
        setup()
    }

    func setup(){
        let vc = UINavigationController(rootViewController: ViewController())
        let a = BATabBarItem(image: #imageLiteral(resourceName: "class"), selectedImage: #imageLiteral(resourceName: "class"))
        let b = BATabBarItem(image: #imageLiteral(resourceName: "class"), selectedImage: #imageLiteral(resourceName: "class"))
        let c = BATabBarItem(image: #imageLiteral(resourceName: "class"), selectedImage: #imageLiteral(resourceName: "class"))
      
        
        viewControllers = [vc,ViewController(),ViewController()]
        tabBarItems = [a!,b!,c!]
    }

}
