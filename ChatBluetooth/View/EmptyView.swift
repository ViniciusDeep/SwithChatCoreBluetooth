//
//  EmptyView.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class EmptyView: UIView, ConfigurableView {
   
    fileprivate lazy var emptyImage = UIImageView(imageName: "empty")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildViewHierarchy() {
        addSubview(emptyImage)
    }
    
    func setupConstraints() {
        emptyImage.fillSuperview()
    }
}
