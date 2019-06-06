//
//  GroupView.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class GroupView: UIView, ConfigurableView {    
    lazy var tableView: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.tableFooterView = UIView()
        table.allowsSelection = false
        return table
    }()
    
    lazy var messageTf = UITextField(placeholder: "Type you message to send")
    lazy var sendButton = UIButton(title: ">")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(tableView)
        self.addSubview(messageTf)
        self.addSubview(sendButton)
        messageTf.backgroundColor = .background
        messageTf.tintColor = .white
        messageTf.textColor = .white
        sendButton.backgroundColor = .background
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.messageTf.topAnchor, constant: -10),
            self.messageTf.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            self.messageTf.heightAnchor.constraint(equalToConstant: 50),
            self.messageTf.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.messageTf.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.sendButton.leadingAnchor.constraint(equalTo: self.messageTf.trailingAnchor, constant: 10),
            self.sendButton.bottomAnchor.constraint(equalTo: self.messageTf.bottomAnchor),
            self.sendButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            self.sendButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
