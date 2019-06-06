//
//  ChatOwner.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation
import CoreBluetooth


class ChatOwner: NSObject {
    
    fileprivate var peripheralManager: CBPeripheralManager?
    fileprivate let characteristicChat = CBMutableCharacteristic(
        type: CBUUID.characteristicChatMessage,
        properties: [.notify, .read, .write],
        value: nil,
        permissions: [.readable, .writeable]
    )
    var delegate: ChatRoomDelegate?
    
    override init() {
        super.init()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    func sendMessage(_ message: Message) {
        peripheralManager!.updateValue(message.text.data(using: .utf8)!, for: characteristicChat, onSubscribedCentrals: nil)
    }
    
}

extension ChatOwner: CBPeripheralManagerDelegate {
    
    internal func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        let serviceUUID = CBUUID.serviceChat
        let service = CBMutableService(type: serviceUUID, primary: true)
        
        service.characteristics = [characteristicChat]
        peripheralManager!.add(service)
        
        let advertisementData = [CBAdvertisementDataLocalNameKey: "Test Device"]
        peripheralManager!.startAdvertising(advertisementData)
    }
    
    internal func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error {
            print("Failed to create a chat room... Error: \(error)")
            return
        }
        
        print("Succeeded to create a chat room!")
        delegate!.chatLoadFinish()
    }
    
    internal func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        if request.characteristic.uuid.isEqual(CBUUID.characteristicChatMessage) {
            request.value = characteristicChat.value
            
            peripheralManager!.respond(to: request, withResult: .success)
        }
    }
    
    internal func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        for request in requests {
            if request.characteristic.uuid.isEqual(CBUUID.characteristicChatMessage) {
                characteristicChat.value = request.value
                
                delegate!.receivedMessage(String(data: request.value!, encoding: .utf8)!)
            }
        }
        
        peripheralManager!.respond(to: requests[0], withResult: .success)
    }
}
