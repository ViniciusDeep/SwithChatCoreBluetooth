//
//  CreateGroupController.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 03/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CreateGroupController: UIViewController {
    
    lazy var listGroupView = CreateGroupView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
        setupView()
    }
    
    fileprivate func setupView() {
        self.view.addSubview(listGroupView)
        listGroupView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                listGroupView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
                listGroupView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                listGroupView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                listGroupView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
    }
    
    fileprivate func setupNavigation() {
        self.navigationItem.title = "Create your group"
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(returnToList))
        let createButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(returnToList))
        self.navigationItem.rightBarButtonItem = createButton
        self.navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc fileprivate func returnToList() {
        self.dismiss(animated: true, completion: nil)
    }
}
