//
//  ChatPeripheral.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation
import CoreBluetooth

class ChatPeripheral: NSObject {
    
    fileprivate var peripheralServiceChat: CBService?
    var delegate: ChatRoomDelegate?
    let peripheral: CBPeripheral
    
    init(peripheral: CBPeripheral) {
        self.peripheral = peripheral
        
        super.init()
        
        self.peripheral.delegate = self
        self.peripheral.discoverServices(nil)
    }
    
    func sendMessage(_ message: Message) {
        peripheral.writeValue(message.text.data(using: .utf8)!, for: peripheralServiceChat!.characteristics!.last!, type: .withResponse)
    }
}

extension ChatPeripheral: CBPeripheralDelegate {
    internal func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let error = error {
            print("error: \(error)")
            return
        }
        
        let services = peripheral.services!
        print("Found \(services.count) services! :\(services)")
        peripheralServiceChat = services.last!
        
        peripheral.discoverCharacteristics(nil, for: peripheralServiceChat!)
    }
    
    internal func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let error = error {
            print("error: \(error)")
            return
        }
        
        let characteristics = service.characteristics
        print("Found \(characteristics!.count) characteristics!")
        
        peripheral.setNotifyValue(true, for: peripheralServiceChat!.characteristics!.last!)
    }
    
    internal func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("error: \(error)")
        } else {
            print("isNotifying: \(characteristic.isNotifying)")
            delegate!.chatLoadFinish()
        }
    }
    
    
    internal func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("error: \(error)")
            return
        }
        
        print("characteristic UUID: \(characteristic.uuid), value: \(String(describing: characteristic.value))")
        
     
        delegate!.receivedMessage(String(data: characteristic.value!, encoding: .utf8)!)
    }
}
