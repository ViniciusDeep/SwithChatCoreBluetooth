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
    func connectChatRoomSucceeded(chatRoomPeripheral: ChatRoomPeripheral)
    func connectChatRoomFailed(error: Error?)
}


class Chat {
    
    let delegate: ChatDelegate
    
    init(delegate: ChatDelegate) {
        self.delegate = delegate
        CentralBluetooth.shared.attachObserverPeripheralsList(self as! ObserverPeripheralsList)
    }
    
    
    /**
     Método para se conectar à uma sala de chat. Será chamado o delegate connectChatRoomSucceeded(chatRoomPeripheral:) em caso de sucesso ou o connectChatRoomFailed(error:) em caso de falha.
     
     - Parameter peripheral: Periférico da sala de chat a se conectar
     */
    func connect(in peripheral: CBPeripheral) {
        // TODO: Só deve tentar realizar a conexão se o dispositivo bluetooth for de fato de uma sala de chat. Uma possibilidade seria mudar o tipo do parâmetro de entrada, de "CBPeripheral" para um novo subtipo
        
        CentralBluetooth.shared.connect(in: peripheral) { peripheral, error in
            if let error = error {
                self.delegate.connectChatRoomFailed(error: error)
                return
            }
            
            let chatRoomPeripheral = ChatRoomPeripheral(peripheral: peripheral)
            self.delegate.connectChatRoomSucceeded(chatRoomPeripheral: chatRoomPeripheral)
        }
    }
}

extension Chat: ObserverPeripheralsList {
    
    internal func update() {
        // TODO: Só deve chamar o delegate com os dispositivos bluetooth que forem de sala de chat, e retorná-los ao delegate
        self.delegate.newPeripheralDiscoved()
    }
}

