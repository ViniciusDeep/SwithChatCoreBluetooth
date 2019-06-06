//
//  CreateGroup.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 03/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CreateGroupView: UIView, ConfigurableView {
    lazy var nameGroup = UILabel(text: "Name of group", textSize: 16, textColor: .background)
    
    lazy var nameTf = UITextField(placeholder: "Set your name of Group")
    
    lazy var descriptionGroup = UILabel(text: "Description of group", textSize: 16, textColor: .background)
    
    lazy var descriptionTf = UITextField(placeholder: "Set the description of Group")
    
    lazy var keyGroup = UILabel(text: "Key group(Optional)", textSize: 16, textColor: .background)
    
    lazy var keyGroupTf = UITextField(placeholder: "Set the key")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(nameGroup)
        self.addSubview(nameTf)
        self.addSubview(descriptionGroup)
        self.addSubview(descriptionTf)
        self.addSubview(keyGroup)
        self.addSubview(keyGroupTf)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
                self.nameGroup.topAnchor.constraint(equalTo: self.topAnchor),
                self.nameGroup.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                self.nameTf.topAnchor.constraint(equalTo: nameGroup.bottomAnchor, constant: 10),
                self.nameTf.leadingAnchor.constraint(equalTo: nameGroup.leadingAnchor),
                self.nameTf.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                self.descriptionGroup.topAnchor.constraint(equalTo: self.nameTf.bottomAnchor, constant: 10),
                self.descriptionGroup.leadingAnchor.constraint(equalTo: self.nameGroup.leadingAnchor),
                self.descriptionTf.topAnchor.constraint(equalTo: descriptionGroup.bottomAnchor, constant: 10),
                self.descriptionTf.leadingAnchor.constraint(equalTo: nameGroup.leadingAnchor),
                self.descriptionTf.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                self.keyGroup.topAnchor.constraint(equalTo: self.descriptionTf.bottomAnchor, constant: 10),
                self.keyGroup.leadingAnchor.constraint(equalTo: self.nameGroup.leadingAnchor),
        self.keyGroupTf.topAnchor.constraint(equalTo:keyGroup.bottomAnchor, constant: 10),
                self.keyGroupTf.leadingAnchor.constraint(equalTo: nameGroup.leadingAnchor),
                self.keyGroupTf.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            ])
    }
}
