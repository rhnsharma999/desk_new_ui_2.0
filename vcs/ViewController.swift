//
//  ViewController.swift
//  Desk UI 2.0
//
//  Created by Rohan Lokesh Sharma on 27/08/17.
//  Copyright © 2017 webarch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var tableHeader:CustomHeader = {
        let view = CustomHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width / Reusable.header_width_ratio))
        return view;
    }()
    
    lazy var myTableView:UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.delegate = self;
        view.dataSource = self;
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.backgroundColor = .clear
        view.tableHeaderView = self.tableHeader
        return view;
    }()
    
    var uparWala:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = Reusable.uparBg
        return view;
    }()
    
    override func viewDidLoad() {
        setupView()
        view.backgroundColor = Reusable.viewBg
        myTableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        navigationItem.title = "Desk"
        super.viewDidLoad()
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.backgroundColor = .clear
        cell?.textLabel?.text = "rohan sharma";
        return cell!
    }
}

extension ViewController{
    func setupView(){
        view.addSubview(uparWala)
        view.addSubview(myTableView)
        
        NSLayoutConstraint.activate([
            uparWala.leftAnchor.constraint(equalTo: view.leftAnchor),
            uparWala.rightAnchor.constraint(equalTo: view.rightAnchor),
            uparWala.topAnchor.constraint(equalTo: view.topAnchor),
            uparWala.heightAnchor.constraint(equalToConstant: 100)
            ])
        NSLayoutConstraint.activate([
            myTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            myTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            myTableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            myTableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
            ])
    }
}

