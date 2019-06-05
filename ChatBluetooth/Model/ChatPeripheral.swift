//
//  ChatPeripheral.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation
import CoreBluetooth

class ChatRoomPeripheral: NSObject {
    
    fileprivate var peripheralServiceChat: CBService?
    var delegate: ChatRoomDelegate?
    let peripheral: CBPeripheral
    
    init(peripheral: CBPeripheral) {
        self.peripheral = peripheral
        
        super.init()
        
        self.peripheral.delegate = self
        self.peripheral.discoverServices(nil)
    }
    
    func sendMessage(_ text: String) {
        peripheral.writeValue(text.data(using: .utf8)!, for: peripheralServiceChat!.characteristics!.last!, type: .withResponse)
    }
}

extension ChatRoomPeripheral: CBPeripheralDelegate {
    // Esses três métodos são para reconhecer o bluetooth periférico, os services e characteristics.
    // Eles são executados encadeamente.
    // Nós precisamos ao atributo peripheralServiceChat o serviço de chat e também as characteristics dele.
    
    internal func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let error = error {
            print("error: \(error)")
            return
        }
        
        let services = peripheral.services!
        print("Found \(services.count) services! :\(services)")
        peripheralServiceChat = services.last! // TODO: preciso garantir que realmente vá atribuir o <CBService: 0x170264900, isPrimary = YES, UUID = 1000>
        
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
            delegate!.chatLoadFinish() // Terminamos de instanciar o atributo peripheralServiceChat, todo o serviço de chat foi carregado
        }
    }
    
    // Delegate chamado quando o valor de um characteristic for alterado
    internal func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("error: \(error)")
            return
        }
        
        print("characteristic UUID: \(characteristic.uuid), value: \(String(describing: characteristic.value))")
        
        // TODO: Esse delegate só é para ser chamado quando o uuid do characteristic for igual ao valor do CBUUID.characteristicChatMessage
        delegate!.receivedMessage(String(data: characteristic.value!, encoding: .utf8)!)
    }
}
