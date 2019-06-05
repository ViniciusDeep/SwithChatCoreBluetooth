//
//  MessageViewModel.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation


class MessageViewModel {
    let text: String
    let imageProfile: String
    init(message: Message) {
        self.text = message.text
        self.imageProfile = message.imageProfileUrl
    }
}
