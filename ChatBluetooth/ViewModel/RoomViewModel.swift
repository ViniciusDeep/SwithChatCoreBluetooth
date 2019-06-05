//
//  ChatViewModel.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 05/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation

class RoomViewModel {
    let name: String
    let description: String
    let key: String?
    
    init(room: Room) {
        self.name = room.name
        self.description = room.name
        self.key = room.key
    }
}
