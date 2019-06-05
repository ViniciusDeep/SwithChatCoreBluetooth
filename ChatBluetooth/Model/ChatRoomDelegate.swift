//
//  ChatRoomDelegate.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation

protocol ChatRoomDelegate: class {
    func receivedMessage(_ message: String)
    func chatLoadFinish()
}
