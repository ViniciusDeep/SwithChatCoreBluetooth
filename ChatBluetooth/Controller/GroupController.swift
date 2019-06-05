//
//  GroupController.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class GroupController: UIViewController {
    
    fileprivate let groupView = GroupView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    fileprivate func setupView() {
        view.addSubview(groupView)
        view.backgroundColor = .white
        self.groupView.fillSuperview()
    }
    
}

extension GroupController: UITableViewDataSource, UITableViewDelegate {
    fileprivate func setupTableView() {
        groupView.tableView.register(ChatCell.self, forCellReuseIdentifier: "cellId")
        groupView.tableView.delegate = self
        groupView.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groupView.tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ChatCell
        
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
