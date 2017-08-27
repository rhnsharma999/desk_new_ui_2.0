//
//  CustomCell.swift
//  Desk UI 2.0
//
//  Created by Rohan Lokesh Sharma on 27/08/17.
//  Copyright © 2017 webarch. All rights reserved.
//

import Foundation
import UIKit
class CustomCell:UITableViewCell{
    
    
    var highLight:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = Reusable.uparBg
        return view;
    }()
    
    lazy var container:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = .white;
        view.addSubview(self.highLight)
        
        NSLayoutConstraint.activate([
            self.highLight.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.highLight.topAnchor.constraint(equalTo: view.topAnchor),
            self.highLight.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.highLight.widthAnchor.constraint(equalToConstant: 7)
            ])
        view.clipsToBounds = true 
        view.layer.cornerRadius = 5
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CustomCell{
    func setupUI(){
        addSubview(container)
        NSLayoutConstraint.activate([
            container.leftAnchor.constraint(equalTo: leftAnchor,constant:15),
            container.rightAnchor.constraint(equalTo: rightAnchor,constant:-15),
            container.topAnchor.constraint(equalTo: topAnchor,constant:10),
            container.bottomAnchor.constraint(equalTo: bottomAnchor,constant:-10)
            ])
    }
}
