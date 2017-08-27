//
//  CustomHeader.swift
//  Desk UI 2.0
//
//  Created by Rohan Lokesh Sharma on 27/08/17.
//  Copyright © 2017 webarch. All rights reserved.
//

import Foundation
import UIKit
class CustomHeader:UIView{

    var container:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = .white;
        view.layer.cornerRadius = 5
        return view;
    }()
    
    var profileImage:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true;
        view.image = #imageLiteral(resourceName: "avatar")
        return view;
    }()
    var nameLabel:UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.text = "Rohan Lokesh Sharma"
        return view;
    }()
    var emailLabel:UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.textColor = .lightGray
        view.text = "rhnsharma999@gmail.com"
        view.font = UIFont.systemFont(ofSize: 13)
        return view;
    }()
    override init(frame:CGRect){
        super.init(frame: frame)
        setupViews()
        setupProfile()
        backgroundColor = .clear
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CustomHeader{
    func setupViews(){
        addSubview(container)
        NSLayoutConstraint.activate([
            container.leftAnchor.constraint(equalTo: leftAnchor,constant:Reusable.header_padding_left_right),
            container.rightAnchor.constraint(equalTo: rightAnchor,constant:-Reusable.header_padding_left_right),
            container.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            container.bottomAnchor.constraint(equalTo: bottomAnchor,constant:-5)
            ])
        
        let seperator = UIView()
        seperator.translatesAutoresizingMaskIntoConstraints = false;
        seperator.backgroundColor = .lightGray
        container.addSubview(seperator)
        
        NSLayoutConstraint.activate([
            seperator.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            seperator.leftAnchor.constraint(equalTo: container.leftAnchor,constant: 15),
            seperator.rightAnchor.constraint(equalTo: container.rightAnchor,constant: -15),
            seperator.heightAnchor.constraint(equalToConstant: 0.5)
            ])
    }
    
    func setupProfile(){
        container.addSubview(profileImage)
        container.addSubview(nameLabel)
        container.addSubview(emailLabel)
        /*
         some math here
         total height = view_width / ratio
         half pe seperator hai so
         height /= 2;
         ab upar se aur neeche se 15 so image ka height is height - 30
         */
        var height:CGFloat = UIScreen.main.bounds.width / Reusable.header_width_ratio
        height -= 10
        height /= 2;
        height -= 30
        profileImage.layer.cornerRadius = height / 2
        NSLayoutConstraint.activate([
            profileImage.heightAnchor.constraint(equalToConstant: height),
            profileImage.widthAnchor.constraint(equalToConstant: height),
            profileImage.leftAnchor.constraint(equalTo: container.leftAnchor,constant:25),
            profileImage.topAnchor.constraint(equalTo: container.topAnchor,constant:15)
            ])
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor,constant:15),
            nameLabel.rightAnchor.constraint(equalTo: container.rightAnchor,constant:-15),
            nameLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor,constant:-10)
            ])
        NSLayoutConstraint.activate([
            emailLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor,constant:15),
            emailLabel.rightAnchor.constraint(equalTo: container.rightAnchor,constant:-15),
            emailLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor,constant:12)
            ])
        nameLabel.sizeToFit()
        emailLabel.sizeToFit()
        
    }
}
