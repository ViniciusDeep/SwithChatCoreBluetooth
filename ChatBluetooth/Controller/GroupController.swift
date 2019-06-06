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
    
    var messages = [MessageViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        groupView.sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
    
    
    @objc fileprivate func sendMessage() {
        if let message = groupView.messageTf.text {
            let mvm = MessageViewModel(message: Message(text: message, imageProfileUrl: ""))
            messages.append(mvm)
            groupView.tableView.reloadData()
        }
        let cells = groupView.tableView.visibleCells as! [ChatCell]
        cells.forEach { (cell) in
            print(cell.message.text)
        }
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
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groupView.tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ChatCell
        cell.message = messages[indexPath.row]
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
