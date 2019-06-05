//
//  ChatCell.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell, ConfigurableView {
    var message: MessageViewModel! {
        didSet {
            messageLabel.text = message.text
        }
    }
    
    lazy var imageSend = UIImageView(imageName: "profile")
    lazy var messageLabel = UILabel(text: "Conectou via bluetooth", textSize: 16, textColor: .black)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildViewHierarchy() {
        imageSend.clipsToBounds = true
        imageSend.layer.cornerRadius = 8
        self.addSubview(imageSend)
        self.addSubview(messageLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageSend.heightAnchor.constraint(equalToConstant: 65),
            self.imageSend.widthAnchor.constraint(equalToConstant: 65),
            self.imageSend.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageSend.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.messageLabel.leadingAnchor.constraint(equalTo: self.imageSend.trailingAnchor, constant: 10),
            self.messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
    
}
