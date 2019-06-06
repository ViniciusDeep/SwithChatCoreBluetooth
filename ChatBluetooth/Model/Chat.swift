//
//  Chat.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation
import CoreBluetooth


protocol ChatDelegate: class {
    func newPeripheralDiscoved()
    func connectChatRoomSucceeded(chatRoomPeripheral: ChatPeripheral)
    func connectChatRoomFailed(error: Error?)
}


class Chat {
    
    let delegate: ChatDelegate
    
    init(delegate: ChatDelegate) {
        self.delegate = delegate
        CentralBluetooth.shared.attachObserverPeripheralsList(self as ObserverPeripheralsList)
    }
    
    func connect(in peripheral: CBPeripheral) {
        CentralBluetooth.shared.connect(in: peripheral) { peripheral, error in
            if let error = error {
                self.delegate.connectChatRoomFailed(error: error)
                return
            }
            
            let chatRoomPeripheral = ChatPeripheral(peripheral: peripheral)
            self.delegate.connectChatRoomSucceeded(chatRoomPeripheral: chatRoomPeripheral)
        }
    }
}

extension Chat: ObserverPeripheralsList {
    internal func update() {
        self.delegate.newPeripheralDiscoved()
    }
}

