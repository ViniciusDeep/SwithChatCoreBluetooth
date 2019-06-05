//
//  UIViewComponents+Extensions.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 03/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit


extension UIImageView {
    convenience init(imageName: String) {
        self.init()
        self.image = UIImage(named: imageName)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleToFill
    }
}

extension UIView {
    convenience init(with blur: CGFloat) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = blur
        self.backgroundColor = .black
        self.layer.cornerRadius = 16
    }
}

extension UILabel {
    convenience init(text: String, textSize: CGFloat, textColor: UIColor) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = textColor
        self.font = UIFont.boldSystemFont(ofSize: textSize)
    }
}

extension UITextField {
    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
        self.font = UIFont.boldSystemFont(ofSize: 14)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.borderStyle = .roundedRect
    }
}


extension UIButton {
    convenience init(imageNamed: String) {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(UIImage(named: imageNamed), for: .normal)
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font =  UIFont(name: "Helvetica", size: 20)
        self.setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.4745098039, blue: 0.8431372549, alpha: 1)
        self.layer.borderColor = UIColor.white.cgColor
    }
}
