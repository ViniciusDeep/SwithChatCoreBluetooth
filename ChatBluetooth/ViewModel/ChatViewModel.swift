//
//  ChatViewModel.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation
import CoreBluetooth
import UIKit

class ChatViewModel {
    let chat: Chat?
    
    init(chat: Chat, delegate: UIViewController) {
        self.chat = Chat(delegate: delegate as! ChatDelegate)
    }
}
