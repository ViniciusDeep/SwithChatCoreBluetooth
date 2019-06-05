//
//  CBUUID+Extension.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation
import CoreBluetooth

extension CBUUID {
    static let serviceChat = CBUUID(string: "1000")
    static let characteristicChatMessage = CBUUID(string: "1001")
}
